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
    public partial class Admin_dashboard : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecentBookings();
            }
        }

        private void LoadRecentBookings()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    // Get recent bookings from Passengers table (last 10 bookings)
                    // Using DISTINCT to avoid duplicate rows if multiple passengers have same booking reference
                    string query = "SELECT TOP 10 BookingReference, PassengerName, Route, TravelDate, TotalPrice, Status, PaymentStatus FROM Passengers ORDER BY Id DESC";
                    
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Always bind the GridView, even if empty
                    gvRecentBookings.DataSource = dt;
                    gvRecentBookings.DataBind();
                    
                    // Debug: Check if data exists
                    if (dt.Rows.Count == 0)
                    {
                        // No data found - this is normal if no bookings exist yet
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading recent bookings: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
    }
}