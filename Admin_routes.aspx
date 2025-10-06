<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_routes.aspx.cs" Inherits="busbookingwebsite.Admin_routes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BusBooking - Add Route</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
        /* ===== Main Section (Admin Routes) ===== */
        .admin-routes {
            padding: 40px 0;
            background-color: #f2f2f2;
        }

        /* ===== Container ===== */
        .admin-routes .container {
            width: 90%;
            max-width: 900px;
            margin: 0 auto;
        }

        /* ===== Card (Form) ===== */
        .admin-routes .card {
            background: #fff;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .admin-routes .title {
            font-size: 26px;
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .admin-routes .form-box {
            margin-bottom: 18px;
        }

        .admin-routes .label-text {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
        }

        .admin-routes .input-text {
            width: 100%;
            padding: 10px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
            transition: border 0.3s;
        }

        .admin-routes .input-text:focus {
            border-color: #007bff;
            outline: none;
        }

        /* ===== Button ===== */
        .admin-routes .btn {
            display: inline-block;
            padding: 10px 25px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .admin-routes .btn:hover {
            background-color: #0056b3;
        }

        /* ===== GridView Container ===== */
        .gridview-container {
            margin-top: 30px;
        }

        /* ===== GridView Table ===== */
        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            margin-top: 15px;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        #GridView1 th {
            background-color: #2c3e50;
            color: #fff;
            padding: 12px;
            border-bottom: 2px solid #007bff;
            text-align: left;
            font-size: 15px;
        }

        #GridView1 td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            color: #333;
            font-size: 14px;
        }

        #GridView1 tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* ===== GridView Links (Edit/Delete) ===== */
        #GridView1 a {
            text-decoration: none;
            font-weight: 500;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 13px;
        }

        #GridView1 .LinkButtonEdit {
            background-color: #28a745;
            color: #fff;
        }

        #GridView1 .LinkButtonEdit:hover {
            background-color: #218838;
        }

        #GridView1 .LinkButtonDelete {
            background-color: #dc3545;
            color: #fff;
        }

        #GridView1 .LinkButtonDelete:hover {
            background-color: #c82333;
        }
    </style>
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
                        <li><a href="Admin_setting.aspx">Settings</a></li>
                        <li><a href="Admin_login.aspx" class="logout">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>

    <!-- Main Section: Add Route Form + GridView -->
    <section class="admin-routes">
        <form id="form1" runat="server">
            <div class="container">
                <div class="card">
                    <h1 class="title">Add Route</h1>

                    <div class="form-box">
                        <label class="label-text">Category</label>
                        <asp:DropDownList ID="dlcat" runat="server" CssClass="input-text"></asp:DropDownList>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Route Name</label>
                        <asp:TextBox ID="txtRouteName" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Source</label>
                        <asp:TextBox ID="txtSource" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Destination</label>
                        <asp:TextBox ID="txtDestination" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Operator</label>
                        <asp:TextBox ID="txtOperator" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Distance (km)</label>
                        <asp:TextBox ID="txtDistance" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Duration (hours)</label>
                        <asp:TextBox ID="txtDuration" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Base Fare (₹)</label>
                        <asp:TextBox ID="txtFare" runat="server" CssClass="input-text"></asp:TextBox>
                    </div>

                    <div class="form-box">
                        <label class="label-text">Status</label>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="input-text">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                            <asp:ListItem>Suspended</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-box">
                        <asp:Button ID="btnSaveRoute" runat="server" Text="Save" CssClass="btn" OnClick="btnSaveRoute_Click" />
                    </div>
                </div>

                <!-- GridView -->
                <div class="gridview-container">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Route ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Route Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("RouteName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Source">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Source") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Destination">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Destination") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fare">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Fare") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 BusBooking. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
