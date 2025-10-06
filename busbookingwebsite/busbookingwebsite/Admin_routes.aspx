<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_routes.aspx.cs" Inherits="busbookingwebsite.Admin_routes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<%--    <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusBooking - Admin Routes</title>
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
                        <li><a href="Admin_routes.aspx" class="active">Routes</a></li>
                        <li><a href="Admin_users.aspx">Users</a></li>
                        <li><a href="Admin_report.aspx">Reports</a></li>
                        <li><a href="Admin_setting.aspx">Settings</a></li>
                        <li><a href="Admin_login.aspx" class="logout">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Admin Routes -->
    <section class="admin-routes">
        <div class="container">
            <div class="page-header">
                <h2>Manage Routes</h2>
                <p>Add, edit, and manage bus routes and schedules.</p>
                <button class="btn-primary">Add New Route</button>
            </div>

            <!-- Filters and Search -->
            <div class="admin-filters">
                <div class="filter-row">
                    <div class="search-box">
                        <input type="text" placeholder="Search by route name, source, or destination...">
                        <button class="btn-secondary">Search</button>
                    </div>
                    <div class="filter-options">
                        <select>
                            <option>All Operators</option>
                            <option>Express Travels</option>
                            <option>Royal Express</option>
                            <option>Premium Travels</option>
                        </select>
                        <select>
                            <option>All Status</option>
                            <option>Active</option>
                            <option>Inactive</option>
                            <option>Suspended</option>
                        </select>
                        <button class="btn-primary">Export Routes</button>
                    </div>
                </div>
            </div>

            <!-- Routes Table -->
            <div class="table-container">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Route ID</th>
                            <th>Route Name</th>
                            <th>Source → Destination</th>
                            <th>Operator</th>
                            <th>Distance</th>
                            <th>Duration</th>
                            <th>Base Fare</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>RT001</td>
                            <td>Mumbai-Delhi Express</td>
                            <td>Mumbai → Delhi</td>
                            <td>Express Travels</td>
                            <td>1,384 km</td>
                            <td>22 hours</td>
                            <td>₹1,200</td>
                            <td><span class="status-badge confirmed">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small">View Schedule</a>
                                    <a href="#" class="btn-small danger">Deactivate</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>RT002</td>
                            <td>Delhi-Bangalore Premium</td>
                            <td>Delhi → Bangalore</td>
                            <td>Premium Travels</td>
                            <td>2,150 km</td>
                            <td>35 hours</td>
                            <td>₹2,500</td>
                            <td><span class="status-badge confirmed">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small">View Schedule</a>
                                    <a href="#" class="btn-small danger">Deactivate</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>RT003</td>
                            <td>Chennai-Hyderabad Express</td>
                            <td>Chennai → Hyderabad</td>
                            <td>Royal Express</td>
                            <td>625 km</td>
                            <td>10 hours</td>
                            <td>₹800</td>
                            <td><span class="status-badge pending">Inactive</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small">View Schedule</a>
                                    <a href="#" class="btn-small success">Activate</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>RT004</td>
                            <td>Kolkata-Pune Night</td>
                            <td>Kolkata → Pune</td>
                            <td>Express Travels</td>
                            <td>1,850 km</td>
                            <td>28 hours</td>
                            <td>₹1,800</td>
                            <td><span class="status-badge confirmed">Active</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small">View Schedule</a>
                                    <a href="#" class="btn-small danger">Deactivate</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>RT005</td>
                            <td>Ahmedabad-Mumbai Local</td>
                            <td>Ahmedabad → Mumbai</td>
                            <td>Royal Express</td>
                            <td>530 km</td>
                            <td>8 hours</td>
                            <td>₹600</td>
                            <td><span class="status-badge cancelled">Suspended</span></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">Edit</a>
                                    <a href="#" class="btn-small">View Schedule</a>
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
                    <a href="#">10</a>
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
