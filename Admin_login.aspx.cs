using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace busbookingwebsite
{
    public partial class Admin_login : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
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
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUsername.Text) && !string.IsNullOrEmpty(txtPassword.Text))
            {
                con = new SqlConnection(s);
                con.Open(); // ✅ Open the connection

                string query = "SELECT COUNT(*) FROM admin_regi WHERE Username='" + txtUsername.Text + "' AND Password='" + txtPassword.Text + "'";
                cmd = new SqlCommand(query, con);

                int i = Convert.ToInt32(cmd.ExecuteScalar());

                con.Close(); // ✅ Close the connection

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
