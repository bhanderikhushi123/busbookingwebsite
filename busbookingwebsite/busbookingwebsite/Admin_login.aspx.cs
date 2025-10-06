using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace busbookingwebsite
{
    public partial class Admin_login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["admin_constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {

            if (txtUsername.Text != null && txtPassword.Text != null)
            {
                cmd = new SqlCommand("SELECT COUNT(*) FROM admin_regi WHERE Username='" + txtUsername.Text + "' AND Password='" + txtPassword.Text + "'", con);
                int i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["admin"] = txtUsername.Text;
                    Response.Redirect("Admin_dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Username or Password');</script>");
                }
            }
        }
    }
}