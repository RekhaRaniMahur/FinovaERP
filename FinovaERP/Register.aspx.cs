using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["FinovaDB"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            string query = "INSERT INTO Users VALUES (@FullName,@Email,@Mobile,@Password,GETDATE())";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Write("<script>alert('Registration Successful')</script>");
        }
    }
}