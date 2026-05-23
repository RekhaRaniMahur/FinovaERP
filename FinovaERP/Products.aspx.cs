using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinovaERP
{
    public partial class Products : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            try
            {
                string cs =
                ConfigurationManager
                .ConnectionStrings["FinovaDB"]
                .ConnectionString;

                SqlConnection con =
                new SqlConnection(cs);

                SqlDataAdapter da =
                new SqlDataAdapter(

                "SELECT * FROM Tbl_Products ORDER BY Id DESC",

                con);

                DataTable dt =
                new DataTable();

                da.Fill(dt);

                rptProducts.DataSource = dt;

                rptProducts.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}








