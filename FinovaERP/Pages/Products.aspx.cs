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
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        // ADD PRODUCT

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //  

            if (txtProductName.Text.Trim() == "")
            {
                Response.Write("<script>alert('Enter Product Name')</script>");
                return;
            }

            if (txtPrice.Text.Trim() == "")
            {
                Response.Write("<script>alert('Enter Price')</script>");
                return;
            }

            if (ddlCategory.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Select Category')</script>");
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            // DUPLICATE PRODUCT CODE CHECK

            string checkQuery = "SELECT COUNT(*) FROM Products WHERE ProductCode=@code";

            SqlCommand checkCmd = new SqlCommand(checkQuery, con);

            checkCmd.Parameters.AddWithValue("@code", txtProductCode.Text);

            con.Open();

            int count = Convert.ToInt32(checkCmd.ExecuteScalar());

            con.Close();

            if (count > 0)
            {
                Response.Write("<script>alert('Product Code Already Exists')</script>");
                return;
            }

            // IMAGE SAVE

            string fileName = "";

            if (fuProductImage.HasFile)
            {
                fileName = Guid.NewGuid().ToString() + "_" + fuProductImage.FileName;

                string path = Server.MapPath("~/ProductImages/") + fileName;

                fuProductImage.SaveAs(path);
            }

            // INSERT QUERY

            string query = @"INSERT INTO Products
            (
                ProductName,
                ProductCode,
                Brand,
                Price,
                SalePrice,
                Quantity,
                Category,
                Status,
                Description,
                ProductImage,
                StockStatus,
                SupplierName,
                Warranty,
                SKU,
                Barcode,
                GST,
                Discount,
                Weight,
                Color,
                Size,
                Manufacturer,
                ExpiryDate
            )

            VALUES
            (
                @name,
                @code,
                @brand,
                @price,
                @saleprice,
                @qty,
                @cat,
                @status,
                @desc,
                @img,
                @stock,
                @supplier,
                @warranty,
                @sku,
                @barcode,
                @gst,
                @discount,
                @weight,
                @color,
                @size,
                @manufacturer,
                @expiry
            )";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@name", txtProductName.Text);

            cmd.Parameters.AddWithValue("@code", txtProductCode.Text);

            cmd.Parameters.AddWithValue("@brand", txtBrand.Text);

            cmd.Parameters.AddWithValue("@price", txtPrice.Text);

            cmd.Parameters.AddWithValue("@saleprice", txtSalePrice.Text);

            cmd.Parameters.AddWithValue("@qty", txtQuantity.Text);

            cmd.Parameters.AddWithValue("@cat", ddlCategory.SelectedValue);

            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);

            cmd.Parameters.AddWithValue("@desc", txtDescription.Text);

            cmd.Parameters.AddWithValue("@img", fileName);

            cmd.Parameters.AddWithValue("@stock", "In Stock");

            cmd.Parameters.AddWithValue("@supplier", txtSupplier.Text);

            cmd.Parameters.AddWithValue("@warranty", txtWarranty.Text);

            cmd.Parameters.AddWithValue("@sku", txtSKU.Text);

            cmd.Parameters.AddWithValue("@barcode", txtBarcode.Text);

            cmd.Parameters.AddWithValue("@gst", txtGST.Text);

            cmd.Parameters.AddWithValue("@discount", txtDiscount.Text);

            cmd.Parameters.AddWithValue("@weight", txtWeight.Text);

            cmd.Parameters.AddWithValue("@color", txtColor.Text);

            cmd.Parameters.AddWithValue("@size", txtSize.Text);

            cmd.Parameters.AddWithValue("@manufacturer", txtManufacturer.Text);

            cmd.Parameters.AddWithValue("@expiry", txtExpiryDate.Text);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Product Added Successfully')</script>");

            BindGrid();

            ClearBoxes();
        }

        // BIND GRID

        void BindGrid()
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            string query = "SELECT * FROM Products ORDER BY ProductId DESC";

            SqlDataAdapter sda = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            gvProducts.DataSource = dt;

            gvProducts.DataBind();
        }

        // DELETE PRODUCT

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

            string query = "DELETE FROM Products WHERE ProductId=@id";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Product Deleted')</script>");

            BindGrid();
        }

        // EDIT

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;

            BindGrid();
        }

        // CANCEL EDIT

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;

            BindGrid();
        }

        // UPDATE PRODUCT

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

            TextBox txtName = (TextBox)gvProducts.Rows[e.RowIndex].Cells[1].Controls[0];

            TextBox txtCode = (TextBox)gvProducts.Rows[e.RowIndex].Cells[2].Controls[0];

            TextBox txtBrand = (TextBox)gvProducts.Rows[e.RowIndex].Cells[3].Controls[0];

            TextBox txtCategory = (TextBox)gvProducts.Rows[e.RowIndex].Cells[4].Controls[0];

            TextBox txtPrice = (TextBox)gvProducts.Rows[e.RowIndex].Cells[5].Controls[0];

            TextBox txtSalePrice = (TextBox)gvProducts.Rows[e.RowIndex].Cells[6].Controls[0];

            TextBox txtQty = (TextBox)gvProducts.Rows[e.RowIndex].Cells[7].Controls[0];

            TextBox txtStatus = (TextBox)gvProducts.Rows[e.RowIndex].Cells[8].Controls[0];

            string query = @"UPDATE Products SET

                            ProductName=@name,
                            ProductCode=@code,
                            Brand=@brand,
                            Category=@cat,
                            Price=@price,
                            SalePrice=@saleprice,
                            Quantity=@qty,
                            Status=@status

                            WHERE ProductId=@id";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@name", txtName.Text);

            cmd.Parameters.AddWithValue("@code", txtCode.Text);

            cmd.Parameters.AddWithValue("@brand", txtBrand.Text);

            cmd.Parameters.AddWithValue("@cat", txtCategory.Text);

            cmd.Parameters.AddWithValue("@price", txtPrice.Text);

            cmd.Parameters.AddWithValue("@saleprice", txtSalePrice.Text);

            cmd.Parameters.AddWithValue("@qty", txtQty.Text);

            cmd.Parameters.AddWithValue("@status", txtStatus.Text);

            cmd.Parameters.AddWithValue("@id", id);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            gvProducts.EditIndex = -1;

            Response.Write("<script>alert('Product Updated Successfully')</script>");

            BindGrid();
        }

        // SEARCH

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            string query = @"SELECT * FROM Products
                            WHERE
                            ProductName LIKE @search
                            OR ProductCode LIKE @search
                            OR Brand LIKE @search
                            OR Category LIKE @search
                            OR Status LIKE @search";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@search", "%" + txtSearch.Text.Trim() + "%");

            SqlDataAdapter sda = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                gvProducts.DataSource = dt;

                gvProducts.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());

                gvProducts.DataSource = dt;

                gvProducts.DataBind();

                gvProducts.Rows[0].Cells.Clear();

                gvProducts.Rows[0].Cells.Add(new TableCell());

                gvProducts.Rows[0].Cells[0].ColumnSpan = gvProducts.Columns.Count;

                gvProducts.Rows[0].Cells[0].Text = "Record Not Found";

                gvProducts.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        // SHOW ALL

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            BindGrid();

            txtSearch.Text = "";
        }

        // RESET

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearBoxes();
        }

        // CLEAR BOXES

        void ClearBoxes()
        {
            txtProductName.Text = "";

            txtProductCode.Text = "";

            txtBrand.Text = "";

            txtPrice.Text = "";

            txtSalePrice.Text = "";

            txtQuantity.Text = "";

            txtDescription.Text = "";

            txtSupplier.Text = "";

            txtWarranty.Text = "";

            txtSKU.Text = "";

            txtBarcode.Text = "";

            txtGST.Text = "";

            txtDiscount.Text = "";

            txtWeight.Text = "";

            txtColor.Text = "";

            txtSize.Text = "";

            txtManufacturer.Text = "";

            txtExpiryDate.Text = "";

            ddlCategory.SelectedIndex = 0;

            ddlStatus.SelectedIndex = 0;
        }
    }
}
