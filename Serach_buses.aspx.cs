using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace busbookingwebsite
{
    public partial class Serach_buses : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTravelDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                LoadAllBuses();
            }
        }

        private void LoadAllBuses()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    // Get all active routes/buses from routes_tbl
                    string query = "SELECT Id, RouteName, Source, Destination, Operator, Distance, Duration, Fare, Status FROM routes_tbl WHERE Status = 'Active' ORDER BY Id DESC";
                    
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptBuses.DataSource = dt;
                        rptBuses.DataBind();
                        rptBuses.Visible = true;
                        pnlNoBuses.Visible = false;
                        lblSearchInfo.Text = "Total " + dt.Rows.Count + " buses available";
                    }
                    else
                    {
                        rptBuses.Visible = false;
                        pnlNoBuses.Visible = true;
                        lblSearchInfo.Text = "No buses available";
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading buses: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string source = txtSource.Text.Trim();
                string destination = txtDestination.Text.Trim();
                string operatorName = txtOperator.Text.Trim();

                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    // Build search query based on provided criteria
                    string query = "SELECT Id, RouteName, Source, Destination, Operator, Distance, Duration, Fare, Status FROM routes_tbl WHERE Status = 'Active'";
                    
                    if (!string.IsNullOrEmpty(source))
                    {
                        query += " AND Source LIKE '%" + source + "%'";
                    }
                    if (!string.IsNullOrEmpty(destination))
                    {
                        query += " AND Destination LIKE '%" + destination + "%'";
                    }
                    if (!string.IsNullOrEmpty(operatorName))
                    {
                        query += " AND Operator LIKE '%" + operatorName + "%'";
                    }
                    
                    query += " ORDER BY Id DESC";
                    
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Update search info
                    string searchText = "";
                    if (!string.IsNullOrEmpty(source) && !string.IsNullOrEmpty(destination))
                    {
                        searchText = source + " → " + destination;
                    }
                    else if (!string.IsNullOrEmpty(source))
                    {
                        searchText = "From: " + source;
                    }
                    else if (!string.IsNullOrEmpty(destination))
                    {
                        searchText = "To: " + destination;
                    }

                    if (dt.Rows.Count > 0)
                    {
                        rptBuses.DataSource = dt;
                        rptBuses.DataBind();
                        rptBuses.Visible = true;
                        pnlNoBuses.Visible = false;
                        
                        if (!string.IsNullOrEmpty(searchText))
                        {
                            lblSearchInfo.Text = "Found " + dt.Rows.Count + " buses for " + searchText;
                        }
                        else
                        {
                            lblSearchInfo.Text = "Found " + dt.Rows.Count + " buses";
                        }
                    }
                    else
                    {
                        rptBuses.Visible = false;
                        pnlNoBuses.Visible = true;
                        
                        if (!string.IsNullOrEmpty(searchText))
                        {
                            lblSearchInfo.Text = "No buses found for " + searchText;
                        }
                        else
                        {
                            lblSearchInfo.Text = "No buses found";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error searching buses: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            // Clear search fields
            txtSource.Text = "";
            txtDestination.Text = "";
            txtOperator.Text = "";
            txtTravelDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            
            // Load all buses
            LoadAllBuses();
        }

        protected void rptBuses_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "BookNow")
            {
                string[] args = e.CommandArgument.ToString().Split('|');
                if (args.Length >= 6)
                {
                    string routeId = args[0];
                    string routeName = args[1];
                    string sourceCity = args[2];
                    string destination = args[3];
                    string fare = args[4];
                    string operatorName = args[5];
                    
                    // Redirect to Book_Now page with route details
                    Response.Redirect("Book_Now.aspx?route=" + Server.UrlEncode(routeName) + 
                        "&bus=" + Server.UrlEncode(operatorName) + 
                        "&fare=" + Server.UrlEncode(fare) + 
                        "&dep=" + Server.UrlEncode("22:00") + 
                        "&arr=" + Server.UrlEncode("22:30"));
                }
            }
        }
    }
}