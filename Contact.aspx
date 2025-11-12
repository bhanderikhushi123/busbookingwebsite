<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="busbookingwebsite.Contact" %>
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
        <!-- Contact Section -->
    <section class="contact-section">
        <div class="container">
            <div class="contact-header">
                <h2>Contact Us</h2>
                <p>We're here to help! Get in touch with us for any questions or support.</p>
            </div>

            <div class="contact-content">
                <!-- Contact Information -->
                <div class="contact-info">
                    <h3>Get in Touch</h3>
                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-icon">📧</div>
                            <div class="info-details">
                                <h4>Email Us</h4>
                                <p>info@busbooking.com</p>
                                <p>support@busbooking.com</p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">📞</div>
                            <div class="info-details">
                                <h4>Call Us</h4>
                                <p>+91 1234567890</p>
                                <p>+91 9876543210</p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">📍</div>
                            <div class="info-details">
                                <h4>Visit Us</h4>
                                <p>123 Bus Terminal Road</p>
                                <p>Mumbai, Maharashtra 400001</p>
                            </div>
                        </div>
                        
                        <div class="info-item">
                            <div class="info-icon">🕒</div>
                            <div class="info-details">
                                <h4>Business Hours</h4>
                                <p>Monday - Friday: 8:00 AM - 8:00 PM</p>
                                <p>Saturday - Sunday: 9:00 AM - 6:00 PM</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="contact-form-container">
                    <h3>Send us a Message</h3>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary" DisplayMode="BulletList" ShowMessageBox="false" ShowSummary="true" />
                    <div class="contact-form">
                        <div class="form-row">
                            <div class="form-group">
                                <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName" Text="First Name"></asp:Label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-control" placeholder="Enter your first name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                                    ErrorMessage="First name is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName" Text="Last Name"></asp:Label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="input-control" placeholder="Enter your last name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                                    ErrorMessage="Last name is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email Address"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-control" placeholder="Enter your email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Email is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Enter a valid email address."
                                    CssClass="validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" Text="Phone Number"></asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="input-control" placeholder="Enter your phone number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblSubject" runat="server" AssociatedControlID="ddlSubject" Text="Subject"></asp:Label>
                            <asp:DropDownList ID="ddlSubject" runat="server" CssClass="input-control">
                                <asp:ListItem Value="">Select a subject</asp:ListItem>
                                <asp:ListItem Value="booking">Booking Inquiry</asp:ListItem>
                                <asp:ListItem Value="cancellation">Cancellation Request</asp:ListItem>
                                <asp:ListItem Value="refund">Refund Request</asp:ListItem>
                                <asp:ListItem Value="complaint">Complaint</asp:ListItem>
                                <asp:ListItem Value="suggestion">Suggestion</asp:ListItem>
                                <asp:ListItem Value="other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="ddlSubject"
                                InitialValue="" ErrorMessage="Please select a subject." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblMessage" runat="server" AssociatedControlID="txtMessage" Text="Message"></asp:Label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="input-control" TextMode="MultiLine" Rows="5"
                                placeholder="Tell us how we can help you..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                                ErrorMessage="Message is required." CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <asp:Label ID="lblMessageStatus" runat="server" CssClass="message-status" Visible="false"></asp:Label>
                        <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="btn-primary" OnClick="btnSendMessage_Click" />
                    </div>
                </div>
            </div>

            <!-- FAQ Section -->
            <div class="faq-section">
                <h3>Frequently Asked Questions</h3>
                <div class="faq-grid">
                    <div class="faq-item">
                        <h4>How can I cancel my booking?</h4>
                        <p>You can cancel your booking through your account dashboard or by contacting our customer support. Cancellation policies vary by operator.</p>
                    </div>
                    
                    <div class="faq-item">
                        <h4>What is the refund process?</h4>
                        <p>Refunds are processed within 5-7 business days. The amount depends on the cancellation policy of the bus operator.</p>
                    </div>
                    
                    <div class="faq-item">
                        <h4>Can I change my travel date?</h4>
                        <p>Date changes are subject to availability and operator policies. Contact our support team for assistance.</p>
                    </div>
                    
                    <div class="faq-item">
                        <h4>How do I download my ticket?</h4>
                        <p>You can download your ticket from the "My Bookings" section after successful payment. It will also be sent to your email.</p>
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

