<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="busbookingwebsite.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <style>
           .route-card {
    background-color: #fff;   /* white card background */
    color: #000;              /* black text */
    padding: 15px;
    margin: 10px;
    border: 1px solid #ccc;
    border-radius: 6px;
    display: inline-block;
    min-width: 220px;
    text-align: left;
}
        /* General page styles */
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: #3b4a78; /* Dark blue background */
    color: #fff;
}

/* Centered heading */
h1 {
    text-align: center;
    font-size: 36px;
    margin-bottom: 20px;
    color: #fff;
}

/* Form table styling */
table {
    border-collapse: collapse;
    width: 50%;
    margin: 0 auto 30px auto;
    background-color: #4a5ca0;
    color: #fff;
}

table td {
    padding: 10px;
    border: 1px solid #fff;
}

table input[type="text"],
table input[type="email"],
table input[type="date"],
table input[type="number"],
table select {
    width: 100%;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

/* Button styling */
table input[type="submit"],
table input[type="button"],
table button,
asp\:Button {
    background-color: #ffcc00;
    color: #000;
    font-weight: bold;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 4px;
}

table input[type="submit"]:hover,
table input[type="button"]:hover,
table button:hover,
asp\:Button:hover {
    background-color: #e6b800;
}

/* GridView styling */
.auto-style1 {
    width: 90%;
}

.auto-style1 table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
    background-color: #f0f0f0;
    color: #000;
}

.auto-style1 table th,
.auto-style1 table td {
    border: 1px solid #999;
    padding: 10px;
    text-align: center;
}

.auto-style1 table th {
    background-color: #4a5ca0;
    color: #fff;
}

.auto-style1 table tr:nth-child(even) {
    background-color: #e6e6e6;
}

.auto-style1 table tr:hover {
    background-color: #d0d0d0;
}

/* GridView link buttons */
.auto-style1 a {
    color: #1a73e8;
    text-decoration: none;
    font-weight: bold;
}

.auto-style1 a:hover {
    text-decoration: underline;
}

/* Images in GridView */
.auto-style1 img {
    border: 1px solid #999;
    border-radius: 4px;
}

/* Radio button spacing */
td input[type="radio"] {
    margin-right: 5px;
}

/* Button classes used in route cards and pager */
.btn {
    display: inline-block;
    padding: 8px 14px;
    border-radius: 6px;
    font-weight: 600;
    text-decoration: none;
    cursor: pointer;
    border: 1px solid transparent;
    transition: all 0.2s ease;
    line-height: 1.2;
}
.btn-yellow { background: #ffcc00; color: #000; border-color: #e6b800; }
.btn-yellow:hover { background: #e6b800; }
.btn-outline { background: transparent; color: #0969da; border-color: #0969da; }
.btn-outline:hover { background: #e7f0fe; }
.prev-btn { background: transparent; color: #0969da; border: 1px solid #0969da; border-radius: 6px; padding: 8px 14px; text-decoration: none; font-weight: 600; }
.prev-btn:hover { background: #e7f0fe; }
.next-btn { background: #ffcc00; color: #000; border: 1px solid #e6b800; border-radius: 6px; padding: 8px 14px; text-decoration: none; font-weight: 700; }
.next-btn:hover { background: #e6b800; }
.pager { display: flex; justify-content: center; gap: 16px; align-items: center; margin-top: 12px; }

    </style>


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


      <center>
    <!-- Routes Section -->
     <h1>Available Routes</h1>
     <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
         <ItemTemplate>
             <div class="route-card">
                 <strong>Route:</strong> <%# Eval("RouteName") %><br />
                 <strong>From:</strong> <%# Eval("Source") %> → <%# Eval("Destination") %><br />
                 <strong>Fare:</strong> ₹ <%# Eval("Fare") %><br />
                 <strong>Status:</strong> <%# Eval("Status") %><br /><br />

                <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn btn-yellow" CommandName="Book" CommandArgument='<%# Eval("Id") %>'>Book Now</asp:LinkButton>
<%--                &nbsp;&nbsp;--%>
                 
                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-outline" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_View">View Detail</asp:LinkButton>
             </div>
         </ItemTemplate>
     </asp:DataList>

     <br />
     <div class="pager">
         <asp:LinkButton ID="LinkButton1" runat="server" CssClass="prev-btn" OnClick="LinkButton1_Click">Previous</asp:LinkButton>
         <asp:LinkButton ID="LinkButton2" runat="server" CssClass="next-btn" OnClick="LinkButton2_Click">Next</asp:LinkButton>
     </div>


</center>


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
        
    </section>
</asp:Content>

