<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_dashboard.aspx.cs" Inherits="busbookingwebsite.Admin_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusBooking - Admin Dashboard</title>
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
                        <li><a href="Admin_dashboard.aspx" class="active">Dashboard</a></li>
                        <li><a href="Admin_booking.aspx">Bookings</a></li>
                        <li><a href="Admin_buses.aspx">Buses</a></li>
                        <li><a href="Admin_routes.aspx">Routes</a></li>
                        <li><a href="Admin_users.aspx">Users</a></li>
                        <li><a href="Admin_login.aspx" class="logout">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Admin Dashboard -->
    <section class="admin-dashboard">
        <div class="container">
            <div class="dashboard-header">
                <h2>Admin Dashboard</h2>
                <p>Welcome back, Administrator! Here's an overview of your bus booking system.</p>
            </div>

            <!-- Statistics Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon">📊</div>
                    <div class="stat-content">
                        <h3>Total Bookings</h3>
                        <div class="stat-number">1,247</div>
                        <div class="stat-change positive">+12% from last month</div>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">💰</div>
                    <div class="stat-content">
                        <h3>Revenue</h3>
                        <div class="stat-number">₹2,45,000</div>
                        <div class="stat-change positive">+8% from last month</div>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">👥</div>
                    <div class="stat-content">
                        <h3>Active Users</h3>
                        <div class="stat-number">856</div>
                        <div class="stat-change positive">+5% from last month</div>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon">🚌</div>
                    <div class="stat-content">
                        <h3>Active Buses</h3>
                        <div class="stat-number">45</div>
                        <div class="stat-change neutral">No change</div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Content -->
            <div class="dashboard-content">
                <!-- Recent Bookings -->
                <div class="dashboard-section">
                    <div class="section-header">
                        <h3>Recent Bookings</h3>
                        <a href="Admin_booking.aspx" class="btn-secondary">View All</a>
                    </div>
                    <div class="table-container">
                        <asp:GridView ID="gvRecentBookings" runat="server" CssClass="admin-table" AutoGenerateColumns="false" 
                            GridLines="Both" ShowHeader="true" AllowPaging="false" BorderWidth="1px" CellPadding="5" 
                            HeaderStyle-CssClass="table-header" RowStyle-CssClass="table-row" 
                            EmptyDataText="No recent bookings found.">
                            <Columns>
                                <asp:BoundField DataField="BookingReference" HeaderText="Booking ID" ItemStyle-Width="150px" />
                                <asp:BoundField DataField="PassengerName" HeaderText="Customer" ItemStyle-Width="150px" />
                                <asp:BoundField DataField="Route" HeaderText="Route" ItemStyle-Width="200px" />
                                <asp:BoundField DataField="TravelDate" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" ItemStyle-Width="120px" />
                                <asp:BoundField DataField="TotalPrice" HeaderText="Amount" DataFormatString="₹{0:N2}" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="100px" />
                                <asp:BoundField DataField="PaymentStatus" HeaderText="Payment" ItemStyle-Width="100px" />
                            </Columns>
                            <EmptyDataTemplate>
                                <table class="admin-table">
                                    <tr>
                                        <td colspan="7" style="text-align: center; padding: 20px;">No recent bookings found.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="dashboard-section">
                    <h3>Quick Actions</h3>
                    <div class="quick-actions">
                        <a href="Admin_booking.aspx" class="action-card">
                            <div class="action-icon">📋</div>
                            <h4>Manage Bookings</h4>
                            <p>View and manage all bookings</p>
                        </a>
                        
                        <a href="Admin_buses.aspx" class="action-card">
                            <div class="action-icon">🚌</div>
                            <h4>Manage Buses</h4>
                            <p>Add, edit, or remove buses</p>
                        </a>
                        
                        <a href="Admin_routes.aspx" class="action-card">
                            <div class="action-icon">🗺️</div>
                            <h4>Manage Routes</h4>
                            <p>Configure bus routes and schedules</p>
                        </a>
                        
                        <a href="Admin_users.aspx" class="action-card">
                            <div class="action-icon">👥</div>
                            <h4>Manage Users</h4>
                            <p>View and manage user accounts</p>
                        </a>
                    </div>
                </div>
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
