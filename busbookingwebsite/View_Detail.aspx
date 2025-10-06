<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="View_Detail.aspx.cs" Inherits="busbookingwebsite.View_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Available Routes</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
        .product-container {
            width: 90%;
            margin: 20px auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            font-family: Arial, sans-serif;
        }

        .route-card {
            width: 250px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f8f8f8;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
        }

        .route-card strong {
            color: #2c3e50;
        }

        .back-button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #3498db;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #2980b9;
            transform: translateY(-1px);
        }

        .book-now-button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #ffcc00;
            color: #000;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .book-now-button:hover {
            background-color: #e6b800;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .route-card {
            width: 250px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f8f8f8;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: center;
            transition: all 0.3s ease;
        }

        .route-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header -->
    <header class="header">
        <div class="container">
            <div class="logo">
                <h1>BusBooking</h1>
            </div>
            <nav class="nav">
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="Serach_buses.aspx" class="active">Search Buses</a></li>
                    <li><a href="My_booking.aspx">My Bookings</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                    <li><a href="Register.aspx">Register</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Route Details -->
    <h1 style="text-align:center; margin-top: 20px;">Available Routes</h1>
    <div class="product-container">
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <div class="route-card">
                    <!-- Optional route image -->
                  

                    <!-- Route name -->
                    <asp:Label ID="Label1" runat="server" CssClass="product-name"
                        Text='<%# Eval("RouteName") %>'></asp:Label>
                    <br />

                    <!-- Route details -->
                    <asp:Label ID="Label2" runat="server"
                        Text='<%# "From: " + Eval("Source") + " → " + Eval("Destination") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server"
                        Text='<%# "Fare: ₹ " + Eval("Fare") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server"
                        Text='<%# "Status: " + Eval("Status") %>'></asp:Label>
                    <br />

                    <!-- Action buttons -->
                    <div style="margin-top: 15px; display: flex; gap: 10px; justify-content: center;">
                        <asp:HyperLink ID="hlBookNow" runat="server" CssClass="book-now-button"
                            NavigateUrl='<%# "Book_Now.aspx?bus=" + Server.UrlEncode(Eval("RouteName").ToString()) + "&route=" + Server.UrlEncode(Eval("Source").ToString() + " → " + Eval("Destination").ToString()) + "&fare=" + Eval("Fare") + "&dep=08:30 AM&arr=12:15 PM" %>'>
                            Book Now
                        </asp:HyperLink>
                        <asp:HyperLink ID="hlBack" runat="server" CssClass="back-button"
                            NavigateUrl="Home.aspx">Back</asp:HyperLink>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
                        <li><a href="Admin_login.aspx" style="color:#999; font-size:0.9rem;">Admin Panel</a></li>
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
</asp:Content>
