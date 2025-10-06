<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="busbookingwebsite.Register" %>

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
    <!-- Register Section -->
    <section class="auth-section">
        <div class="container">
            <div class="auth-container">
                <div class="auth-card">
                    <div class="auth-header">
                        <h2>Create Your Account</h2>
                        <p>Join us and start booking your bus tickets online!</p>
                    </div>

                    <%--                    <form class="auth-form" action="login.html">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input type="text" id="firstName" name="firstName" placeholder="Enter first name" required>
                            </div>
                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <input type="text" id="lastName" name="lastName" placeholder="Enter last name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email" required>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="Enter phone number" required>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Create a password" required>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                        </div>

                        <div class="form-options">
                            <label class="checkbox-label">
                                <input type="checkbox" name="terms" required>
                                <span class="checkmark"></span>
                                I agree to the <a href="#">Terms & Conditions</a>
                            </label>
                        </div>

                        <button type="submit" class="btn-primary">Create Account</button>
                    </form>--%>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtFirstName">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter first name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="txtLastName">Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter last name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtEmail">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtPhone">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" CssClass="form-control" placeholder="Enter phone number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Create a password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm your password"></asp:TextBox>
                        <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match" CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                    </div>

                    <%--<div class="form-options">
                            <asp:CheckBox ID="chkTerms" runat="server" CssClass="checkbox-label" />
                            <label for="chkTerms"> I agree to the <a href="#">Terms & Conditions</a></label>
                            <asp:RequiredFieldValidator ID="rfvTerms" runat="server" ControlToValidate="chkTerms" InitialValue="false" ErrorMessage="You must accept the terms" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>--%>

                    <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-primary" OnClick="btnRegister_Click" />

                    <div class="auth-footer">
                        <p>Already have an account? <a href="login.aspx">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    <h2>Registered Users</h2>

    <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False"
        OnRowCommand="GridViewUsers_RowCommand" BorderWidth="2px" CellPadding="5" CssClass="table">

        <columns>
            <asp:TemplateField HeaderText="Id">
                <itemtemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="First Name">
                <itemtemplate>
                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Last Name">
                <itemtemplate>
                    <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <itemtemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Phone">
                <itemtemplate>
                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Password">
                <itemtemplate>
                    <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Edit">
                <itemtemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edit">Edit</asp:LinkButton>
                </itemtemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Delete">
                <itemtemplate>
                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_delete">Delete</asp:LinkButton>
                </itemtemplate>
            </asp:TemplateField>
        </columns>
    </asp:GridView>

&nbsp;&nbsp;&nbsp; 
</asp:Content>

