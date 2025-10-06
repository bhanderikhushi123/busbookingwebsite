<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Admin_register.aspx.cs" Inherits="busbookingwebsite.Admin_register" %>

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
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Admin Registration Section -->
    <section class="auth-section">
        <div class="container">
            <div class="auth-container">
                <div class="auth-card admin-register">
                    <div class="auth-header">
                        <h2>Admin Registration</h2>
                        <p>Create a new administrator account for the bus booking system.</p>
                    </div>
                    <!-- FORM Registration Section -->
                    <%--<form id="form1" runat="server" class="auth-form">--%>
                        <h2>Admin Registration</h2>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter first name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtFirstName" runat="server" ErrorMessage="First Name is required" ForeColor="Red" />
                            </div>
                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter last name"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtLastName" runat="server" ErrorMessage="Last Name is required" ForeColor="Red" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Admin Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter admin username"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtUsername" runat="server" ErrorMessage="Username is required" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is required" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter phone number"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtPhone" runat="server" ErrorMessage="Phone is required" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Admin Access Code</label>
                            <asp:TextBox ID="txtAdminCode" runat="server" TextMode="Password" placeholder="Enter admin access code"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtAdminCode" runat="server" ErrorMessage="Access Code required" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Create a strong password"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtPassword" runat="server" ErrorMessage="Password required" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                            <asp:CompareValidator ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" runat="server" ErrorMessage="Passwords do not match" ForeColor="Red" />
                        </div>

                        <div class="form-group">
                            <label>Admin Role</label>
                            <asp:DropDownList ID="ddlRole" runat="server">
                                <asp:ListItem Value="">Select admin role</asp:ListItem>
                                <asp:ListItem Value="super_admin">Super Administrator</asp:ListItem>
                                <asp:ListItem Value="admin">Administrator</asp:ListItem>
                                <asp:ListItem Value="manager">Manager</asp:ListItem>
                                <asp:ListItem Value="operator">Operator</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ControlToValidate="ddlRole" InitialValue="" runat="server" ErrorMessage="Role required" ForeColor="Red" />
                        </div>

<%--                        <div class="form-options">
                            <asp:CheckBox ID="chkTerms" runat="server" Text="I agree to the Admin Terms & Conditions" />
                            <asp:RequiredFieldValidator ControlToValidate="chkTerms" InitialValue="false" runat="server" ErrorMessage="You must agree" ForeColor="Red" />

                            <asp:CheckBox ID="chkSecurity" runat="server" Text="I understand the security responsibilities of an admin account" />
                            <asp:RequiredFieldValidator ControlToValidate="chkSecurity" InitialValue="false" runat="server" ErrorMessage="You must agree" ForeColor="Red" />
                        </div>--%>

                        <asp:Button ID="btnRegister" runat="server" Text="Create Admin Account" CssClass="btn-primary" OnClick="btnRegister_Click" />

                 <%--   </form>--%>

                    <div class="auth-footer">
                        <p>Already have an admin account? <a href="admin-login.html">Login</a></p>
                        <p>Need help? Contact system administrator</p>
                    </div>
                </div>
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

