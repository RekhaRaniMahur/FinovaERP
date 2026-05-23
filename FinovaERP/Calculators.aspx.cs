using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP
{
    public partial class Calculators : System.Web.UI.Page
    {
        SqlConnection con =
        new SqlConnection(
        ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // SIP CALCULATOR

        protected void btnSip_Click(object sender, EventArgs e)
        {
            if (txtSipAmount.Text == "" ||
                txtSipRate.Text == "" ||
                txtSipYears.Text == "")
            {
                lblSipResult.Text =
                "Please Fill All SIP Fields";

                return;
            }

            double monthlyInvestment =
            Convert.ToDouble(txtSipAmount.Text);

            double annualRate =
            Convert.ToDouble(txtSipRate.Text);

            int years =
            Convert.ToInt32(txtSipYears.Text);

            double monthlyRate =
            annualRate / 12 / 100;

            int months =
            years * 12;

            double futureValue =
            monthlyInvestment *
            ((Math.Pow(1 + monthlyRate, months) - 1)
            / monthlyRate)
            * (1 + monthlyRate);

            double investedAmount =
            monthlyInvestment * months;

            double profit =
            futureValue - investedAmount;

            lblSipResult.Text =

            "Invested Amount : ₹ " +
            investedAmount.ToString("N0")

            + "<br/>Profit Earned : ₹ " +
            profit.ToString("N0")

            + "<br/>Future Value : ₹ " +
            futureValue.ToString("N0");

            // SAVE DATABASE

            SaveCalculation(
            "SIP Calculator",

            "Monthly Investment = " + monthlyInvestment,

            "Rate = " + annualRate,

            "Years = " + years,

            "Future Value = " + futureValue);
        }

        // EMI CALCULATOR

        protected void btnEmi_Click(object sender, EventArgs e)
        {
            if (txtLoanAmount.Text == "" ||
                txtInterest.Text == "" ||
                txtMonths.Text == "")
            {
                lblEmiResult.Text =
                "Please Fill All EMI Fields";

                return;
            }

            double loanAmount =
            Convert.ToDouble(txtLoanAmount.Text);

            double annualInterest =
            Convert.ToDouble(txtInterest.Text);

            int months =
            Convert.ToInt32(txtMonths.Text);

            double monthlyInterest =
            annualInterest / 12 / 100;

            double emi =
            (loanAmount * monthlyInterest *
            Math.Pow(1 + monthlyInterest, months))
            /
            (Math.Pow(1 + monthlyInterest, months) - 1);

            double totalPayment =
            emi * months;

            double totalInterest =
            totalPayment - loanAmount;

            lblEmiResult.Text =

            "Monthly EMI : ₹ " +
            emi.ToString("N2")

            + "<br/>Total Interest : ₹ " +
            totalInterest.ToString("N2")

            + "<br/>Total Payment : ₹ " +
            totalPayment.ToString("N2");

            // SAVE DATABASE

            SaveCalculation(
            "EMI Calculator",

            "Loan Amount = " + loanAmount,

            "Interest = " + annualInterest,

            "Months = " + months,

            "EMI = " + emi);
        }

        // RETIREMENT CALCULATOR

        protected void btnRetirement_Click(object sender, EventArgs e)
        {
            if (txtRetirementMonthly.Text == "" ||
                txtRetirementRate.Text == "" ||
                txtRetirementYears.Text == "")
            {
                lblRetirementResult.Text =
                "Please Fill All Retirement Fields";

                return;
            }

            double monthlySaving =
            Convert.ToDouble(txtRetirementMonthly.Text);

            double annualRate =
            Convert.ToDouble(txtRetirementRate.Text);

            int years =
            Convert.ToInt32(txtRetirementYears.Text);

            double monthlyRate =
            annualRate / 12 / 100;

            int months =
            years * 12;

            double futureValue =
            monthlySaving *
            ((Math.Pow(1 + monthlyRate, months) - 1)
            / monthlyRate)
            * (1 + monthlyRate);

            lblRetirementResult.Text =

            "Retirement Corpus : ₹ " +
            futureValue.ToString("N0");

            // SAVE DATABASE

            SaveCalculation(
            "Retirement Calculator",

            "Monthly Saving = " + monthlySaving,

            "Rate = " + annualRate,

            "Years = " + years,

            "Corpus = " + futureValue);
        }

        // TAX CALCULATOR

        protected void btnTax_Click(object sender, EventArgs e)
        {
            if (txtIncome.Text == "" ||
                txtTaxRate.Text == "")
            {
                lblTaxResult.Text =
                "Please Fill All Tax Fields";

                return;
            }

            double income =
            Convert.ToDouble(txtIncome.Text);

            double taxRate =
            Convert.ToDouble(txtTaxRate.Text);

            double tax =
            income * taxRate / 100;

            double netIncome =
            income - tax;

            lblTaxResult.Text =

            "Estimated Tax : ₹ " +
            tax.ToString("N0")

            + "<br/>Net Income : ₹ " +
            netIncome.ToString("N0");

            // SAVE DATABASE

            SaveCalculation(
            "Tax Calculator",

            "Income = " + income,

            "Tax Rate = " + taxRate + "%",

            "",

            "Tax = " + tax +
            ", Net Income = " + netIncome);
        }

        // CLEAR BUTTON

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSipAmount.Text = "";
            txtSipRate.Text = "";
            txtSipYears.Text = "";

            txtLoanAmount.Text = "";
            txtInterest.Text = "";
            txtMonths.Text = "";

            txtRetirementMonthly.Text = "";
            txtRetirementRate.Text = "";
            txtRetirementYears.Text = "";

            txtIncome.Text = "";
            txtTaxRate.Text = "";

            lblSipResult.Text = "";
            lblEmiResult.Text = "";
            lblRetirementResult.Text = "";
            lblTaxResult.Text = "";
        }

        // SAVE METHOD
        private void SaveCalculation(
 string calculatorType,
 string input1,
 string input2,
 string input3,
 string result)
        {
            try
            {
                SqlCommand cmd =
                new SqlCommand(

                "INSERT INTO CalculatorHistory " +
                "(CalculatorType, Input1, Input2, Input3, Result) " +

                "VALUES " +

                "(@CalculatorType, @Input1, @Input2, @Input3, @Result)",

                con);

                cmd.Parameters.AddWithValue(
                "@CalculatorType",
                calculatorType);

                cmd.Parameters.AddWithValue(
                "@Input1",
                input1);

                cmd.Parameters.AddWithValue(
                "@Input2",
                input2);

                cmd.Parameters.AddWithValue(
                "@Input3",
                input3);

                cmd.Parameters.AddWithValue(
                "@Result",
                result);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
