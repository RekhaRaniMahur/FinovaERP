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
    public partial class InvestmentReport :
    System.Web.UI.Page
    {
        string cs =
        ConfigurationManager
        .ConnectionStrings["FinovaDB"]
        .ConnectionString;

        protected void Page_Load(
        object sender,
        EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadInvestmentReport();
            }
        }

        private void LoadInvestmentReport()
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(

                "SELECT * FROM CalculatorHistory " +
                "WHERE CalculatorType='SIP Calculator' " +
                "ORDER BY Id DESC",

                con);

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                gvInvestment.DataSource = dt;

                gvInvestment.DataBind();

                // TOTAL RECORDS

                lblTotalInvestments.Text =
                dt.Rows.Count.ToString();

                // SAMPLE STATIC VALUES

                lblTotalAmount.Text =
                "5,00,000";

                lblEstimatedReturns.Text =
                "2,50,000";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}



