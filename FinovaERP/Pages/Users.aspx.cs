using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP.Pages
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }
        // LOAD USERS
        private void LoadUsers()
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT 
                ud.DetailId,
                ud.UserId,
                u.FullName,
                u.Email,
                u.Mobile,
                ud.Role,
                ud.Status,
                ud.Gender,
                ud.DOB,
                ud.JoiningDate,
                ud.Address,
                ud.UserImage,
                ud.CreatedDate
            FROM UserDetails ud
            INNER JOIN Users u
            ON ud.UserId = u.UserId
            ORDER BY ud.DetailId DESC", con);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvUsers.DataSource = dt;

            gvUsers.DataBind();

            lblTotal.Text = "Total Users : " + dt.Rows.Count;
        }

        // ADD USER DETAILS

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            string imageName = "";

            if (fuUserImage.HasFile)
            {
                imageName = Guid.NewGuid().ToString() +
                            Path.GetExtension(fuUserImage.FileName);

                fuUserImage.SaveAs(Server.MapPath("~/UserImages/") + imageName);
            }
            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO UserDetails
            (
                UserId,
                Role,
                Status,
                Gender,
                DOB,
                JoiningDate,
                Address,
                UserImage,
                CreatedDate
            )
            VALUES
            (
                @UserId,
                @Role,
                @Status,
                @Gender,
                @DOB,
                @JoiningDate,
                @Address,
                @UserImage,
                GETDATE()
            )", con);

            cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            cmd.Parameters.AddWithValue("@JoiningDate", txtJoiningDate.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@UserImage", imageName);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            LoadUsers();

            ClearFields();
        }

        // RESET

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        // CLEAR

        private void ClearFields()
        {
            txtDOB.Text = "";
            txtJoiningDate.Text = "";
            txtAddress.Text = "";

            ddlRole.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
        }

        // SEARCH

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT 
                ud.DetailId,
                ud.UserId,
                u.FullName,
                u.Email,
                u.Mobile,
                ud.Role,
                ud.Status,
                ud.Gender,
                ud.DOB,
                ud.JoiningDate,
                ud.Address,
                ud.UserImage,
                ud.CreatedDate
            FROM UserDetails ud
            INNER JOIN Users u
            ON ud.UserId = u.UserId
            WHERE 
                u.FullName LIKE '%'+@Search+'%'
                OR u.Email LIKE '%'+@Search+'%'
                OR u.Mobile LIKE '%'+@Search+'%'", con);

            da.SelectCommand.Parameters.AddWithValue("@Search", txtSearch.Text);

            DataTable dt = new DataTable();

            da.Fill(dt);

            gvUsers.DataSource = dt;

            gvUsers.DataBind();

            lblTotal.Text = "Search Record : " + dt.Rows.Count;
        }

        // SHOW ALL

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            LoadUsers();
        }

        // DELETE

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM UserDetails WHERE DetailId=@DetailId", con);

            cmd.Parameters.AddWithValue("@DetailId", id);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            LoadUsers();
        }

        // EDIT

        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;

            LoadUsers();
        }

        // CANCEL

        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;

            LoadUsers();
        }

        // UPDATE

        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            string role =
            ((TextBox)gvUsers.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

            SqlCommand cmd = new SqlCommand(@"
            UPDATE UserDetails SET
            Role=@Role
            WHERE DetailId=@DetailId", con);

            cmd.Parameters.AddWithValue("@Role", role);

            cmd.Parameters.AddWithValue("@DetailId", id);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            gvUsers.EditIndex = -1;

            LoadUsers();
        }

        // EXPORT EXCEL

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            LoadUsers();

            Response.Clear();
            Response.Buffer = true;

            Response.AddHeader(
                "content-disposition",
                "attachment;filename=UsersReport.xls");

            Response.Charset = "";

            Response.ContentType = "application/vnd.ms-excel";

            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                // REMOVE BUTTON COLUMNS

                gvUsers.Columns[12].Visible = false;
                gvUsers.Columns[13].Visible = false;

                gvUsers.RenderControl(hw);

                Response.Output.Write(sw.ToString());

                Response.Flush();

                Response.End();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}