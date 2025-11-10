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
    public partial class Admin_users : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllUsers();
            }
        }

        private void LoadAllUsers()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    // Get all registered users from User_regi table
                    string query = "SELECT Id, FirstName, LastName, Email, Phone, Password FROM User_regi ORDER BY Id DESC";
                    
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Always bind the GridView, even if empty
                    gvAllUsers.DataSource = dt;
                    gvAllUsers.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading users: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void gvAllUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAllUsers.PageIndex = e.NewPageIndex;
            LoadAllUsers();
        }

        protected void gvAllUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                try
                {
                    int userId = Convert.ToInt32(e.CommandArgument);

                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();
                        string query = "DELETE FROM User_regi WHERE Id = " + userId;
                        SqlCommand cmd = new SqlCommand(query, con);
                        int rows = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rows > 0)
                        {
                            Response.Write("<script>alert('User deleted successfully!');</script>");
                            LoadAllUsers();
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to delete user.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error deleting user: " + ex.Message.Replace("'", "\\'") + "');</script>");
                }
            }
            else if (e.CommandName == "EditUser")
            {
                // Redirect to edit page or show edit form
                int userId = Convert.ToInt32(e.CommandArgument);
                Response.Write("<script>alert('Edit functionality for User ID: " + userId + " - To be implemented');</script>");
            }
        }

        // Helper method to get booking count for a user
        protected string GetBookingCount(string userEmail)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM Passengers WHERE Email = '" + userEmail + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    return count.ToString();
                }
            }
            catch
            {
                return "0";
            }
        }
    }
}