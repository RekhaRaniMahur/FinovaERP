using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        void LoadDashboardData()
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);

                con.Open();

                // TOTAL PRODUCTS

                SqlCommand cmd1 = new SqlCommand(
                    "SELECT COUNT(*) FROM Products",
                    con);

                int totalProducts = Convert.ToInt32(cmd1.ExecuteScalar());



                // TOTAL USERS

                SqlCommand cmd2 = new SqlCommand(
                    "SELECT COUNT(*) FROM Users",
                    con);

                int totalUsers = Convert.ToInt32(cmd2.ExecuteScalar());



                // TOTAL ORDERS


                SqlCommand cmd3 = new SqlCommand(
                    "SELECT COUNT(*) FROM Orders",
                    con);

                int totalOrders = Convert.ToInt32(cmd3.ExecuteScalar());



                // SUCCESS RATE

                int successRate = 99;



                // TOTAL REVENUE

                SqlCommand cmd4 = new SqlCommand(
                    "SELECT ISNULL(SUM(TotalAmount),0) FROM Orders",
                    con);

                decimal revenue = Convert.ToDecimal(cmd4.ExecuteScalar());



                // PENDING ORDERS

                SqlCommand cmd5 = new SqlCommand(
                    "SELECT COUNT(*) FROM Orders WHERE Status='Pending'",
                    con);

                int pendingOrders = Convert.ToInt32(cmd5.ExecuteScalar());



                // COMPLETED ORDERS

                SqlCommand cmd6 = new SqlCommand(
                    "SELECT COUNT(*) FROM Orders WHERE Status='Completed'",
                    con);

                int completedOrders = Convert.ToInt32(cmd6.ExecuteScalar());



                // LOW STOCK

                SqlCommand cmd7 = new SqlCommand(
                    "SELECT COUNT(*) FROM Products WHERE StockStatus='Low Stock'",
                    con);

                int lowStock = Convert.ToInt32(cmd7.ExecuteScalar());



                con.Close();



                // LABELS

                lblTotalProducts.Text = totalProducts.ToString();

                lblTotalUsers.Text = totalUsers.ToString();

                lblTotalOrders.Text = totalOrders.ToString();

                lblSuccessRate.Text = successRate + "%";

                lblRevenue.Text = "₹" + revenue.ToString();

                lblPendingOrders.Text = pendingOrders.ToString();

                lblCompletedOrders.Text = completedOrders.ToString();

                lblLowStock.Text = lowStock.ToString();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}
