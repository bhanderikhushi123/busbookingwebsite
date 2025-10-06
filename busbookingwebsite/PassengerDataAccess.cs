using System;
using System.Data.SqlClient;
using System.Configuration;

namespace busbookingwebsite
{
    public class PassengerDataAccess
    {
        private string connectionString;

        public PassengerDataAccess()
        {
            connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        }

        public int InsertPassenger(Passenger passenger)
        {
            int passengerId = 0;
            
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    
                    string query = @"
                        INSERT INTO Passengers 
                        (PassengerName, Age, Gender, Contact, Email, TravelDate, NumberOfSeats, 
                         BusName, Route, Fare, DepartureTime, ArrivalTime, TotalPrice, SelectedSeats, 
                         BookingReference, Status, PaymentStatus, BookingDate)
                        VALUES 
                        (@PassengerName, @Age, @Gender, @Contact, @Email, @TravelDate, @NumberOfSeats, 
                         @BusName, @Route, @Fare, @DepartureTime, @ArrivalTime, @TotalPrice, @SelectedSeats, 
                         @BookingReference, @Status, @PaymentStatus, @BookingDate);
                        SELECT SCOPE_IDENTITY();";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PassengerName", passenger.PassengerName);
                        cmd.Parameters.AddWithValue("@Age", passenger.Age);
                        cmd.Parameters.AddWithValue("@Gender", passenger.Gender);
                        cmd.Parameters.AddWithValue("@Contact", passenger.Contact);
                        cmd.Parameters.AddWithValue("@Email", passenger.Email);
                        cmd.Parameters.AddWithValue("@TravelDate", passenger.TravelDate);
                        cmd.Parameters.AddWithValue("@NumberOfSeats", passenger.NumberOfSeats);
                        cmd.Parameters.AddWithValue("@BusName", passenger.BusName);
                        cmd.Parameters.AddWithValue("@Route", passenger.Route);
                        cmd.Parameters.AddWithValue("@Fare", passenger.Fare);
                        cmd.Parameters.AddWithValue("@DepartureTime", passenger.DepartureTime);
                        cmd.Parameters.AddWithValue("@ArrivalTime", passenger.ArrivalTime);
                        cmd.Parameters.AddWithValue("@TotalPrice", passenger.TotalPrice);
                        cmd.Parameters.AddWithValue("@SelectedSeats", passenger.SelectedSeats ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@BookingReference", passenger.BookingReference);
                        cmd.Parameters.AddWithValue("@Status", passenger.Status);
                        cmd.Parameters.AddWithValue("@PaymentStatus", passenger.PaymentStatus);
                        cmd.Parameters.AddWithValue("@BookingDate", passenger.BookingDate);

                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            passengerId = Convert.ToInt32(result);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the error (you might want to use a proper logging framework)
                    throw new Exception("Error inserting passenger: " + ex.Message, ex);
                }
            }
            
            return passengerId;
        }

        public Passenger GetPassengerById(int passengerId)
        {
            Passenger passenger = null;
            
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    
                    string query = @"
                        SELECT PassengerId, PassengerName, Age, Gender, Contact, Email, TravelDate, 
                               NumberOfSeats, BusName, Route, Fare, DepartureTime, ArrivalTime, 
                               TotalPrice, SelectedSeats, BookingReference, Status, PaymentStatus, BookingDate
                        FROM Passengers 
                        WHERE PassengerId = @PassengerId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@PassengerId", passengerId);
                        
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                passenger = new Passenger
                                {
                                    PassengerId = Convert.ToInt32(reader["PassengerId"]),
                                    PassengerName = reader["PassengerName"].ToString(),
                                    Age = Convert.ToInt32(reader["Age"]),
                                    Gender = reader["Gender"].ToString(),
                                    Contact = reader["Contact"].ToString(),
                                    Email = reader["Email"].ToString(),
                                    TravelDate = Convert.ToDateTime(reader["TravelDate"]),
                                    NumberOfSeats = Convert.ToInt32(reader["NumberOfSeats"]),
                                    BusName = reader["BusName"].ToString(),
                                    Route = reader["Route"].ToString(),
                                    Fare = Convert.ToDecimal(reader["Fare"]),
                                    DepartureTime = reader["DepartureTime"].ToString(),
                                    ArrivalTime = reader["ArrivalTime"].ToString(),
                                    TotalPrice = Convert.ToDecimal(reader["TotalPrice"]),
                                    SelectedSeats = reader["SelectedSeats"] != DBNull.Value ? reader["SelectedSeats"].ToString() : null,
                                    BookingReference = reader["BookingReference"].ToString(),
                                    Status = reader["Status"].ToString(),
                                    PaymentStatus = reader["PaymentStatus"].ToString(),
                                    BookingDate = Convert.ToDateTime(reader["BookingDate"])
                                };
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error getting passenger: " + ex.Message, ex);
                }
            }
            
            return passenger;
        }

        public bool UpdatePassengerStatus(int passengerId, string status, string paymentStatus = null)
        {
            bool success = false;
            
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    
                    string query = "UPDATE Passengers SET Status = @Status";
                    if (!string.IsNullOrEmpty(paymentStatus))
                    {
                        query += ", PaymentStatus = @PaymentStatus";
                    }
                    query += " WHERE PassengerId = @PassengerId";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Status", status);
                        if (!string.IsNullOrEmpty(paymentStatus))
                        {
                            cmd.Parameters.AddWithValue("@PaymentStatus", paymentStatus);
                        }
                        cmd.Parameters.AddWithValue("@PassengerId", passengerId);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        success = rowsAffected > 0;
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error updating passenger status: " + ex.Message, ex);
                }
            }
            
            return success;
        }
    }
}
