using FinovaERP.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;

namespace FinovaERP
{

    public class ChatBotHandler : IHttpHandler, IRequiresSessionState
    {
        private static Dictionary<string, ChatSession> _sessions = new Dictionary<string, ChatSession>();

        public bool IsReusable => false;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";

            try
            {
                // Get question and session ID
                string question = context.Request.Form["question"];
                string sessionId = context.Request.Form["sessionId"];

                if (string.IsNullOrEmpty(sessionId))
                    sessionId = context.Session.SessionID;

                if (string.IsNullOrEmpty(question))
                {
                    context.Response.Write("{\"success\":false,\"message\":\"No question received\"}");
                    return;
                }

                // Get or create session
                if (!_sessions.ContainsKey(sessionId))
                    _sessions[sessionId] = new ChatSession();

                var session = _sessions[sessionId];

                // Get reply with context
                string reply = GetSmartReply(question, session);

                // Store in session
                session.LastQuestion = question;
                session.LastReply = reply;
                session.History.Add(new ChatMessage { Question = question, Reply = reply, Timestamp = DateTime.Now });

                // Keep only last 10 messages
                if (session.History.Count > 10)
                    session.History.RemoveAt(0);

                // Return JSON response
                string json = $"{{\"success\":true,\"answer\":\"{EscapeJson(reply)}\",\"sessionId\":\"{sessionId}\"}}";
                context.Response.Write(json);
            }
            catch (Exception ex)
            {
                context.Response.Write($"{{\"success\":false,\"error\":\"{EscapeJson(ex.Message)}\"}}");
            }
        }

        private string GetSmartReply(string question, ChatSession session)
        {
            question = question.ToLower();

            // 1. Check greeting
            if (question.Contains("hello") || question.Contains("hi") || question.Contains("hey"))
                return "Hello! 👋 I'm FinovaERP Assistant. How can I help you today?";

            // 2. Check SIP related
            if (question.Contains("sip") || question.Contains("monthly investment"))
                return GetSIPReply(question);

            // 3. Check EMI related
            if (question.Contains("emi") || question.Contains("loan"))
                return GetEMIReply(question);

            // 4. Check Tax related
            if (question.Contains("tax") || question.Contains("80c"))
                return GetTaxReply(question);

            // 5. Check Retirement
            if (question.Contains("retirement") || question.Contains("pension"))
                return GetRetirementReply(question);

            // 6. Check Reports
            if (question.Contains("report") || question.Contains("statement"))
                return GetReportReply(question);

            // 7. Check Login/Account
            if (question.Contains("login") || question.Contains("account") || question.Contains("register"))
                return GetAccountReply(question);

            // 8. Check context (user asking follow-up)
            if ((question.Contains("iska") || question.Contains("uska") || question.Contains("yeh")) && session.LastIntent != null)
                return GetContextReply(question, session);

            // 9. Default fallback
            return GetFallbackReply();
        }

        private string GetSIPReply(string question)
        {
            if (question.Contains("kya") || question.Contains("what"))
                return "SIP (Systematic Investment Plan) is a method to invest fixed amount regularly in mutual funds. 📈";

            if (question.Contains("minimum") || question.Contains("kitna"))
                return "SIP minimum amount ₹500 per month se start hota hai. 💰";

            if (question.Contains("return") || question.Contains("profit"))
                return "SIP average return historically 12-15% per annum raha hai. 📊";

            return "SIP Calculator helps you plan monthly investments. Want to calculate?";
        }

        private string GetEMIReply(string question)
        {
            if (question.Contains("kya") || question.Contains("what"))
                return "EMI (Equated Monthly Installment) is fixed payment amount for a loan. 🏦";

            if (question.Contains("calculate"))
                return "Use our EMI Calculator: Principal × Rate × (1+Rate)^Tenure / ((1+Rate)^Tenure - 1)";

            return "EMI Calculator helps you plan loan repayments. Want to calculate your EMI?";
        }

        private string GetTaxReply(string question)
        {
            if (question.Contains("80c"))
                return "Section 80C allows deduction up to ₹1.5 Lakh in PPF, ELSS, NSC, etc. 💰";

            if (question.Contains("save") || question.Contains("bachao"))
                return "Tax saving options: ELSS Mutual Funds, PPF, NPS, Life Insurance, Home Loan. 📋";

            return "We offer tax-saving investment options. Want to know more?";
        }

        private string GetRetirementReply(string question)
        {
            return "Retirement Calculator shows how much you need to save. Use our calculator for planning! 🎯";
        }

        private string GetReportReply(string question)
        {
            return "Reports available: Investment Report, EMI Report, Tax Report, Retirement Report. Which one? 📋";
        }

        private string GetAccountReply(string question)
        {
            if (question.Contains("login"))
                return "Click Login button at top right corner. 🔐";

            if (question.Contains("register"))
                return "New user? Click Login → Register to create account. ✨";

            return "Need help with login or registration? I can help!";
        }

        private string GetContextReply(string question, ChatSession session)
        {
            if (session.LastIntent == "SIP")
                return "SIP ke baare mein aur kya jaanna chahenge?";

            return $"Aapne pichli baar poochha tha: '{session.LastQuestion}'. Kya main usi ke baare mein help kar sakta hoon?";
        }

        private string GetFallbackReply()
        {
            string[] fallbacks = {
            "Main sirf FinovaERP ke financial tools ke baare mein jaanta hoon. SIP, EMI, Tax, Retirement mein se kya poochna chahenge?",
            "Kya aap SIP calculator, EMI planner, Tax saving, ya Retirement planning ke baare mein poochna chahte the?",
            "Mujhe ye samajh nahi aaya. Kya aap financial planning related kuch pooch sakte hain?"
        };

            Random rand = new Random();
            return fallbacks[rand.Next(fallbacks.Length)];
        }

        private string EscapeJson(string text)
        {
            if (string.IsNullOrEmpty(text)) return "";
            return text.Replace("\\", "\\\\")
                       .Replace("\"", "\\\"")
                       .Replace("\n", "\\n")
                       .Replace("\r", "\\r");
        }
    }

    // Session class for context memory
    public class ChatSession
    {
        public string LastQuestion { get; set; }
        public string LastReply { get; set; }
        public string LastIntent { get; set; }
        public List<ChatMessage> History { get; set; } = new List<ChatMessage>();
    }

    public class ChatMessage
    {
        public string Question { get; set; }
        public string Reply { get; set; }
        public DateTime Timestamp { get; set; }
    }
}
