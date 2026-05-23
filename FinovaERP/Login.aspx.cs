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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager
                .ConnectionStrings["FinovaDB"]
                .ConnectionString;

            SqlConnection con = new SqlConnection(cs);

            string query = "SELECT * FROM Users WHERE Email=@Email AND Password=@Password";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                Session["UserEmail"] = txtEmail.Text;

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Email or Password')</script>");
            }

            con.Close();
        }
    }
}



