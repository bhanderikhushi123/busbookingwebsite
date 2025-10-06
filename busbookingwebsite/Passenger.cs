using System;

namespace busbookingwebsite
{
    public class Passenger
    {
        public int PassengerId { get; set; }
        public string PassengerName { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Contact { get; set; }
        public string Email { get; set; }
        public DateTime TravelDate { get; set; }
        public int NumberOfSeats { get; set; }
        public string BusName { get; set; }
        public string Route { get; set; }
        public decimal Fare { get; set; }
        public string DepartureTime { get; set; }
        public string ArrivalTime { get; set; }
        public decimal TotalPrice { get; set; }
        public string SelectedSeats { get; set; }
        public string BookingReference { get; set; }
        public string Status { get; set; }
        public string PaymentStatus { get; set; }
        public DateTime BookingDate { get; set; }

        public Passenger()
        {
            BookingDate = DateTime.Now;
            Status = "Pending";
            PaymentStatus = "Pending";
        }
    }
}
