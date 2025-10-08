<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Admin_login.aspx.cs" Inherits="busbookingwebsite.Admin_login" %>
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
       <!-- Admin Login Section -->
    <section class="auth-section">
        <div class="container">
            <div class="auth-container">
                <div class="auth-card admin-login">
                    <div class="auth-header">
                        <h2>Admin Login</h2>
                        <p>Access the admin dashboard to manage your bus booking system.</p>
                    </div>
                    
                     <div class="auth-form">
                        <div class="form-group">
                            <label for="txtUsername">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter admin username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="Username is required" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label for="txtPassword">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter admin password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Password is required" ForeColor="Red" />
                        </div>

                        <div class="form-options">
                            <asp:CheckBox ID="chkRemember" runat="server" Text="Remember me" />
                            <a href="#" class="forgot-password">Forgot password?</a>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Login to Admin Panel" CssClass="btn-primary" OnClick="btnLogin_Click" />
                    </div>
                    
                    <div class="auth-footer">
                        <p>Need help? Contact system administrator</p>
                        <p>New admin? <a href="Admin_register.aspx">Register here</a></p>
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

