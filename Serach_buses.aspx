<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Serach_buses.aspx.cs" Inherits="busbookingwebsite.Serach_buses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BusBooking - Home</title>
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
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <section class="search-results">
        <div class="container">
            <!-- Search Form -->
            <div class="search-form-container" style="background: #fff; padding: 20px; border-radius: 8px; margin-bottom: 30px;">
                <h2 style="color: #333; margin-bottom: 20px;">Search Buses</h2>
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-bottom: 15px;">
                    <div>
                        <label style="display: block; margin-bottom: 5px; color: #333; font-weight: bold;">From (Source)</label>
                        <asp:TextBox ID="txtSource" runat="server" CssClass="form-control" placeholder="Enter source city"></asp:TextBox>
                    </div>
                    <div>
                        <label style="display: block; margin-bottom: 5px; color: #333; font-weight: bold;">To (Destination)</label>
                        <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control" placeholder="Enter destination city"></asp:TextBox>
                    </div>
                    <div>
                        <label style="display: block; margin-bottom: 5px; color: #333; font-weight: bold;">Travel Date</label>
                        <asp:TextBox ID="txtTravelDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div>
                        <label style="display: block; margin-bottom: 5px; color: #333; font-weight: bold;">Operator</label>
                        <asp:TextBox ID="txtOperator" runat="server" CssClass="form-control" placeholder="Bus operator"></asp:TextBox>
                    </div>
                </div>
                <div style="text-align: center;">
                    <asp:Button ID="btnSearch" runat="server" Text="Search Buses" CssClass="btn-primary" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnShowAll" runat="server" Text="Show All Buses" CssClass="btn-secondary" OnClick="btnShowAll_Click" style="margin-left: 10px;" />
                </div>
            </div>

            <div class="search-header">
                <h2>Available Buses</h2>
                <div class="search-info">
                    <asp:Label ID="lblSearchInfo" runat="server" Text="All available buses"></asp:Label>
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
                    <label>
                        <input type="checkbox" checked>
                        AC</label>
                    <label>
                        <input type="checkbox" checked>
                        Non-AC</label>
                    <label>
                        <input type="checkbox" checked>
                        Sleeper</label>
                </div>
            </div>
            <!-- Bus Listings -->
            <div class="bus-listings">
                <asp:Panel ID="pnlNoBuses" runat="server" Visible="false" style="text-align: center; padding: 40px; background: #fff; border-radius: 8px;">
                    <h3 style="color: #666;">No buses found</h3>
                    <p style="color: #999;">Please try different search criteria or click "Show All Buses" to see all available buses.</p>
                </asp:Panel>
                <asp:Repeater ID="rptBuses" runat="server" OnItemCommand="rptBuses_ItemCommand">
                    <ItemTemplate>
                        <div class="bus-card">
                            <div class="bus-info">
                                <div class="bus-operator">
                                    <h3><%# Eval("Operator") %></h3>
                                    <span class="bus-type ac"><%# Eval("RouteName") %></span>
                                </div>
                                <div class="bus-timing">
                                    <div class="departure">
                                        <span class="city"><%# Eval("Source") %></span>
                                    </div>
                                    <div class="duration">
                                        <span class="arrow">→</span>
                                        <span class="time-duration"><%# Eval("Duration") %></span>
                                    </div>
                                    <div class="arrival">
                                        <span class="city"><%# Eval("Destination") %></span>
                                    </div>
                                </div>
                                <div class="bus-amenities">
                                    <span class="amenity">Distance: <%# Eval("Distance") %></span>
                                    <span class="amenity">Status: <%# Eval("Status") %></span>
                                </div>
                            </div>
                            <div class="bus-pricing">
                                <div class="price">
                                    <span class="amount">₹<%# Eval("Fare") %></span>
                                    <span class="per-seat">per seat</span>
                                </div>
                                <div class="seats-available">
                                    <span class="available">Available</span>
                                </div>
                                <asp:LinkButton ID="lnkBookNow" runat="server" CssClass="btn-primary" 
                                    CommandName="BookNow" 
                                    CommandArgument='<%# Eval("Id") + "|" + Eval("RouteName") + "|" + Eval("Source") + "|" + Eval("Destination") + "|" + Eval("Fare") + "|" + Eval("Operator") %>'>
                                    Book Now
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>BusBooking</h4>
                    <p>Your trusted partner for online bus ticket booking.</p>
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
                    <p>Email: info@busbooking.com</p>
                    <p>Phone: +91 1234567890</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 BusBooking. All rights reserved.</p>
            </div>
        </div>
    </footer>
    </body> </html> </asp:Content>
