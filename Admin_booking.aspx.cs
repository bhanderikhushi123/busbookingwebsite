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
    public partial class Admin_booking : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllBookings();
            }
        }

        private void LoadAllBookings()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    
                    // Get all bookings from Passengers table
                    string query = "SELECT BookingReference, PassengerName, Email, Contact, Route, BusName, TravelDate, DepartureTime, SelectedSeats, TotalPrice, Status, PaymentStatus FROM Passengers ORDER BY Id DESC";
                    
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Always bind the GridView, even if empty
                    gvAllBookings.DataSource = dt;
                    gvAllBookings.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading bookings: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        protected void gvAllBookings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAllBookings.PageIndex = e.NewPageIndex;
            LoadAllBookings();
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                string bookingRef = lnk.CommandArgument;

                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    string query = "DELETE FROM Passengers WHERE BookingReference = '" + bookingRef + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    int rows = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rows > 0)
                    {
                        Response.Write("<script>alert('Booking cancelled successfully!');</script>");
                        LoadAllBookings();
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to cancel booking.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error cancelling booking: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }
    }
}