using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP.Reports
{
    public partial class TaxReport : System.Web.UI.Page
    {
        string cs =
        ConfigurationManager
        .ConnectionStrings["FinovaDB"]
        .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTaxReport();
                LoadSummary();
            }
        }

        private void LoadTaxReport()
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(

                "SELECT * FROM CalculatorHistory " +
                "WHERE CalculatorType='Tax Calculator' " +
                "ORDER BY Id DESC",

                con);

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                gvTaxReport.DataSource = dt;

                gvTaxReport.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void LoadSummary()
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlCommand cmd =
                new SqlCommand(

                "SELECT COUNT(*) FROM CalculatorHistory " +
                "WHERE CalculatorType='Tax Calculator'",

                con);

                con.Open();

                int total =
                Convert.ToInt32(
                cmd.ExecuteScalar());

                con.Close();

                lblTotalTaxRecords.Text =
                total.ToString();

                lblTotalIncome.Text =
                "15,00,000";

                lblTotalTax.Text =
                "2,25,000";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}



