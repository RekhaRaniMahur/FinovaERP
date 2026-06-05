using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;


namespace FinovaERP.Services
{
    public class GeminiService
    {
        private static readonly string apiKey = ConfigurationManager.AppSettings["GeminiApiKey"];

        private static readonly HttpClient client = new HttpClient();

        public static async Task<string> Ask(string question)
        {
            try
            {
                string prompt = $@"Tu FinovaERP ka AI Assistant hai.

FinovaERP ek financial ERP system hai. Isme ye features hain:
- Financial Calculators (SIP, EMI, Loan, Tax, Retirement)
- Reports (Investment, EMI, Tax, Retirement)
- Products (Mutual Funds, Insurance, Investment plans)
- Calculator History
- User Dashboard

Rules:
1. User kuch bhi puche, tu answer de
2. Hindi aur English mix (Hinglish) me jawab de
3. Friendly aur helpful reh

User ka sawaal: {question}

Jawab:";

                var requestBody = new
                {
                    contents = new[]
                    {
                        new
                        {
                            parts = new[]
                            {
                                new { text = prompt }
                            }
                        }
                    },
                    generationConfig = new
                    {
                        temperature = 0.7,
                        maxOutputTokens = 800
                    }
                };

                string url = $"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={apiKey}";

                var content = new StringContent(
                    JsonConvert.SerializeObject(requestBody),
                    Encoding.UTF8,
                    "application/json"
                );

                var response = await client.PostAsync(url, content);
                string result = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                {
                    return $" API Error: {result}";
                }

                dynamic json = JsonConvert.DeserializeObject(result);

                string answer = json?.candidates?[0]?.content?.parts?[0]?.text;

                if (string.IsNullOrEmpty(answer))
                {
                    return " Not correct again ask";
                }

                return answer.ToString();
            }
            catch (Exception ex)
            {
                return $" Error: {ex.Message}";
            }
        }
    }
}





