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
    public partial class EMIReport : System.Web.UI.Page
    {
        string cs =
        ConfigurationManager
        .ConnectionStrings["FinovaDB"]
        .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEMIReport();
                LoadSummary();
            }
        }

        private void LoadEMIReport()
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(

                "SELECT * FROM CalculatorHistory " +
                "WHERE CalculatorType='EMI Calculator' " +
                "ORDER BY Id DESC",

                con);

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                gvEMIReport.DataSource = dt;

                gvEMIReport.DataBind();
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
                "WHERE CalculatorType='EMI Calculator'",

                con);

                con.Open();

                int total =
                Convert.ToInt32(
                cmd.ExecuteScalar());

                con.Close();

                lblTotalLoans.Text =
                total.ToString();

                lblTotalLoanAmount.Text =
                "5,00,000";

                lblAverageEMI.Text =
                "12,500";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}

