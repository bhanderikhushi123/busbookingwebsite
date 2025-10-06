using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace busbookingwebsite
{
    public partial class Book_now : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTravelDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                LoadBusDataFromQuery();
            }
        }

        void GetConnection()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
        }

        // Load values from query string
        private void LoadBusDataFromQuery()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["bus"]))
                txtBusName.Text = Request.QueryString["bus"];
            if (!string.IsNullOrEmpty(Request.QueryString["route"]))
                txtRoute.Text = Request.QueryString["route"];
            if (!string.IsNullOrEmpty(Request.QueryString["fare"]))
                txtFarePerTicket.Text = Request.QueryString["fare"];
            if (!string.IsNullOrEmpty(Request.QueryString["dep"]))
                txtDepTime.Text = Request.QueryString["dep"];
            if (!string.IsNullOrEmpty(Request.QueryString["arr"]))
                txtArrTime.Text = Request.QueryString["arr"];
        }

        protected void btnConfirmPay_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    int numberOfSeats = int.Parse(txtNumSeats.Text.Trim());
                    string bookingReference = GenerateBookingReference();
                    List<Passenger> passengers = new List<Passenger>();
                    
                    // Create passenger objects for each seat
                    for (int i = 1; i <= numberOfSeats; i++)
                    {
                        Passenger passenger = GetPassengerData(i);
                        if (passenger != null)
                        {
                            passenger.BookingReference = bookingReference;
                            passenger.Status = "Confirmed";
                            passenger.PaymentStatus = "Pending";
                            passengers.Add(passenger);
                        }
                    }

                    if (passengers.Count == numberOfSeats)
                    {
                        // Insert all passengers into database
                        PassengerDataAccess dataAccess = new PassengerDataAccess();
                        bool success = true;
                        List<int> insertedIds = new List<int>();

                        foreach (var passenger in passengers)
                        {
                            int passengerId = dataAccess.InsertPassenger(passenger);
                            if (passengerId > 0)
                            {
                                insertedIds.Add(passengerId);
                            }
                            else
                            {
                                success = false;
                                break;
                            }
                        }

                        if (success)
                        {
                            Response.Write("<script>alert('Booking Successful! Your Booking Reference: " + bookingReference + "');</script>");
                            Response.Redirect("booking-summary.html?bookingId=" + string.Join(",", insertedIds) + "&ref=" + bookingReference);
                        }
                        else
                        {
                            Response.Write("<script>alert('Error: Failed to create booking. Please try again.');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Error: Please fill in all passenger details.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        private Passenger GetPassengerData(int passengerNumber)
        {
            try
            {
                // Get the appropriate controls based on passenger number
                TextBox txtName = (TextBox)FindControl("txtPassengerName" + passengerNumber);
                TextBox txtAge = (TextBox)FindControl("txtAge" + passengerNumber);
                DropDownList ddlGender = (DropDownList)FindControl("ddlGender" + passengerNumber);
                TextBox txtContact = (TextBox)FindControl("txtContact" + passengerNumber);
                TextBox txtEmail = (TextBox)FindControl("txtEmail" + passengerNumber);

                if (txtName != null && txtAge != null && ddlGender != null && txtContact != null && txtEmail != null)
                {
                    return new Passenger
                    {
                        PassengerName = txtName.Text.Trim(),
                        Age = int.Parse(txtAge.Text.Trim()),
                        Gender = ddlGender.SelectedValue,
                        Contact = txtContact.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        TravelDate = DateTime.Parse(txtTravelDate.Text),
                        NumberOfSeats = 1, // Each passenger represents 1 seat
                        BusName = txtBusName.Text,
                        Route = txtRoute.Text,
                        Fare = decimal.Parse(txtFarePerTicket.Text),
                        DepartureTime = txtDepTime.Text,
                        ArrivalTime = txtArrTime.Text,
                        TotalPrice = decimal.Parse(txtFarePerTicket.Text),
                        SelectedSeats = GetSelectedSeatsForPassenger(passengerNumber)
                    };
                }
            }
            catch (Exception ex)
            {
                // Log error or handle as needed
                Response.Write("<script>console.log('Error getting passenger " + passengerNumber + " data: " + ex.Message + "');</script>");
            }
            return null;
        }

        private string GetSelectedSeatsForPassenger(int passengerNumber)
        {
            if (chkUseSeatLayout.Checked)
            {
                // For now, return the seat number based on passenger number
                // In a real implementation, you might want to let users select specific seats
                return "S" + passengerNumber;
            }
            return null;
        }

        private string GetSelectedSeats()
        {
            if (chkUseSeatLayout.Checked)
            {
                List<string> selectedSeats = new List<string>();
                foreach (ListItem item in chkSeats.Items)
                {
                    if (item.Selected)
                    {
                        selectedSeats.Add(item.Value);
                    }
                }
                return string.Join(",", selectedSeats);
            }
            return null;
        }

        private string GenerateBookingReference()
        {
            return "BK" + DateTime.Now.ToString("yyyyMMddHHmmss");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}