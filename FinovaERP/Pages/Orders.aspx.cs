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
            // LOGIN SECURITY


            if (Session["UserName"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadProducts();

                LoadOrders();
            }
        }

        // LOAD PRODUCTS

        void LoadProducts()
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            SqlDataAdapter da =
            new SqlDataAdapter(
            "SELECT ProductId, ProductName FROM Products",
            con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            ddlProduct.DataSource = dt;

            ddlProduct.DataTextField = "ProductName";

            ddlProduct.DataValueField = "ProductId";

            ddlProduct.DataBind();

            ddlProduct.Items.Insert
            (
                0,
                new ListItem("Select Product", "")
            );
        }

        // ADD ORDER

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

                INSERT INTO Orders
                (
                    CustomerName,
                    ProductId,
                    Quantity,
                    TotalAmount,
                    PaymentStatus,
                    OrderStatus
                )

                VALUES
                (
                    @CustomerName,
                    @ProductId,
                    @Quantity,
                    @TotalAmount,
                    @PaymentStatus,
                    @OrderStatus
                )

                ", con);

                cmd.Parameters.AddWithValue
                (
                    "@CustomerName",
                    txtCustomer.Text
                );

                cmd.Parameters.AddWithValue
                (
                    "@ProductId",
                    ddlProduct.SelectedValue
                );

                cmd.Parameters.AddWithValue
                (
                    "@Quantity",
                    txtQuantity.Text
                );

                cmd.Parameters.AddWithValue
                (
                    "@TotalAmount",
                    txtAmount.Text
                );

                cmd.Parameters.AddWithValue
                (
                    "@PaymentStatus",
                    ddlPayment.SelectedValue
                );

                cmd.Parameters.AddWithValue
                (
                    "@OrderStatus",
                    ddlStatus.SelectedValue
                );

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                LoadOrders();

                ClearFields();

                Response.Write
                (
                    "<script>alert('Order Added Successfully');</script>"
                );
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        // LOAD ORDERS

        void LoadOrders()
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            SqlDataAdapter da =
            new SqlDataAdapter(@"

            SELECT
                o.OrderId,
                o.CustomerName,
                p.ProductName,
                o.Quantity,
                o.TotalAmount,
                o.PaymentStatus,
                o.OrderStatus,
                o.OrderDate

            FROM Orders o

            INNER JOIN Products p
            ON o.ProductId = p.ProductId

            ORDER BY o.OrderId DESC

            ", con);

            DataTable dt =
            new DataTable();

            da.Fill(dt);

            gvOrders.DataSource = dt;

            gvOrders.DataBind();
        }

        // SEARCH

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            SqlCommand cmd =
            new SqlCommand(@"

    SELECT
        o.OrderId,
        o.CustomerName,
        p.ProductName,
        o.Quantity,
        o.TotalAmount,
        o.PaymentStatus,
        o.OrderStatus,
        o.OrderDate

    FROM Orders o

    INNER JOIN Products p
    ON o.ProductId = p.ProductId

    WHERE o.CustomerName LIKE '%'+@Search+'%'

    ORDER BY o.OrderId DESC

    ", con);

            //cmd.Parameters.AddWithValue
            //(
            //    "@Search",
            //    txtSearch.Text
            //);

            SqlDataAdapter da =
            new SqlDataAdapter(cmd);

            DataTable dt =
            new DataTable();

            da.Fill(dt);

            gvOrders.DataSource = dt;

            gvOrders.DataBind();
        }
        // SHOW ALL

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            LoadOrders();
        }

        // DELETE ORDER

        protected void gvOrders_RowDeleting
        (
            object sender,
            GridViewDeleteEventArgs e
        )
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            int id =
            Convert.ToInt32
            (
                gvOrders.DataKeys[e.RowIndex].Value
            );

            SqlCommand cmd =
            new SqlCommand
            (
                "DELETE FROM Orders WHERE OrderId=@OrderId",
                con
            );

            cmd.Parameters.AddWithValue
            (
                "@OrderId",
                id
            );

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            LoadOrders();
        }

        // EDIT

        protected void gvOrders_RowEditing
        (
            object sender,
            GridViewEditEventArgs e
        )
        {
            gvOrders.EditIndex = e.NewEditIndex;

            LoadOrders();
        }

        // CANCEL EDIT

        protected void gvOrders_RowCancelingEdit
        (
            object sender,
            GridViewCancelEditEventArgs e
        )
        {
            gvOrders.EditIndex = -1;

            LoadOrders();
        }

        // UPDATE ORDER

        protected void gvOrders_RowUpdating
        (
            object sender,
            GridViewUpdateEventArgs e
        )
        {
            string cs =
            ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con =
            new SqlConnection(cs);

            int id =
            Convert.ToInt32
            (
                gvOrders.DataKeys[e.RowIndex].Value
            );

            string customer =
            ((TextBox)
            gvOrders.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            string quantity =
            ((TextBox)
            gvOrders.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            string amount =
            ((TextBox)
            gvOrders.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            string payment =
            ((TextBox)
            gvOrders.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

            string status =
            ((TextBox)
            gvOrders.Rows[e.RowIndex].Cells[6].Controls[0]).Text;

            SqlCommand cmd =
            new SqlCommand(@"

            UPDATE Orders
            SET
                CustomerName=@CustomerName,
                Quantity=@Quantity,
                TotalAmount=@TotalAmount,
                PaymentStatus=@PaymentStatus,
                OrderStatus=@OrderStatus

            WHERE OrderId=@OrderId

            ", con);

            cmd.Parameters.AddWithValue
            (
                "@CustomerName",
                customer
            );

            cmd.Parameters.AddWithValue
            (
                "@Quantity",
                quantity
            );

            cmd.Parameters.AddWithValue
            (
                "@TotalAmount",
                amount
            );

            cmd.Parameters.AddWithValue
            (
                "@PaymentStatus",
                payment
            );

            cmd.Parameters.AddWithValue
            (
                "@OrderStatus",
                status
            );

            cmd.Parameters.AddWithValue
            (
                "@OrderId",
                id
            );

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            gvOrders.EditIndex = -1;

            LoadOrders();
        }

        // CLEAR

        void ClearFields()
        {
            txtCustomer.Text = "";

            txtQuantity.Text = "";

            txtAmount.Text = "";

            ddlProduct.SelectedIndex = 0;

            ddlPayment.SelectedIndex = 0;

            ddlStatus.SelectedIndex = 0;
        }
    }
}