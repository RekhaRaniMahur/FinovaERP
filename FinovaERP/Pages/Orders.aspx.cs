using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP.Pages
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadProducts();
                LoadOrders();
            }
        }

        // LOAD PRODUCTS INTO DROPDOWN
        void LoadProducts()
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT ProductId, ProductName, Price FROM Products WHERE Status = 'Active'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                ddlProduct.DataSource = dt;
                ddlProduct.DataTextField = "ProductName";
                ddlProduct.DataValueField = "ProductName";
                ddlProduct.DataBind();
                ddlProduct.Items.Insert(0, new ListItem("-- Select Product --", ""));
            }
        }

        // LOAD ALL ORDERS INTO GRIDVIEW
        void LoadOrders()
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                    SELECT 
                        OrderId,
                        CustomerName,
                        ProductName,
                        Quantity,
                        TotalAmount,
                        PaymentMethod,
                        Status,
                        OrderDate
                    FROM Orders
                    ORDER BY OrderId DESC", con);

                DataTable dt = new DataTable();
                da.Fill(dt);
                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }

        // PRODUCT SELECTION CHANGE - GET PRICE
        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProduct.SelectedValue) && ddlProduct.SelectedValue != "-- Select Product --")
            {
                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Price FROM Products WHERE ProductName = @ProductName", con);
                    cmd.Parameters.AddWithValue("@ProductName", ddlProduct.SelectedValue);
                    con.Open();
                    object price = cmd.ExecuteScalar();
                    con.Close();

                    if (price != null)
                    {
                        txtUnitPrice.Text = Convert.ToDecimal(price).ToString("0.00");
                        CalculateTotal();
                    }
                }
            }
            else
            {
                txtUnitPrice.Text = "";
                txtAmount.Text = "";
            }
        }

        // QUANTITY CHANGE - CALCULATE TOTAL
        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            CalculateTotal();
        }

        // CALCULATE TOTAL AMOUNT
        private void CalculateTotal()
        {
            if (!string.IsNullOrEmpty(txtQuantity.Text) && !string.IsNullOrEmpty(txtUnitPrice.Text))
            {
                try
                {
                    decimal quantity = Convert.ToDecimal(txtQuantity.Text);
                    decimal price = Convert.ToDecimal(txtUnitPrice.Text);
                    decimal total = quantity * price;
                    txtAmount.Text = total.ToString("0.00");
                }
                catch (Exception)
                {
                    txtAmount.Text = "0.00";
                }
            }
            else
            {
                txtAmount.Text = "0.00";
            }
        }

        // SEARCH ORDERS
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(@"
                    SELECT 
                        OrderId,
                        CustomerName,
                        ProductName,
                        Quantity,
                        TotalAmount,
                        PaymentMethod,
                        Status,
                        OrderDate
                    FROM Orders
                    WHERE CustomerName LIKE '%'+@Search+'%' 
                    ORDER BY OrderId DESC", con);

                cmd.Parameters.AddWithValue("@Search", txtSearch.Text.Trim());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }

        // SHOW ALL ORDERS
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadOrders();
        }

        // RESET FORM
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFields();
            txtSearch.Text = "";
        }

        // ADD NEW ORDER
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                // VALIDATION
                if (string.IsNullOrEmpty(txtCustomer.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter customer name');", true);
                    return;
                }
                if (ddlProduct.SelectedValue == "" || ddlProduct.SelectedValue == "-- Select Product --")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a product');", true);
                    return;
                }
                if (string.IsNullOrEmpty(txtQuantity.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter quantity');", true);
                    return;
                }
                if (string.IsNullOrEmpty(txtAmount.Text) || Convert.ToDecimal(txtAmount.Text) <= 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid amount');", true);
                    return;
                }

                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(@"
                        INSERT INTO Orders
                        (
                            CustomerName,
                            ProductName,
                            Quantity,
                            TotalAmount,
                            PaymentMethod,
                            Status,
                            OrderDate
                        )
                        VALUES
                        (
                            @CustomerName,
                            @ProductName,
                            @Quantity,
                            @TotalAmount,
                            @PaymentMethod,
                            @Status,
                            @OrderDate
                        )", con);

                    cmd.Parameters.AddWithValue("@CustomerName", txtCustomer.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProductName", ddlProduct.SelectedValue);
                    cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text));
                    cmd.Parameters.AddWithValue("@TotalAmount", Convert.ToDecimal(txtAmount.Text));
                    cmd.Parameters.AddWithValue("@PaymentMethod", ddlPayment.SelectedValue);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadOrders();
                ClearFields();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Order Added Successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        // DELETE ORDER
        protected void gvOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                int id = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Orders WHERE OrderId = @OrderId", con);
                    cmd.Parameters.AddWithValue("@OrderId", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadOrders();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Order Deleted Successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        // EDIT ORDER - SET EDIT INDEX
        protected void gvOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvOrders.EditIndex = e.NewEditIndex;
            LoadOrders();
        }

        // CANCEL EDIT
        protected void gvOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvOrders.EditIndex = -1;
            LoadOrders();
        }

        // UPDATE ORDER
        protected void gvOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                int id = Convert.ToInt32(gvOrders.DataKeys[e.RowIndex].Value);

                // GET VALUES FROM EDIT TEMPLATE
                TextBox txtEditCustomer = (TextBox)gvOrders.Rows[e.RowIndex].FindControl("txtEditCustomer");
                TextBox txtEditProduct = (TextBox)gvOrders.Rows[e.RowIndex].FindControl("txtEditProduct");
                TextBox txtEditQuantity = (TextBox)gvOrders.Rows[e.RowIndex].FindControl("txtEditQuantity");
                TextBox txtEditAmount = (TextBox)gvOrders.Rows[e.RowIndex].FindControl("txtEditAmount");
                DropDownList ddlEditPayment = (DropDownList)gvOrders.Rows[e.RowIndex].FindControl("ddlEditPayment");
                DropDownList ddlEditStatus = (DropDownList)gvOrders.Rows[e.RowIndex].FindControl("ddlEditStatus");

                if (txtEditCustomer == null || txtEditQuantity == null || txtEditAmount == null || ddlEditPayment == null || ddlEditStatus == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: Could not find edit controls');", true);
                    return;
                }

                string customer = txtEditCustomer.Text;
                string product = txtEditProduct.Text;
                int quantity = Convert.ToInt32(txtEditQuantity.Text);
                decimal amount = Convert.ToDecimal(txtEditAmount.Text);
                string payment = ddlEditPayment.SelectedValue;
                string status = ddlEditStatus.SelectedValue;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(@"
                        UPDATE Orders 
                        SET 
                            CustomerName = @CustomerName,
                            ProductName = @ProductName,
                            Quantity = @Quantity,
                            TotalAmount = @TotalAmount,
                            PaymentMethod = @PaymentMethod,
                            Status = @Status
                        WHERE OrderId = @OrderId", con);

                    cmd.Parameters.AddWithValue("@CustomerName", customer);
                    cmd.Parameters.AddWithValue("@ProductName", product);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@TotalAmount", amount);
                    cmd.Parameters.AddWithValue("@PaymentMethod", payment);
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@OrderId", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                gvOrders.EditIndex = -1;
                LoadOrders();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Order Updated Successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        // GET STATUS CSS CLASS FOR BADGE
        protected string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "completed":
                    return "success";
                case "cancelled":
                    return "danger";
                case "processing":
                    return "warning";
                default:
                    return "secondary";
            }
        }

        // CLEAR ALL FORM FIELDS
        void ClearFields()
        {
            txtCustomer.Text = "";
            txtQuantity.Text = "";
            txtAmount.Text = "";
            txtUnitPrice.Text = "";
            ddlProduct.SelectedIndex = 0;
            ddlPayment.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }

    }
}


