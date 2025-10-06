using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace busbookingwebsite
{
    public partial class Register : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetConnection();
                fillgrid();
            }
        }


        void GetConnection()
        {
            con = new SqlConnection(connStr);
            con.Open();
        }

        void Clear()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (btnRegister.Text == "Create Account")
            {
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    Response.Write("<script>alert('Passwords do not match!');</script>");
                    return;
                }

                GetConnection();

                cmd = new SqlCommand(
                     "INSERT INTO User_regi (FirstName, LastName, Email, Phone, Password, ConfirmPassword) " +
                      "VALUES ('" + txtFirstName.Text + "', '" + txtLastName.Text + "', '" +
                     txtEmail.Text + "', '" + txtPhone.Text + "', '" + txtPassword.Text + "', '" +
                      txtConfirmPassword.Text + "')", con);

                cmd.ExecuteNonQuery();
                Clear();
                fillgrid();
                Response.Write("<script>alert('Account created successfully!');</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                cmd = new SqlCommand(
     "UPDATE User_regi SET FirstName='" + txtFirstName.Text +
     "', LastName='" + txtLastName.Text +
     "', Email='" + txtEmail.Text +
     "', Phone='" + txtPhone.Text +
     "', Password='" + txtPassword.Text +
     "', ConfirmPassword='" + txtConfirmPassword.Text +
     "' WHERE UserId=" + ViewState["id"], con);

                cmd.ExecuteNonQuery();
                fillgrid();
                Clear();
                btnRegister.Text = "Create Account";

                Response.Write("<script>alert('Account updated successfully!');</script>");
            }
        }

        void fillgrid()
        {
            GetConnection();
            da = new SqlDataAdapter("SELECT * FROM User_regi", con);
            ds = new DataSet();
            da.Fill(ds);

            GridViewUsers.DataSource = ds;
            GridViewUsers.DataBind();
        }

        void select()
        {
            GetConnection();
            da = new SqlDataAdapter("SELECT * FROM User_regi WHERE Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            txtFirstName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
            txtLastName.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
            txtPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
            txtConfirmPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
        }
        protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edit")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;   
                btnRegister.Text = "Update";
                select();
            }
            else if (e.CommandName == "cmd_delete")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                GetConnection();

                cmd = new SqlCommand("DELETE FROM User_regi WHERE Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                fillgrid();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Account deleted successfully!');", true);
            }
        }


    }
}