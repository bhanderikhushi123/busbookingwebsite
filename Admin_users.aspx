<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_users.aspx.cs" Inherits="busbookingwebsite.Admin_users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<%-- <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusBooking - Admin Users</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
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
                        <li><a href="Admin_booking.aspx">Bookings</a></li>
                        <li><a href="Admin_buses.aspx">Buses</a></li>
                        <li><a href="Admin_routes.aspx">Routes</a></li>
                        <li><a href="Admin_users.aspx" class="active">Users</a></li>
                        <li><a href="Admin_report.aspx">Reports</a></li>
                        <li><a href="Admin_setting.aspx">Settings</a></li>
                        <li><a href="Admin_login.aspx" class="logout">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Admin Users -->
    <section class="admin-users">
        <div class="container">
            <div class="page-header">
                <h2>Manage Users</h2>
                <p>View and manage all registered users in the system.</p>
                <button class="btn-primary">Add New User</button>
            </div>

            <!-- Filters and Search -->
            <div class="admin-filters">
                <div class="filter-row">
                    <div class="search-box">
                        <input type="text" placeholder="Search by name, email, or phone...">
                        <button class="btn-secondary">Search</button>
                    </div>
                    <div class="filter-options">
                        <select>
                            <option>All Users</option>
                            <option>Active Users</option>
                            <option>Inactive Users</option>
                            <option>Verified Users</option>
                            <option>Unverified Users</option>
                        </select>
                        <select>
                            <option>All Registration Dates</option>
                            <option>This Week</option>
                            <option>This Month</option>
                            <option>Last 3 Months</option>
                        </select>
                        <button class="btn-primary">Export Users</button>
                    </div>
                </div>
            </div>

            <!-- Users Table -->
            <div class="table-container">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>User Details</th>
                            <th>Contact Info</th>
                            <th>Registration Date</th>
                            <th>Total Bookings</th>
                            <th>Status</th>
                            <th>Verification</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>USR001</td>
                            <td>
                                <div class="user-info">
                                    <strong>John Doe</strong><br>
                                    <span class="user-role">Regular User</span>
                                </div>
                            </td>
                            <td>
                                <div class="contact-info">
                                    john.doe@email.com<br>
                                    +91 9876543210
                                </div>
                            </td>
                            <td>15 Jan 2024</td>
                            <td>12 bookings</td>
                            <td><span class="status-badge confirmed">Active</span></td>
                            <td><span class="status-badge confirmed">Verified</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View Profile</a>
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small danger">Suspend</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>USR002</td>
                            <td>
                                <div class="user-info">
                                    <strong>Jane Smith</strong><br>
                                    <span class="user-role">Premium User</span>
                                </div>
                            </td>
                            <td>
                                <div class="contact-info">
                                    jane.smith@email.com<br>
                                    +91 8765432109
                                </div>
                            </td>
                            <td>22 Feb 2024</td>
                            <td>8 bookings</td>
                            <td><span class="status-badge confirmed">Active</span></td>
                            <td><span class="status-badge confirmed">Verified</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View Profile</a>
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small danger">Suspend</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>USR003</td>
                            <td>
                                <div class="user-info">
                                    <strong>Mike Johnson</strong><br>
                                    <span class="user-role">Regular User</span>
                                </div>
                            </td>
                            <td>
                                <div class="contact-info">
                                    mike.johnson@email.com<br>
                                    +91 7654321098
                                </div>
                            </td>
                            <td>05 Mar 2024</td>
                            <td>3 bookings</td>
                            <td><span class="status-badge pending">Inactive</span></td>
                            <td><span class="status-badge pending">Unverified</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View Profile</a>
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small success">Activate</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>USR004</td>
                            <td>
                                <div class="user-info">
                                    <strong>Sarah Wilson</strong><br>
                                    <span class="user-role">Regular User</span>
                                </div>
                            </td>
                            <td>
                                <div class="contact-info">
                                    sarah.wilson@email.com<br>
                                    +91 6543210987
                                </div>
                            </td>
                            <td>18 Mar 2024</td>
                            <td>0 bookings</td>
                            <td><span class="status-badge confirmed">Active</span></td>
                            <td><span class="status-badge confirmed">Verified</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View Profile</a>
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small danger">Suspend</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>USR005</td>
                            <td>
                                <div class="user-info">
                                    <strong>David Brown</strong><br>
                                    <span class="user-role">Premium User</span>
                                </div>
                            </td>
                            <td>
                                <div class="contact-info">
                                    david.brown@email.com<br>
                                    +91 5432109876
                                </div>
                            </td>
                            <td>30 Mar 2024</td>
                            <td>25 bookings</td>
                            <td><span class="status-badge cancelled">Suspended</span></td>
                            <td><span class="status-badge confirmed">Verified</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View Profile</a>
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small success">Activate</a>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <button class="btn-secondary">Previous</button>
                <div class="page-numbers">
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <span>...</span>
                    <a href="#">15</a>
                </div>
                <button class="btn-secondary">Next</button>
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
</body>
</html> 
</body>
</html>
