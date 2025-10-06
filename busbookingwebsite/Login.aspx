<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="busbookingwebsite.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>BusBooking</h4>
                    <p>
                        Your trusted partner for online bus ticket booking.
                    </p>
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
                        Email: info@busbooking.com
                    </p>
                    <p>
                        Phone: +91 1234567890
                    </p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>
                    &copy; 2024 BusBooking. All rights reserved.
                </p>
            </div>
        </div>
    </footer>
    </body>
</html>
</asp:Content>
<asp:Content ID="Content7" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Login Section -->
    <section class="auth-section">
        <div class="container">
            <div class="auth-container">
                <div class="auth-card">
                    <div class="auth-header">
                        <h2>Login to Your Account</h2>
                        <p>Welcome back! Please enter your details.</p>
                    </div>

                    <%-- <form class="auth-form" action="index.html">
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>

                    <div class="form-options">
                        <label class="checkbox-label">
                            <input type="checkbox" name="remember">
                            <span class="checkmark"></span>
                            Remember me
                        </label>
                        <a href="#" class="forgot-password">Forgot password?</a>
                    </div>

                    <button type="submit" class="btn-primary">Login</button>
                </form>--%>
                    <div class="auth-form">
                        <div class="form-group">
                            <label for="txtEmail">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input" TextMode="Email"
                                placeholder="Enter your email"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="txtPassword">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password"
                                placeholder="Enter your password"></asp:TextBox>
                        </div>

                        <div class="form-options">
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkRemember" runat="server" />
                                <span class="checkmark"></span>
                                Remember me
                            </label>
                            <a href="#" class="forgot-password">Forgot password?</a>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary"
                            OnClick="btnLogin_Click" />
                    </div>

                    <div class="auth-footer">
                        <p>Don't have an account? <a href="register.html">Sign up</a></p>
                        <div class="admin-link">
                            <p>Are you an administrator? <a href="Admin_login.aspx" class="admin-panel-link">Access Admin Panel</a></p>
                        </div>


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

