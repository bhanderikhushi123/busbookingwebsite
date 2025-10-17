using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace busbookingwebsite
{
    public partial class My_booking : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if this is a booking summary redirect
                string bookingIds = Request.QueryString["bookingId"];
                string bookingRef = Request.QueryString["ref"];
                
                if (!string.IsNullOrEmpty(bookingIds) && !string.IsNullOrEmpty(bookingRef))
                {
                    ShowBookingSummary(bookingIds, bookingRef);
                }
                else
                {
                    fill_bookings_grid();
                }
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fill_bookings_grid()
        {
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();

                        string query = "SELECT BookingReference, PassengerName, Age, Gender, Contact, Email, TravelDate, BusName, Route, DepartureTime, ArrivalTime, SelectedSeats, NumberOfSeats, Fare, TotalPrice, Status, PaymentStatus FROM Passengers ORDER BY Id DESC";
                        SqlDataAdapter da = new SqlDataAdapter(query, con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            gvBookings.DataSource = dt;
                            gvBookings.DataBind();
                            pnlNoBookings.Visible = false;

                            // Optional: Calculate grand total
                            decimal grandTotal = 0;
                            foreach (DataRow dr in dt.Rows)
                            {
                                if (Decimal.TryParse(dr["TotalPrice"].ToString(), out decimal total))
                                {
                                    grandTotal += total;
                                }
                            }
                            lblTotalPrice.Text = "Grand Total: ₹" + grandTotal.ToString("0.00");
                            lblTotalPrice.Visible = true;
                        }
                        else
                        {
                            gvBookings.DataSource = null;
                            gvBookings.DataBind();
                            pnlNoBookings.Visible = true;
                            lblTotalPrice.Visible = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error loading bookings: " + ex.Message + "');</script>");
                }
            }
        }


        private void ShowBookingSummary(string bookingIds, string bookingRef)
        {
            try
            {
                // Show booking summary panel
                pnlBookingSummary.Visible = true;
                pnlAllBookings.Visible = false;
                
                // Set booking reference
                lblBookingRef.Text = bookingRef;

                // Load booking summary data
                fill_booking_summary(bookingIds);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading booking summary: " + ex.Message + "');</script>");
            }
        }

        void fill_booking_summary(string bookingIds)
        {
            // Simple message - no booking summary
            Response.Write("<script>alert('No booking details available');</script>");
        }

        protected void btnPrintTicket_Click(object sender, EventArgs e)
        {
            try
            {
                // JavaScript print functionality
                string script = @"
                    <script type='text/javascript'>
                        window.onload = function() {
                            window.print();
                        }
                    </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "PrintTicket", script);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error printing ticket: " + ex.Message + "');</script>");
            }
        }

        protected void btnViewAllBookings_Click(object sender, EventArgs e)
        {
            // Hide booking summary and show all bookings
            pnlBookingSummary.Visible = false;
            pnlAllBookings.Visible = true;
            fill_bookings_grid();
        }

        protected void BookingAction_Command(object sender, CommandEventArgs e)
        {
            string commandName = e.CommandName;
            string bookingRef = e.CommandArgument.ToString();

            switch (commandName)
            {
                case "ViewDetails":
                    ViewBookingDetails(bookingRef);
                    break;
                case "CancelBooking":
                    CancelBooking(bookingRef);
                    break;
            }
        }

        private void ViewBookingDetails(string bookingRef)
        {
            // For now, just show an alert
            Response.Write("<script>alert('View Details for Booking: " + bookingRef + "');</script>");
            // TODO: Implement detailed view
        }

        private void CancelBooking(string bookingRef)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                con.Open();
                string sql = "DELETE FROM Passengers WHERE BookingReference='" + bookingRef + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                int rows = cmd.ExecuteNonQuery();
                con.Close();
                fill_bookings_grid();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error cancelling: " + ex.Message + "');</script>");
            }
        }

        protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelBooking")
            {
                string bookingRef = e.CommandArgument.ToString();
               CancelBooking(bookingRef);
            }
            
                
            
        }

        protected void gvBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Example: Get selected row data
            GridViewRow row = gvBookings.SelectedRow;
            string bookingRef = row.Cells[0].Text; // Adjust index based on your column layout

            Response.Write("<script>alert('Selected Booking Reference: " + bookingRef + "');</script>");
        }

        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();

                    foreach (GridViewRow row in gvBookings.Rows)
                    {
                        TextBox txtUpdateSeat = (TextBox)row.FindControl("txtUpdateSeat");
                        if (txtUpdateSeat != null && int.TryParse(txtUpdateSeat.Text, out int newSeatCount))
                        {
                            string bookingRef = gvBookings.DataKeys[row.RowIndex].Values["BookingReference"].ToString();
                            decimal fare = Convert.ToDecimal(gvBookings.DataKeys[row.RowIndex].Values["Fare"]);
                            decimal newTotal = newSeatCount * fare;

                            string sql = "UPDATE Passengers SET NumberOfSeats = " + newSeatCount +
                                         ", TotalPrice = " + newTotal +
                                         " WHERE BookingReference = '" + bookingRef + "'";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    fill_bookings_grid(); // Refresh the GridView and grand total
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error updating seats: " + ex.Message + "');</script>");
            }
        }
    }
}