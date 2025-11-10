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
            // Check if user is logged in
            if (Session["user"] == null || string.IsNullOrEmpty(Session["user"].ToString()))
            {
                Response.Write("<script>alert('Please login first to view your bookings.'); window.location='Login.aspx';</script>");
                return;
            }

            if (!IsPostBack)
            {
                // Check if payment was successful
                string paymentStatus = Request.QueryString["payment"];
                if (paymentStatus == "success")
                {
                    Response.Write("<script>alert('Payment successful! Your bookings have been confirmed.');</script>");
                }

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

                        // Get logged-in user's email from session
                        string userEmail = Session["user"] != null ? Session["user"].ToString() : "";
                        
                        // Filter bookings by logged-in user's email
                        string query = "SELECT BookingReference, PassengerName, Age, Gender, Contact, Email, TravelDate, BusName, Route, DepartureTime, ArrivalTime, SelectedSeats, NumberOfSeats, Fare, TotalPrice, Status, PaymentStatus FROM Passengers WHERE Email = '" + userEmail + "' ORDER BY Id DESC";
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
            // Get selected row data
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
                    
                    // Show success message
                    Response.Write("<script>alert('Seats updated successfully!');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error updating seats: " + ex.Message + "');</script>");
            }
        }

        protected void Btnpayment_Click(object sender, EventArgs e)
        {
            try
            {
                // Collect all unpaid bookings and calculate total
                List<string> bookingReferences = new List<string>();
                decimal grandTotal = 0;

                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();

                    foreach (GridViewRow row in gvBookings.Rows)
                    {
                        // Get booking reference
                        string bookingRef = gvBookings.DataKeys[row.RowIndex].Values["BookingReference"].ToString();
                        
                        // Get amount from database (TotalPrice column)
                        decimal amount = 0;
                        string sql = "SELECT TotalPrice FROM Passengers WHERE BookingReference = '" + bookingRef + "'";
                        SqlCommand cmd = new SqlCommand(sql, con);
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            decimal.TryParse(result.ToString(), out amount);
                        }

                        // Check if payment is pending
                        // PaymentStatus is typically the second-to-last column (before Action)
                        string paymentStatus = "";
                        if (row.Cells.Count >= 2)
                        {
                            // Find PaymentStatus column (it's before the Action column)
                            int paymentStatusIndex = -1;
                            for (int i = 0; i < row.Cells.Count; i++)
                            {
                                if (row.Cells[i].Text.Contains("Pending") || row.Cells[i].Text.Contains("Paid") || 
                                    row.Cells[i].Text.Contains("Unpaid"))
                                {
                                    paymentStatus = row.Cells[i].Text;
                                    paymentStatusIndex = i;
                                    break;
                                }
                            }
                            
                            // If not found by text, try to get from database
                            if (string.IsNullOrEmpty(paymentStatus))
                            {
                                sql = "SELECT PaymentStatus FROM Passengers WHERE BookingReference = '" + bookingRef + "'";
                                cmd = new SqlCommand(sql, con);
                                result = cmd.ExecuteScalar();
                                if (result != null)
                                {
                                    paymentStatus = result.ToString();
                                }
                            }
                        }

                        if (paymentStatus.ToLower() == "pending" || paymentStatus.ToLower() == "unpaid")
                        {
                            bookingReferences.Add(bookingRef);
                            grandTotal += amount;
                        }
                    }
                }

                if (bookingReferences.Count == 0)
                {
                    Response.Write("<script>alert('No pending payments found. All bookings are already paid.');</script>");
                    return;
                }

                // Redirect to payment page with booking references and total amount
                string bookingRefs = string.Join(",", bookingReferences);
                Response.Redirect("Payment.aspx?bookingRefs=" + Server.UrlEncode(bookingRefs) + "&total=" + grandTotal.ToString("0.00"));
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error processing payment: " + ex.Message + "');</script>");
            }
        }

        private void ProcessPayment(List<string> bookingReferences, decimal totalAmount)
        {
            try
            {
                // Simulate payment processing
                // In real application, integrate with payment gateway (Razorpay, PayU, etc.)
                
                bool paymentSuccess = SimulatePaymentGateway(totalAmount);

                if (paymentSuccess)
                {
                    // Update payment status in database
                    using (SqlConnection con = new SqlConnection(s))
                    {
                        con.Open();

                        foreach (string bookingRef in bookingReferences)
                        {
                            // Update payment status to "Paid"
                            string sql = "UPDATE Passengers SET PaymentStatus = 'Paid' WHERE BookingReference = '" + bookingRef + "'";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    fill_bookings_grid(); // Refresh the GridView
                    Response.Write("<script>alert('Payment successful! Total amount paid: ₹" + totalAmount.ToString("0.00") + "');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Payment failed. Please try again.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error processing payment: " + ex.Message + "');</script>");
            }
        }

        private bool SimulatePaymentGateway(decimal amount)
        {
            // Simulate payment gateway response
            // In real application, replace this with actual payment gateway integration
            
            // For demo: Always return true (simulate success)
            // In production, integrate with Razorpay, PayU, Stripe, etc.
            
            System.Threading.Thread.Sleep(1000); // Simulate processing delay
            
            // Return true for successful payment (change logic as needed)
            return true;
        }
    }
}