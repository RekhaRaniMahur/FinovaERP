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
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadCustomers();
            }
        }

        // LOAD CUSTOMERS
        void LoadCustomers()
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Customers ORDER BY CustomerId DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCustomers.DataSource = dt;
                gvCustomers.DataBind();
            }
        }

        // ADD CUSTOMER
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                // Validation
                if (string.IsNullOrEmpty(txtCustomerName.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter customer name');", true);
                    return;
                }
                if (string.IsNullOrEmpty(txtEmail.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter email');", true);
                    return;
                }
                if (string.IsNullOrEmpty(txtMobile.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter mobile number');", true);
                    return;
                }

                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(@"
                        INSERT INTO Customers
                        (
                            CustomerName,
                            Email,
                            Mobile,
                            City,
                            State,
                            Status,
                            Address,
                            CreatedDate
                        )
                        VALUES
                        (
                            @CustomerName,
                            @Email,
                            @Mobile,
                            @City,
                            @State,
                            @Status,
                            @Address,
                            @CreatedDate
                        )", con);

                    cmd.Parameters.AddWithValue("@CustomerName", txtCustomerName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", string.IsNullOrEmpty(txtCity.Text) ? "" : txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@State", string.IsNullOrEmpty(txtState.Text) ? "" : txtState.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(txtAddress.Text) ? "" : txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadCustomers();
                ClearFields();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Customer Added Successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        // UPDATE CUSTOMER
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(hfCustomerId.Value);

                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(@"
                        UPDATE Customers 
                        SET 
                            CustomerName = @CustomerName,
                            Email = @Email,
                            Mobile = @Mobile,
                            City = @City,
                            State = @State,
                            Status = @Status,
                            Address = @Address
                        WHERE CustomerId = @CustomerId", con);

                    cmd.Parameters.AddWithValue("@CustomerName", txtCustomerName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", string.IsNullOrEmpty(txtCity.Text) ? "" : txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@State", string.IsNullOrEmpty(txtState.Text) ? "" : txtState.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(txtAddress.Text) ? "" : txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@CustomerId", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadCustomers();
                ClearFields();
                hfCustomerId.Value = "0";

                // Hide update buttons and show add button
                btnAdd.Visible = true;
                btnUpdate.Visible = false;
                btnCancel.Visible = false;

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Customer Updated Successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        // CANCEL UPDATE
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            hfCustomerId.Value = "0";
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }

        // CLEAR FIELDS
        void ClearFields()
        {
            txtCustomerName.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtAddress.Text = "";
            txtPincode.Text = "";
            ddlStatus.SelectedIndex = 0;
            txtSearch.Text = "";
        }

        // RESET
        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFields();
            hfCustomerId.Value = "0";
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }

        // SEARCH
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
                    SELECT * FROM Customers
                    WHERE CustomerName LIKE '%'+@Search+'%'
                    OR Email LIKE '%'+@Search+'%'
                    OR Mobile LIKE '%'+@Search+'%'
                    ORDER BY CustomerId DESC", con);

                da.SelectCommand.Parameters.AddWithValue("@Search", txtSearch.Text.Trim());
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCustomers.DataSource = dt;
                gvCustomers.DataBind();
            }
        }

        // SHOW ALL
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadCustomers();
        }

        // DELETE
        protected void gvCustomers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
                int id = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Customers WHERE CustomerId=@CustomerId", con);
                    cmd.Parameters.AddWithValue("@CustomerId", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                LoadCustomers();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Customer Deleted Successfully');", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }

        // EDIT - GRIDVIEW ROW COMMAND
        protected void gvCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCustomer")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                LoadCustomerForEdit(id);
            }
        }

        // LOAD CUSTOMER DATA FOR EDITING
        void LoadCustomerForEdit(int id)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Customers WHERE CustomerId = @CustomerId", con);
                cmd.Parameters.AddWithValue("@CustomerId", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    txtCustomerName.Text = dr["CustomerName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtMobile.Text = dr["Mobile"].ToString();
                    txtCity.Text = dr["City"].ToString();
                    txtState.Text = dr["State"].ToString();
                    txtPincode.Text = dr["Pincode"] != DBNull.Value ? dr["Pincode"].ToString() : "";
                    txtAddress.Text = dr["Address"].ToString();
                    ddlStatus.SelectedValue = dr["Status"].ToString();
                    hfCustomerId.Value = id.ToString();

                    // Hide add button and show update/cancel buttons
                    btnAdd.Visible = false;
                    btnUpdate.Visible = true;
                    btnCancel.Visible = true;
                }
                con.Close();
            }
        }

        // EDIT (OLD METHOD - KEPT FOR COMPATIBILITY)
        protected void gvCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // This method is kept for compatibility but we are using RowCommand instead
            // You can remove this if not needed
            gvCustomers.EditIndex = -1;
            LoadCustomers();
        }

        // CANCEL EDIT (OLD METHOD - KEPT FOR COMPATIBILITY)
        protected void gvCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCustomers.EditIndex = -1;
            LoadCustomers();
        }

        // UPDATE (OLD METHOD - KEPT FOR COMPATIBILITY)
        protected void gvCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // This method is kept for compatibility but we are using separate form for editing
            gvCustomers.EditIndex = -1;
            LoadCustomers();
        }
    }
}

  