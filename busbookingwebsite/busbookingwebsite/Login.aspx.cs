using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace busbookingwebsite
{
    public partial class Login : System.Web.UI.Page
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
            con.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            if (txtEmail.Text != null && txtPassword.Text != null)

            {

                cmd = new SqlCommand(" select count(*) from User_regi where  Email = '" + txtEmail.Text + "'  and  Password = '" + txtPassword.Text + "'", con);
                int i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["user"] = txtEmail.Text;
                    Response.Redirect("Home.aspx");
                }


                //}
                //string email = txtEmail.Text;
                //string password = txtPassword.Text;

                //// Example: Hardcoded login check
                //if (email == "user@test.com" && password == "1234")
                //{
                //    Response.Redirect("index.html");
                //}
                //else
                //{
                //    Response.Write("<script>alert('Invalid email or password');</script>");
                //}
            }
        }
    }
}