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
            // LOGIN SECURITY

            if (Session["UserName"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadCustomers();
            }
        }

        // LOAD CUSTOMERS

        void LoadCustomers()
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            SqlDataAdapter da =
            new SqlDataAdapter(
            "SELECT * FROM Customers ORDER BY CustomerId DESC",
            con);

            DataTable dt =
            new DataTable();

            da.Fill(dt);

            gvCustomers.DataSource = dt;

            gvCustomers.DataBind();
        }

        // ADD CUSTOMER

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string cs =
                ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

                SqlConnection con =
                new SqlConnection(cs);

                SqlCommand cmd =
                new SqlCommand(@"
                INSERT INTO Customers
                (
                    CustomerName,
                    Email,
                    Mobile,
                    City,
                    State,
                    Status,
                    Address
                )
                VALUES
                (
                    @CustomerName,
                    @Email,
                    @Mobile,
                    @City,
                    @State,
                    @Status,
                    @Address
                )", con);

                cmd.Parameters.AddWithValue(
                "@CustomerName",
                txtCustomerName.Text);

                cmd.Parameters.AddWithValue(
                "@Email",
                txtEmail.Text);

                cmd.Parameters.AddWithValue(
                "@Mobile",
                txtMobile.Text);

                cmd.Parameters.AddWithValue(
                "@City",
                txtCity.Text);

                cmd.Parameters.AddWithValue(
                "@State",
                txtState.Text);

                cmd.Parameters.AddWithValue(
                "@Status",
                ddlStatus.SelectedValue);

                cmd.Parameters.AddWithValue(
                "@Address",
                txtAddress.Text);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                LoadCustomers();

                ClearFields();

                Response.Write(
                "<script>alert('Customer Added Successfully')</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        // CLEAR

        void ClearFields()
        {
            txtCustomerName.Text = "";

            txtEmail.Text = "";

            txtMobile.Text = "";

            txtCity.Text = "";

            txtState.Text = "";

            txtAddress.Text = "";

            ddlStatus.SelectedIndex = 0;
        }

        // RESET

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        // SEARCH

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            SqlDataAdapter da =
            new SqlDataAdapter(@"

            SELECT * FROM Customers

            WHERE CustomerName LIKE '%'+@Search+'%'
            OR Email LIKE '%'+@Search+'%'
            OR Mobile LIKE '%'+@Search+'%'

            ORDER BY CustomerId DESC

            ", con);

            da.SelectCommand.Parameters.AddWithValue(
            "@Search",
            txtSearch.Text);

            DataTable dt =
            new DataTable();

            da.Fill(dt);

            gvCustomers.DataSource = dt;

            gvCustomers.DataBind();
        }

        // SHOW ALL

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            LoadCustomers();
        }

        // DELETE

        protected void gvCustomers_RowDeleting(
        object sender,
        GridViewDeleteEventArgs e)
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            int id =
            Convert.ToInt32(
            gvCustomers.DataKeys[e.RowIndex].Value);

            SqlCommand cmd =
            new SqlCommand(
            "DELETE FROM Customers WHERE CustomerId=@CustomerId",
            con);

            cmd.Parameters.AddWithValue(
            "@CustomerId",
            id);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            LoadCustomers();
        }

        // EDIT

        protected void gvCustomers_RowEditing(
        object sender,
        GridViewEditEventArgs e)
        {
            gvCustomers.EditIndex = e.NewEditIndex;

            LoadCustomers();
        }

        // CANCEL

        protected void gvCustomers_RowCancelingEdit(
        object sender,
        GridViewCancelEditEventArgs e)
        {
            gvCustomers.EditIndex = -1;

            LoadCustomers();
        }

        // UPDATE

        protected void gvCustomers_RowUpdating(
        object sender,
        GridViewUpdateEventArgs e)
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            int id =
            Convert.ToInt32(
            gvCustomers.DataKeys[e.RowIndex].Value);

            string customerName =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[1].Controls[0]).Text;

            string email =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[2].Controls[0]).Text;

            string mobile =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[3].Controls[0]).Text;

            string city =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[4].Controls[0]).Text;

            string state =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[5].Controls[0]).Text;

            string status =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[6].Controls[0]).Text;

            string address =
            ((TextBox)gvCustomers.Rows[e.RowIndex]
            .Cells[7].Controls[0]).Text;

            SqlCommand cmd =
            new SqlCommand(@"

            UPDATE Customers SET

            CustomerName=@CustomerName,
            Email=@Email,
            Mobile=@Mobile,
            City=@City,
            State=@State,
            Status=@Status,
            Address=@Address

            WHERE CustomerId=@CustomerId

            ", con);

            cmd.Parameters.AddWithValue(
            "@CustomerName",
            customerName);

            cmd.Parameters.AddWithValue(
            "@Email",
            email);

            cmd.Parameters.AddWithValue(
            "@Mobile",
            mobile);

            cmd.Parameters.AddWithValue(
            "@City",
            city);

            cmd.Parameters.AddWithValue(
            "@State",
            state);

            cmd.Parameters.AddWithValue(
            "@Status",
            status);

            cmd.Parameters.AddWithValue(
            "@Address",
            address);

            cmd.Parameters.AddWithValue(
            "@CustomerId",
            id);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            gvCustomers.EditIndex = -1;

            LoadCustomers();
        }
    }
}

  