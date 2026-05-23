using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP.Pages
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCounts();
                LoadRecentProducts();
            }
        }
        void LoadCounts()
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);

                con.Open();

                SqlCommand cmd1 =
                    new SqlCommand("SELECT COUNT(*) FROM Products", con);

                lblTotalProducts.Text =
                    cmd1.ExecuteScalar().ToString();

                SqlCommand cmd2 =
                    new SqlCommand("SELECT COUNT(*) FROM Users", con);

                lblTotalUsers.Text =
                    cmd2.ExecuteScalar().ToString();

                SqlCommand cmd3 =
                    new SqlCommand("SELECT COUNT(*) FROM Products WHERE Status='Active'", con);

                lblActiveProducts.Text =
                    cmd3.ExecuteScalar().ToString();

                SqlCommand cmd4 =
                    new SqlCommand("SELECT COUNT(*) FROM Products WHERE Quantity < 5", con);

                lblLowStock.Text =
                    cmd4.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        void LoadRecentProducts()
        {
            try
            {
                string cs =
                    ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);

                SqlDataAdapter da =
                    new SqlDataAdapter(
                    @"SELECT TOP 10
                        ProductName,
                        Category,
                        Price,
                        Quantity,
                        Status
                      FROM Products
                      ORDER BY ProductId DESC", con);

                DataTable dt = new DataTable();

                da.Fill(dt);

                gvReports.DataSource = dt;

                gvReports.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadCounts();

            LoadRecentProducts();
        }

        protected void btnProductReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Products.aspx");
        }

        protected void btnUserReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/Users.aspx");
        }

        protected void btnSalesReport_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Sales Report Opened');</script>");
        }


        protected void btnAnalytics_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Analytics Dashboard Coming Soon');</script>");
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            Response.Clear();

            Response.Buffer = true;

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=ProductReports.xls");

            Response.Charset = "";

            Response.ContentType =
                "application/vnd.ms-excel";

            StringWriter sw =
                new StringWriter();

            HtmlTextWriter hw =
                new HtmlTextWriter(sw);

            gvReports.AllowPaging = false;

            LoadRecentProducts();

            gvReports.RenderControl(hw);

            Response.Output.Write(sw.ToString());

            Response.Flush();

            Response.End();
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('PDF Export Coming Soon');</script>");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}

