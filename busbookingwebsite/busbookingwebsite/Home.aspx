<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="busbookingwebsite.Home" %>
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
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder3">
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
                                    <li><a href="Serach.aspx">Search Buses</a></li>
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
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h2>Book Your Bus Tickets Online</h2>
                <p>
                    Travel safely and comfortably with our premium bus services
                </p>

                <!-- Search Form -->
                <%--<div class="search-form">-
                     <form action="search.html">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="from">
                                            From</label>
                                            <input type="text" id="from" name="from" placeholder="Enter departure city" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="to">
                                            To</label>
                                            <input type="text" id="to" name="to" placeholder="Enter destination city" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="date">
                                            Date of Journey</label>
                                            <input type="date" id="date" name="date" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="passengers">
                                            Passengers</label>
                                            <select id="passengers" name="passengers">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn-primary">
                                        Search Buses
                                    </button>
                                </form>--%>


                <!-- Featured Routes -->
                <section class="featured-routes">
                    <div class="container">
                        <h3>Popular Routes</h3>
                        <div class="routes-grid">
                            <div class="route-card">
                                <h4>Mumbai to Delhi</h4>
                                <p>
                                    Starting from ₹1200
                                </p>
                                <span class="duration">24 hours</span>
                            </div>
                            <div class="route-card">
                                <h4>Bangalore to Chennai</h4>
                                <p>
                                    Starting from ₹800
                                </p>
                                <span class="duration">8 hours</span>
                            </div>
                            <div class="route-card">
                                <h4>Kolkata to Hyderabad</h4>
                                <p>
                                    Starting from ₹1500
                                </p>
                                <span class="duration">20 hours</span>
                            </div>
                            <div class="route-card">
                                <h4>Pune to Goa</h4>
                                <p>
                                    Starting from ₹600
                                </p>
                                <span class="duration">12 hours</span>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Features -->
                <section class="features">
                    <div class="container">
                        <h3>Why Choose Us</h3>
                        <div class="features-grid">
                            <div class="feature-card">
                                <div class="feature-icon">
                                    🚌
                                </div>
                                <h4>Premium Buses</h4>
                                <p>
                                    Travel in comfort with our modern fleet
                                </p>
                            </div>
                            <div class="feature-card">
                                <div class="feature-icon">
                                    💰
                                </div>
                                <h4>Best Prices</h4>
                                <p>
                                    Get the best deals and discounts
                                </p>
                            </div>
                            <div class="feature-card">
                                <div class="feature-icon">
                                    🛡️
                                </div>
                                <h4>Safe Travel</h4>
                                <p>
                                    Your safety is our top priority
                                </p>
                            </div>
                            <div class="feature-card">
                                <div class="feature-icon">
                                    📱
                                </div>
                                <h4>Easy Booking</h4>
                                <p>
                                    Book tickets in just a few clicks
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
                <center>
                    <h1>Online Bus Booking Form</h1>

                    <table border="3">
                        <tr>
                            <td>Passenger Name:</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Gender:</td>
                            <td>
                                <asp:RadioButtonList ID="rblGender" runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>From City:</td>
                            <td>
                                <asp:DropDownList ID="ddlFromCity" runat="server">
                                    <asp:ListItem>Rajkot</asp:ListItem>
                                    <asp:ListItem>Pune</asp:ListItem>
                                    <asp:ListItem>Mumbai</asp:ListItem>
                                    <asp:ListItem>Surat</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>To City:</td>
                            <td>
                                <asp:DropDownList ID="ddlToCity" runat="server">
                                    <asp:ListItem>Ahmedabad</asp:ListItem>
                                    <asp:ListItem>Delhi</asp:ListItem>
                                    <asp:ListItem>Bangalore</asp:ListItem>
                                    <asp:ListItem>Chennai</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Travel Date:</td>
                            <td>
                                <asp:TextBox ID="txtTravelDate" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Number of Seats:</td>
                            <td>
                                <asp:TextBox ID="txtSeats" runat="server" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Upload ID Proof:</td>
                            <td>
                                <asp:FileUpload ID="fuIDProof" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnBook" runat="server" Text="Book Ticket" OnClick="btnBook_Click" />
                            </td>
                        </tr>
                    </table>
                </center>
            </div>
        </div>
        </div>
        <br />
        <br />
            <center>
        <table border="3">
            <tr>
                <td class="auto-style1">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Id">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PassengerName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("PassengerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FromCity">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("FromCity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ToCity">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ToCity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TravelDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("TravelDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Seats">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Seats") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IDProofPath">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# Eval("IDProofPath") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </center>
    </section>
</asp:Content>

