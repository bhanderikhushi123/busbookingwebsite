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
		string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTravelDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
                LoadBusDataFromQuery();
                //TestDatabaseConnection();
            }
        }

        //private void TestDatabaseConnection()
        //{
        //    try
        //    {
        //        getcon();
        //        cmd = new SqlCommand("SELECT COUNT(*) FROM Passengers", con);
        //        int count = Convert.ToInt32(cmd.ExecuteScalar());
        //        con.Close();
        //        Response.Write("<script>alert('Database Connected! Records in Passengers: " + count + "');</script>");
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('Database connection failed: " + ex.Message + "');</script>");
        //    }
        //}

		void getcon()
        {
            con = new SqlConnection(s);
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
            try
            {
                string bookingReference = "BK" + DateTime.Now.ToString("yyyyMMddHHmmss");

                int numberOfSeats = 1;
                int.TryParse(txtNumSeats.Text, out numberOfSeats);
                if (numberOfSeats <= 0) numberOfSeats = 1;

                decimal farePerTicket = 0m;
                decimal.TryParse(txtFarePerTicket.Text, out farePerTicket);
                decimal totalPrice = farePerTicket * numberOfSeats;

                var esc = new Func<string, string>(val => (val ?? string.Empty).Replace("'", "''"));

                string travelDate = esc(txtTravelDate.Text);
                string busName = esc(txtBusName.Text);
                string route = esc(txtRoute.Text);
                string dep = esc(txtDepTime.Text);
                string arr = esc(txtArrTime.Text);
                string status = esc("Confirmed");
                string paymentStatus = esc("Paid");

                //enter 3 passenger details
                string[] names = new string[] { txtPassengerName1.Text, txtPassengerName2?.Text ?? string.Empty, txtPassengerName3?.Text ?? string.Empty };
                string[] ages = new string[] { txtAge1.Text, txtAge2?.Text ?? string.Empty, txtAge3?.Text ?? string.Empty };
                string[] genders = new string[] { ddlGender1.SelectedValue, ddlGender2?.SelectedValue ?? string.Empty, ddlGender3?.SelectedValue ?? string.Empty };
                string[] contacts = new string[] { txtContact1.Text, txtContact2?.Text ?? string.Empty, txtContact3?.Text ?? string.Empty };
                string[] emails = new string[] { txtEmail1.Text, txtEmail2?.Text ?? string.Empty, txtEmail3?.Text ?? string.Empty };

                // Simple seat assignment
                List<string> seatCodes = new List<string>();
                for (int i = 1; i <= numberOfSeats; i++)
                    seatCodes.Add("Seat " + i);

                getcon();
                int totalInserted = 0;

                for (int i = 0; i < numberOfSeats && i < 3; i++)
                {
                    string nameRaw = string.IsNullOrWhiteSpace(names[i]) ? names[0] : names[i];
                    string ageRaw = string.IsNullOrWhiteSpace(ages[i]) ? ages[0] : ages[i];
                    string genderRaw = string.IsNullOrWhiteSpace(genders[i]) ? genders[0] : genders[i];
                    string contactRaw = string.IsNullOrWhiteSpace(contacts[i]) ? contacts[0] : contacts[i];
                    string emailRaw = string.IsNullOrWhiteSpace(emails[i]) ? emails[0] : emails[i];

                    string passengerName = esc(nameRaw);
                    string ageValue = string.IsNullOrWhiteSpace(ageRaw) ? "NULL" : int.Parse(ageRaw).ToString();
                    string gender = esc(genderRaw);
                    string contact = esc(contactRaw);
                    string email = esc(emailRaw);
                    string selectedSeat = esc(seatCodes[i]);

                    string sql = "INSERT INTO Passengers (PassengerName, Age, Gender, Contact, Email, TravelDate, NumberOfSeats, BusName, Route, Fare, TotalPrice, DepartureTime, ArrivalTime, SelectedSeats, BookingReference, Status, PaymentStatus) " +
                                 "VALUES ('" + passengerName + "', " + ageValue + ", '" + gender + "', '" + contact + "', '" + email + "', '" + travelDate + "', " + numberOfSeats + ", '" + busName + "', '" + route + "', " +
                                 farePerTicket.ToString(System.Globalization.CultureInfo.InvariantCulture) + ", " + totalPrice.ToString(System.Globalization.CultureInfo.InvariantCulture) + ", '" + dep + "', '" + arr + "', '" + selectedSeat + "', '" + bookingReference + "', '" + status + "', '" + paymentStatus + "')";

                    cmd = new SqlCommand(sql, con);
                    totalInserted += cmd.ExecuteNonQuery();
                }
                con.Close();

                if (totalInserted > 0)
                {
                    // Only show success message
                    Response.Write("<script>alert('Record successfully inserted!'); window.location='My_booking.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Record insertion failed.');</script>");
                }
            }
            catch
            {
                // Suppress detailed error messages
                Response.Write("<script>alert('An error occurred. Please try again.');</script>");
            }
        }
        

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}