<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Serach_buses.aspx.cs" Inherits="busbookingwebsite.Serach_buses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>BusBooking - Home</title>
                    <link rel="stylesheet" href="styles.css">
                </head>
                <body>
                    <!-- Header -->
                    <header class="header">
                        <div class="container">
                            <div class="logo">
                                <h1>BusBooking</h1>
                            </div>
                            <nav class="nav">
                                <ul>
                                    <li><a href="Home.aspx" class="active">Home</a></li>
                                    <li><a href="Serach_buses.aspx">Search Buses</a></li>
                                    <li><a href="My_booking.aspx">My Bookings</a></li>
                                    <li><a href="Contact.aspx">Contact</a></li>
                                    <li><a href="Login.aspx">Login</a></li>
                                    <li><a href="Register.aspx">Register</a></li>
                                </ul>
                            </nav>
                        </div>
                    </header>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">
      <section class="search-results">
        <div class="container">
            <div class="search-header">
                <h2>Search Results</h2>
                <div class="search-info">
                    <p>Mumbai → Delhi | 15 Dec 2024 | 2 Passengers</p>
                </div>
            </div>

            <!-- Filters -->
            <div class="filters">
                <div class="filter-group">
                    <label>Sort by:</label>
                    <select>
                        <option>Price: Low to High</option>
                        <option>Price: High to Low</option>
                        <option>Departure Time</option>
                        <option>Duration</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Bus Type:</label>
                    <label><input type="checkbox" checked> AC</label>
                    <label><input type="checkbox" checked> Non-AC</label>
                    <label><input type="checkbox" checked> Sleeper</label>
                </div>
            </div>

            <!-- Bus Listings -->
            <div class="bus-listings">
                <!-- Bus 1 -->
                <div class="bus-card">
                    <div class="bus-info">
                        <div class="bus-operator">
                            <h3>Express Travels</h3>
                            <span class="bus-type ac">AC Sleeper</span>
                        </div>
                        <div class="bus-timing">
                            <div class="departure">
                                <span class="time">22:00</span>
                                <span class="city">Mumbai</span>
                            </div>
                            <div class="duration">
                                <span class="arrow">→</span>
                                <span class="time-duration">24h 30m</span>
                            </div>
                            <div class="arrival">
                                <span class="time">22:30</span>
                                <span class="city">Delhi</span>
                            </div>
                        </div>
                        <div class="bus-amenities">
                            <span class="amenity">WiFi</span>
                            <span class="amenity">USB Charging</span>
                            <span class="amenity">Water Bottle</span>
                        </div>
                    </div>
                    <div class="bus-pricing">
                        <div class="price">
                            <span class="amount">₹1,200</span>
                            <span class="per-seat">per seat</span>
                        </div>
                        <div class="seats-available">
                            <span class="available">32 seats available</span>
                        </div>
                        <a href="bus-details.html" class="btn-primary">Select Seats</a>
                    </div>
                </div>

                <!-- Bus 2 -->
                <div class="bus-card">
                    <div class="bus-info">
                        <div class="bus-operator">
                            <h3>Royal Express</h3>
                            <span class="bus-type non-ac">Non-AC Sleeper</span>
                        </div>
                        <div class="bus-timing">
                            <div class="departure">
                                <span class="time">20:30</span>
                                <span class="city">Mumbai</span>
                            </div>
                            <div class="duration">
                                <span class="arrow">→</span>
                                <span class="time-duration">25h 15m</span>
                            </div>
                            <div class="arrival">
                                <span class="time">21:45</span>
                                <span class="city">Delhi</span>
                            </div>
                        </div>
                        <div class="bus-amenities">
                            <span class="amenity">Water Bottle</span>
                        </div>
                    </div>
                    <div class="bus-pricing">
                        <div class="price">
                            <span class="amount">₹800</span>
                            <span class="per-seat">per seat</span>
                        </div>
                        <div class="seats-available">
                            <span class="available">18 seats available</span>
                        </div>
                        <a href="bus-details.html" class="btn-primary">Select Seats</a>
                    </div>
                </div>

                <!-- Bus 3 -->
                <div class="bus-card">
                    <div class="bus-info">
                        <div class="bus-operator">
                            <h3>Premium Travels</h3>
                            <span class="bus-type ac">AC Sleeper</span>
                        </div>
                        <div class="bus-timing">
                            <div class="departure">
                                <span class="time">23:15</span>
                                <span class="city">Mumbai</span>
                            </div>
                            <div class="duration">
                                <span class="arrow">→</span>
                                <span class="time-duration">23h 45m</span>
                            </div>
                            <div class="arrival">
                                <span class="time">23:00</span>
                                <span class="city">Delhi</span>
                            </div>
                        </div>
                        <div class="bus-amenities">
                            <span class="amenity">WiFi</span>
                            <span class="amenity">USB Charging</span>
                            <span class="amenity">Water Bottle</span>
                            <span class="amenity">Snacks</span>
                        </div>
                    </div>
                    <div class="bus-pricing">
                        <div class="price">
                            <span class="amount">₹1,500</span>
                            <span class="per-seat">per seat</span>
                        </div>
                        <div class="seats-available">
                            <span class="available">8 seats available</span>
                        </div>
                        <a href="bus-details.html" class="btn-primary">Select Seats</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <!-- Footer -->
                <footer class="footer">
                    <div class="container">
                        <div class="footer-content">
                            <div class="footer-section">
                                <h4>BusBooking</h4>
                                <p>
                                    Your trusted partner for online bus ticket booking.</p>
                            </div>
                            <div class="footer-section">
                                <h4>Quick Links</h4>
                                <ul>
                                    <li><a href="Home.aspx">Home</a></li>
                                    <li><a href="Serach_buses.aspx">Search Buses</a></li>
                                    <li><a href="My_booking.aspx">My Bookings</a></li>
                                    <li><a href="Admin_login.aspx" style="color: #999; font-size: 0.9rem;">Admin Panel</a></li>
                                </ul>
                            </div>
                            <div class="footer-section">
                                <h4>Contact</h4>
                                <p>
                                    Email: info@busbooking.com</p>
                                <p>
                                    Phone: +91 1234567890</p>
                            </div>
                        </div>
                        <div class="footer-bottom">
                            <p>
                                &copy; 2024 BusBooking. All rights reserved.</p>
                        </div>
                    </div>
    </footer>
</body>
</html>
</asp:Content>

