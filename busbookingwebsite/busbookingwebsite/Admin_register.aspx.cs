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
    public partial class Admin_register : System.Web.UI.Page
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

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(s);
            con.Open();

            string query = "INSERT INTO admin_regi (FirstName, LastName, Username, Email, Phone, AdminCode, Password, Role) " +
                           "VALUES ('" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtUsername.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtAdminCode.Text + "','" + txtPassword.Text + "','" + ddlRole.SelectedValue + "')";

            SqlCommand cmd = new SqlCommand(query, con);
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Write("<script>alert('Admin account created successfully!');</script>");
                Response.Redirect("Admin_login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error creating account. Try again.');</script>");
            }

            con.Close();
        }
    }
}