<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_booking.aspx.cs" Inherits="busbookingwebsite.Admin_booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusBooking - Admin Bookings</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <form id="form1" runat="server">
    <!-- Admin Header -->
    <header class="admin-header">
        <div class="container">
            <div class="admin-nav">
                <div class="admin-logo">
                    <h1>BusBooking Admin</h1>
                </div>
                <nav class="admin-menu">
                    <ul>
                        <li><a href="Admin_dashboard.aspx">Dashboard</a></li>
                        <li><a href="Admin_booking.aspx" class="active">Bookings</a></li>
                        <li><a href="Admin_buses.aspx">Buses</a></li>
                        <li><a href="Admin_routes.aspx">Routes</a></li>
                        <li><a href="Admin_users.aspx">Users</a></li>
                        <li><a href="Admin_setting.aspx">Settings</a></li>
                        <li><a href="Admin_login.aspx" class="logout">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Admin Bookings -->
    <section class="admin-bookings">
        <div class="container">
            <div class="page-header">
                <h2>Manage Bookings</h2>
                <p>View and manage all bus bookings in the system.</p>
            </div>

            <!-- Filters and Search -->
            <div class="admin-filters">
                <div class="filter-row">
                    <div class="search-box">
                        <input type="text" placeholder="Search by booking ID, customer name, or route...">
                        <button class="btn-secondary">Search</button>
                    </div>
                    <div class="filter-options">
                        <select>
                            <option>All Status</option>
                            <option>Confirmed</option>
                            <option>Pending</option>
                            <option>Completed</option>
                            <option>Cancelled</option>
                        </select>
                        <select>
                            <option>All Dates</option>
                            <option>Today</option>
                            <option>This Week</option>
                            <option>This Month</option>
                        </select>
                        <button class="btn-primary">Export</button>
                    </div>
                </div>
            </div>

            <!-- Bookings Table -->
            <div class="table-container">
                <asp:GridView ID="gvAllBookings" runat="server" CssClass="admin-table" AutoGenerateColumns="false" 
                    GridLines="Both" ShowHeader="true" AllowPaging="true" PageSize="10" 
                    BorderWidth="1px" CellPadding="5" HeaderStyle-CssClass="table-header" 
                    RowStyle-CssClass="table-row" PagerStyle-CssClass="pager-style"
                    EmptyDataText="No bookings found." OnPageIndexChanging="gvAllBookings_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="BookingReference" HeaderText="Booking ID" ItemStyle-Width="120px" />
                        <asp:TemplateField HeaderText="Customer Details" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <div class="customer-info">
                                    <strong><%# Eval("PassengerName") %></strong><br>
                                    <%# Eval("Email") %><br>
                                    <%# Eval("Contact") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Journey Details" ItemStyle-Width="250px">
                            <ItemTemplate>
                                <div class="journey-info">
                                    <strong><%# Eval("Route") %></strong><br>
                                    <%# Eval("BusName") %><br>
                                    <%# Eval("TravelDate", "{0:dd MMM yyyy}") %>, <%# Eval("DepartureTime") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SelectedSeats" HeaderText="Seats" ItemStyle-Width="100px" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Amount" DataFormatString="₹{0:N2}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" />
                        <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="100px" />
                        <asp:BoundField DataField="PaymentStatus" HeaderText="Payment" ItemStyle-Width="100px" />
                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View</a>
                                    <a href="#" class="btn-small">Edit</a>
                                    <asp:LinkButton ID="lnkCancel" runat="server" CssClass="btn-small danger" 
                                        CommandArgument='<%# Eval("BookingReference") %>' 
                                        OnClick="lnkCancel_Click" OnClientClick="return confirm('Are you sure you want to cancel this booking?');">Cancel</asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <table class="admin-table">
                            <tr>
                                <td colspan="8" style="text-align: center; padding: 20px;">No bookings found.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>BusBooking Admin</h4>
                    <p>Administrative panel for bus booking system management.</p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="Home.aspx">Back to Website</a></li>
                        <li><a href="Contact.aspx">Contact Support</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Contact</h4>
                    <p>Email: admin@busbooking.com</p>
                    <p>Phone: +91 1234567890</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 BusBooking. All rights reserved.</p>
            </div>
        </div>
    </footer>
    </form>
</body>
</html>
