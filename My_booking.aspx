<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="My_booking.aspx.cs" Inherits="busbookingwebsite.My_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* GridView table styling for bookings */
        .bookings-container {
            overflow-x: auto;
            margin-top: 10px;
        }

        .bookings-table {
            min-width: 800px;
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            color: #222;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
        }

            .bookings-table .tbl-header th {
                background: #f7f9fc;
                color: #111;
                text-align: left;
                font-weight: 600;
                padding: 12px 16px;
                border-bottom: 1px solid #e5e7eb;
                white-space: nowrap;
            }

            .bookings-table .tbl-row td {
                padding: 12px 16px;
                border-bottom: 1px solid #f0f0f0;
                white-space: nowrap;
            }

            .bookings-table .tbl-row.alt td {
                background: #fafafa;
            }

            .bookings-table a {
                color: #0969da;
                font-weight: 600;
                text-decoration: none;
            }

                .bookings-table a:hover {
                    text-decoration: underline;
                }

        @media (max-width: 768px) {
            .bookings-container {
                margin: 0 -10px;
            }
        }
        /* Booking Summary Styles */
        .summary-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-bottom: 20px;
        }

        .summary-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 25px;
            text-align: center;
        }

            .summary-header h1 {
                margin: 0;
                font-size: 28px;
                font-weight: 700;
            }

            .summary-header p {
                margin: 10px 0 0 0;
                opacity: 0.9;
                font-size: 16px;
            }

        .booking-reference {
            background: #ffcc00;
            color: #000;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: bold;
            margin-top: 15px;
            display: inline-block;
        }

        .summary-content {
            padding: 30px;
        }

        .summary-section {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e9ecef;
        }

            .summary-section:last-child {
                border-bottom: none;
            }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

            .section-title::before {
                content: '●';
                color: #667eea;
                font-size: 16px;
            }

        .journey-info {
            display: grid;
            grid-template-columns: 1fr auto 1fr;
            gap: 20px;
            align-items: center;
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .departure, .arrival {
            text-align: center;
        }

        .time {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .city {
            font-size: 14px;
            color: #6c757d;
            font-weight: 500;
        }

        .arrow {
            font-size: 20px;
            color: #667eea;
        }

        .bus-details {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .passenger-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .passenger-item {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }

        .passenger-info {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 15px;
            margin-bottom: 10px;
        }

        .price-breakdown {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid #e9ecef;
        }

        .price-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #dee2e6;
        }

            .price-item:last-child {
                border-bottom: none;
                font-weight: bold;
                font-size: 18px;
                color: #2c3e50;
                margin-top: 10px;
                padding-top: 15px;
                border-top: 2px solid #667eea;
            }

        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .no-bookings {
            text-align: center;
            padding: 40px;
            color: #6c757d;
        }

            .no-bookings h3 {
                color: #2c3e50;
                margin-bottom: 10px;
            }

        @media (max-width: 768px) {
            .journey-info {
                grid-template-columns: 1fr;
                gap: 10px;
            }

            .arrow {
                transform: rotate(90deg);
            }

            .passenger-info {
                grid-template-columns: 1fr;
                gap: 10px;
            }

            .action-buttons {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
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
    <section class="my-bookings">
        <div class="container">
            <div class="bookings-header">
                <h2>My Bookings</h2>
                <div class="booking-tabs">
                    <button class="tab-btn active">Upcoming</button>
                    <button class="tab-btn">Completed</button>
                    <button class="tab-btn">Cancelled</button>
                </div>
            </div>

            <div class="bookings-content">
                <!-- Display booking summary if redirected from Book_Now -->
                <asp:Panel ID="pnlBookingSummary" runat="server" Visible="false">
                    <div class="summary-card">
                        <div class="summary-header">
                            <h1>🎉 Booking Confirmed!</h1>
                            <p>Your bus ticket has been successfully booked</p>
                            <div class="booking-reference">
                                Booking Reference:
                                <asp:Label ID="lblBookingRef" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="summary-content">
                            <!-- Journey Details -->
                            <div class="summary-section">
                                <h3 class="section-title">Journey Details</h3>
                                <div class="journey-info">
                                    <div class="departure">
                                        <div class="time">
                                            <asp:Label ID="lblDepartureTime" runat="server"></asp:Label>
                                        </div>
                                        <div class="city">
                                            <asp:Label ID="lblDepartureCity" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="arrow">→</div>
                                    <div class="arrival">
                                        <div class="time">
                                            <asp:Label ID="lblArrivalTime" runat="server"></asp:Label>
                                        </div>
                                        <div class="city">
                                            <asp:Label ID="lblArrivalCity" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="bus-details">
                                    <strong>Bus:</strong>
                                    <asp:Label ID="lblBusName" runat="server"></asp:Label><br>
                                    <strong>Route:</strong>
                                    <asp:Label ID="lblRoute" runat="server"></asp:Label><br>
                                    <strong>Travel Date:</strong>
                                    <asp:Label ID="lblTravelDate" runat="server"></asp:Label>
                                </div>
                            </div>

                            <!-- Passenger Details -->
                            <div class="summary-section">
                                <h3 class="section-title">Passenger Details</h3>
                                <asp:Repeater ID="rptPassengers" runat="server">
                                    <ItemTemplate>
                                        <div class="passenger-item">
                                            <div class="passenger-info">
                                                <div><strong>Name:</strong> <%# Eval("PassengerName") %></div>
                                                <div><strong>Age:</strong> <%# Eval("Age") %></div>
                                                <div><strong>Gender:</strong> <%# Eval("Gender") %></div>
                                            </div>
                                            <div><strong>Contact:</strong> <%# Eval("Contact") %></div>
                                            <div><strong>Email:</strong> <%# Eval("Email") %></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <!-- Price Breakdown -->
                            <div class="summary-section">
                                <h3 class="section-title">Price Breakdown</h3>
                                <div class="price-breakdown">
                                    <div class="price-item">
                                        <span>Base Fare (per seat):</span>
                                        <span>₹
                                            <asp:Label ID="lblBaseFare" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="price-item">
                                        <span>Number of Seats:</span>
                                        <span>
                                            <asp:Label ID="lblNumSeats" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="price-item">
                                        <span>Service Tax:</span>
                                        <span>₹ 0.00</span>
                                    </div>
                                    <div class="price-item">
                                        <span><strong>Total Amount:</strong></span>
                                        <span><strong>₹
                                            <asp:Label ID="lblTotalAmount" runat="server"></asp:Label></strong></span>
                                    </div>
                                </div>
                            </div>

                            <div class="action-buttons">
                                <asp:Button ID="btnPrintTicket" runat="server" Text="🖨️ Print Ticket" CssClass="btn btn-primary" OnClick="btnPrintTicket_Click" />
                                <asp:Button ID="btnViewAllBookings" runat="server" Text="📋 View All Bookings" CssClass="btn btn-secondary" OnClick="btnViewAllBookings_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!-- All Bookings List -->
                <asp:Panel ID="pnlAllBookings" runat="server">
                    <div class="bookings-container">

                        <asp:GridView ID="gvBookings" runat="server" Visible="true" DataKeyNames="BookingReference,Fare" AutoGenerateColumns="False" CssClass="table bookings-table"
                            GridLines="None" CellPadding="0" CellSpacing="0" OnRowCommand="gvBookings_RowCommand" 
                            HeaderStyle-CssClass="tbl-header" RowStyle-CssClass="tbl-row" AlternatingRowStyle-CssClass="tbl-row alt" OnSelectedIndexChanged="gvBookings_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="BookingReference" HeaderText="Booking Ref" />
                                <asp:BoundField DataField="PassengerName" HeaderText="Passenger" />
                                <%--<asp:BoundField DataField="Age" HeaderText="Age" />--%>
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <%-- <asp:BoundField DataField="Contact" HeaderText="Contact" />--%>
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <%-- <asp:BoundField DataField="Route" HeaderText="Route" />--%>
                                <asp:BoundField DataField="TravelDate" HeaderText="Date" />
                                <asp:BoundField DataField="DepartureTime" HeaderText="Departure" />
                                <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival" />
                                <asp:BoundField DataField="SelectedSeats" HeaderText="Seat" />
                                <asp:BoundField DataField="NumberOfSeats" HeaderText="Seats" />
                                <asp:TemplateField HeaderText="Update Seats">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtUpdateSeat" runat="server" Text='<%# Eval("NumberOfSeats") %>' Width="50px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="BusName" HeaderText="Route" />
                                <asp:BoundField DataField="Fare" HeaderText="Fare">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TotalPrice" HeaderText="Amount">
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:BoundField DataField="PaymentStatus" HeaderText="Payment" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="CancelBooking" CommandArgument='<%# Eval("BookingReference") %>'>Remove</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <asp:Label ID="lblTotalPrice" runat="server"
                        Style="font-size: 18px; font-weight: bold; color: #2E8B57; margin-top: 10px;" />

                    <br />
                    <asp:Button ID="Btnupdate" runat="server" Text="UPDATE" />
                    <br />
                    <asp:Button ID="Btnpayment" runat="server" Text="PAYMENT" />
                    <!-- No bookings message -->
                    <asp:Panel ID="pnlNoBookings" runat="server" Visible="false">
                        <div class="no-bookings">
                            <h3>No bookings found</h3>
                            <p>You haven't made any bookings yet.</p>
                            <a href="Home.aspx" class="btn btn-primary">Book a Ticket</a>
                        </div>
                    </asp:Panel>
                </asp:Panel>
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

