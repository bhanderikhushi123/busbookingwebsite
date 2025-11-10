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
    public partial class Payment : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["user"] == null || string.IsNullOrEmpty(Session["user"].ToString()))
            {
                Response.Write("<script>alert('Please login first to make payment.'); window.location='Login.aspx';</script>");
                return;
            }

            if (!IsPostBack)
            {
                // Get booking references and total from query string
                string bookingRefs = Request.QueryString["bookingRefs"];
                string total = Request.QueryString["total"];

                if (string.IsNullOrEmpty(bookingRefs) || string.IsNullOrEmpty(total))
                {
                    Response.Write("<script>alert('Invalid payment request. Redirecting to My Bookings...'); window.location='My_booking.aspx';</script>");
                    return;
                }

                // Display total amount
                decimal totalAmount = 0;
                if (decimal.TryParse(total, out totalAmount))
                {
                    lblTotalAmount.Text = totalAmount.ToString("0.00");
                    lblGrandTotal.Text = totalAmount.ToString("0.00");
                }

                // Load booking summary
                LoadBookingSummary(bookingRefs);
            }
        }

        private void LoadBookingSummary(string bookingRefs)
        {
            try
            {
                string[] bookingRefArray = bookingRefs.Split(',');
                List<BookingSummary> summaryList = new List<BookingSummary>();

                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();

                    foreach (string bookingRef in bookingRefArray)
                    {
                        if (!string.IsNullOrWhiteSpace(bookingRef))
                        {
                            string sql = "SELECT Route, TotalPrice FROM Passengers WHERE BookingReference = '" + bookingRef.Trim() + "'";
                            SqlCommand cmd = new SqlCommand(sql, con);

                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.Read())
                            {
                                summaryList.Add(new BookingSummary
                                {
                                    Route = reader["Route"].ToString(),
                                    TotalPrice = Convert.ToDecimal(reader["TotalPrice"])
                                });
                            }
                            reader.Close();
                        }
                    }
                }

                rptBookingSummary.DataSource = summaryList;
                rptBookingSummary.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading booking summary: " + ex.Message + "');</script>");
            }
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            try
            {
                // Get booking references from query string
                string bookingRefs = Request.QueryString["bookingRefs"];

                if (string.IsNullOrEmpty(bookingRefs))
                {
                    Response.Write("<script>alert('Invalid payment request.');</script>");
                    return;
                }

                // Validate payment form (basic validation)
                if (string.IsNullOrWhiteSpace(txtCardNumber.Text) || 
                    string.IsNullOrWhiteSpace(txtExpiryDate.Text) ||
                    string.IsNullOrWhiteSpace(txtCVV.Text) ||
                    string.IsNullOrWhiteSpace(txtCardHolderName.Text))
                {
                    Response.Write("<script>alert('Please fill in all payment details.');</script>");
                    return;
                }

                // Process payment (simulate payment gateway)
                bool paymentSuccess = ProcessPayment(bookingRefs);

                if (paymentSuccess)
                {
                    // Update payment status in database
                    UpdatePaymentStatus(bookingRefs);

                    // Redirect to My Bookings with success message
                    Response.Redirect("My_booking.aspx?payment=success");
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

        private bool ProcessPayment(string bookingRefs)
        {
            // Simulate payment processing
            // In real application, integrate with payment gateway (Razorpay, PayU, etc.)
            
            System.Threading.Thread.Sleep(1500); // Simulate processing delay
            
            // For demo: Always return true (simulate success)
            // In production, integrate with actual payment gateway
            return true;
        }

        private void UpdatePaymentStatus(string bookingRefs)
        {
            try
            {
                string[] bookingRefArray = bookingRefs.Split(',');

                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();

                    foreach (string bookingRef in bookingRefArray)
                    {
                        if (!string.IsNullOrWhiteSpace(bookingRef))
                        {
                            string sql = "UPDATE Passengers SET PaymentStatus = 'Paid' WHERE BookingReference = '" + bookingRef.Trim() + "'";
                            SqlCommand cmd = new SqlCommand(sql, con);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error updating payment status: " + ex.Message);
            }
        }

        // Helper class for booking summary
        public class BookingSummary
        {
            public string Route { get; set; }
            public decimal TotalPrice { get; set; }
        }
    }
}

