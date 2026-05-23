using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP
{
    public partial class CalculatorHistory : System.Web.UI.Page
    {
        string cs =
        ConfigurationManager
        .ConnectionStrings["FinovaDB"]
        .ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHistory();
            }
        }

        // LOAD HISTORY

        private void LoadHistory()
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(

                "SELECT * FROM CalculatorHistory ORDER BY Id DESC",

                con);

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                gvHistory.DataSource = dt;

                gvHistory.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        // SEARCH HISTORY

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(

                "SELECT * FROM CalculatorHistory " +
                "WHERE CalculatorType LIKE @CalculatorType " +
                "ORDER BY Id DESC",

                con);

                da.SelectCommand.Parameters.AddWithValue(

                "@CalculatorType",

                "%" + txtSearch.Text + "%");

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                gvHistory.DataSource = dt;

                gvHistory.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        // DELETE SINGLE RECORD

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn =
                (LinkButton)sender;

                int id =
                Convert.ToInt32(
                btn.CommandArgument);

                SqlConnection con =
                new SqlConnection(cs);

                SqlCommand cmd =
                new SqlCommand(

                "DELETE FROM CalculatorHistory WHERE Id=@Id",

                con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                LoadHistory();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        // CLEAR ALL HISTORY

        protected void btnClearHistory_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con =
                new SqlConnection(cs);

                SqlCommand cmd =
                new SqlCommand(

                "DELETE FROM CalculatorHistory",

                con);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                LoadHistory();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
