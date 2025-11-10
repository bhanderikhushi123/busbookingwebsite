<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_users.aspx.cs" Inherits="busbookingwebsite.Admin_users" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusBooking - Admin Users</title>
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
                <asp:GridView ID="gvAllUsers" runat="server" CssClass="admin-table" AutoGenerateColumns="false" 
                    GridLines="Both" ShowHeader="true" AllowPaging="true" PageSize="10" 
                    BorderWidth="1px" CellPadding="5" HeaderStyle-CssClass="table-header" 
                    RowStyle-CssClass="table-row" PagerStyle-CssClass="pager-style"
                    EmptyDataText="No users found." OnPageIndexChanging="gvAllUsers_PageIndexChanging"
                    OnRowCommand="gvAllUsers_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="User ID" ItemStyle-Width="80px" />
                        <asp:TemplateField HeaderText="User Details" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <div class="user-info">
                                    <strong><%# Eval("FirstName") %> <%# Eval("LastName") %></strong><br>
                                    <span class="user-role">Regular User</span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Info" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <div class="contact-info">
                                    <%# Eval("Email") %><br>
                                    <%# Eval("Phone") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Bookings" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# GetBookingCount(Eval("Email").ToString()) %> bookings
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <span class="status-badge confirmed">Active</span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Verification" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <span class="status-badge confirmed">Verified</span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <a href="#" class="btn-small">View Profile</a>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn-small" 
                                        CommandArgument='<%# Eval("Id") %>' CommandName="EditUser">Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn-small danger" 
                                        CommandArgument='<%# Eval("Id") %>' CommandName="DeleteUser" 
                                        OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <table class="admin-table">
                            <tr>
                                <td colspan="7" style="text-align: center; padding: 20px;">No users found.</td>
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
