<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Book_now.aspx.cs" Inherits="busbookingwebsite.Book_now" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BOOK NOW</title>
        <link rel="stylesheet" href="styles.css">
    <style>
        .page-container { max-width: 960px; margin: 30px auto; padding: 0 16px; }
        .card { background: #ffffff; color: #000000; border-radius: 8px; border: 1px solid #e2e2e2; box-shadow: 0 2px 8px rgba(0,0,0,0.06); }
        .card-header { padding: 16px 20px; border-bottom: 1px solid #e8e8e8; font-weight: bold; font-size: 18px; background: #f7f9fc; }
        .card-body { padding: 20px; }
        .grid { display: grid; grid-template-columns: repeat(12, 1fr); gap: 16px; }
        .col-12 { grid-column: span 12; }
        .col-6 { grid-column: span 6; }
        .col-4 { grid-column: span 4; }
        .col-3 { grid-column: span 3; }
        @media (max-width: 768px) { .col-6, .col-4, .col-3 { grid-column: span 12; } }
        label { display: block; margin-bottom: 6px; font-weight: 600; }
        input[type="text"], input[type="email"], input[type="number"], input[type="date"], select, .form-control { 
            width: 100%; 
            padding: 8px 12px; 
            border: 1px solid #d0d7de; 
            border-radius: 6px; 
            background: #ffffff; 
            color: #24292f; 
            font-size: 14px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            box-sizing: border-box;
            min-height: 32px;
            transition: all 0.2s ease;
        }
        
        input[type="text"]:focus, input[type="email"]:focus, input[type="number"]:focus, input[type="date"]:focus, select:focus, .form-control:focus {
            border-color: #0969da;
            outline: none;
            box-shadow: 0 0 0 3px rgba(9,105,218,0.1);
        }
        
        input[type="text"]:hover, input[type="email"]:hover, input[type="number"]:hover, input[type="date"]:hover, select:hover, .form-control:hover {
            border-color: #ffcc00;
        }
        .error-message { 
            color: #d1242f; 
            font-size: 12px; 
            margin-top: 4px; 
            font-weight: 400;
            display: block;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }
        input[readonly] { background: #f7f7f7; }
        .muted { color: #666666; font-size: 13px; }
        .section { margin-bottom: 20px; }
        .btn-row { display: flex; gap: 12px; align-items: center; }
        .btn { background-color: #ffcc00; color: #000; font-weight: bold; border: none; padding: 10px 18px; cursor: pointer; border-radius: 6px; }
        .btn:hover { background-color: #e6b800; }
        .seat-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 8px; max-width: 360px; }
        .seat { display: flex; align-items: center; gap: 6px; padding: 8px 10px; border: 1px solid #ddd; border-radius: 6px; background: #fafafa; }
        #seatLayoutPanel { margin-top: 10px; padding: 15px; border: 1px solid #ddd; border-radius: 6px; background: #f9f9f9; }
        #seatLayoutPanel input[type="checkbox"] { margin-right: 5px; }
        #seatLayoutPanel label { margin-bottom: 5px; font-weight: normal; }
        /* Enhanced Passenger Details Styling - Clean Rectangular Design */
        .passenger-form { 
            margin-bottom: 30px; 
            padding: 30px; 
            border: 1px solid #d0d7de; 
            border-radius: 8px; 
            background: #ffffff;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.2s ease;
            position: relative;
            width: 100%;
            box-sizing: border-box;
        }
        
        .passenger-form:hover {
            border-color: #ffcc00;
            box-shadow: 0 2px 8px rgba(255,204,0,0.2);
        }
        
        .passenger-form:focus-within {
            border-color: #007bff;
            box-shadow: 0 0 0 2px rgba(0,123,255,0.1);
        }
        
        .passenger-header { 
            margin-bottom: 25px; 
            padding-bottom: 15px; 
            border-bottom: 2px solid #ffcc00; 
            position: relative;
        }
        
        .passenger-header h5 { 
            margin: 0; 
            color: #24292f; 
            font-size: 18px; 
            font-weight: 600;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }
        
        .passenger-form .grid { 
            margin-top: 0; 
            gap: 20px;
        }
        
        .passenger-form label { 
            font-weight: 600; 
            color: #24292f; 
            font-size: 14px;
            margin-bottom: 8px;
            display: block;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }
        
        .passenger-form .form-control {
            width: 100%;
            border: 1px solid #d0d7de;
            border-radius: 6px;
            padding: 8px 12px;
            font-size: 14px;
            transition: all 0.2s ease;
            background: #ffffff;
            color: #24292f;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            box-sizing: border-box;
            min-height: 32px;
        }
        
        .passenger-form .form-control:focus {
            border-color: #0969da;
            outline: none;
            box-shadow: 0 0 0 3px rgba(9,105,218,0.1);
        }
        
        .passenger-form .form-control:hover:not(:focus) {
            border-color: #ffcc00;
        }
        
        .passenger-form select.form-control {
            background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='%23656d76' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 8px center;
            background-size: 16px 12px;
            padding-right: 32px;
            appearance: none;
        }
        
        .error-message {
            color: #d1242f;
            font-size: 12px;
            margin-top: 4px;
            font-weight: 400;
            display: block;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }
        
        /* Input validation states */
        .passenger-form .form-control.is-invalid {
            border-color: #d1242f;
        }
        
        .passenger-form .form-control.is-valid {
            border-color: #1a7f37;
        }
        
        /* Placeholder styling */
        .passenger-form .form-control::placeholder {
            color: #656d76;
            opacity: 1;
        }
        
        /* Number input styling */
        .passenger-form input[type="number"] {
            appearance: textfield;
        }
        
        .passenger-form input[type="number"]::-webkit-outer-spin-button,
        .passenger-form input[type="number"]::-webkit-inner-spin-button {
            appearance: none;
            margin: 0;
        }
        
        /* Email input styling */
        .passenger-form input[type="email"] {
            background-image: none;
        }
        
        /* Text input styling */
        .passenger-form input[type="text"] {
            background-image: none;
        }
        
        /* Responsive improvements */
        @media (max-width: 768px) {
            .passenger-form {
                padding: 20px;
                margin-bottom: 20px;
            }
            
            .passenger-header h5 {
                font-size: 16px;
            }
            
            .passenger-form .form-control {
                padding: 10px 12px;
                font-size: 16px; /* Prevents zoom on iOS */
            }
            
            .passenger-form .grid {
                gap: 15px;
            }
        }
        
        /* Animation for form appearance */
        .passenger-form {
            animation: fadeInUp 0.4s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Ensure proper rectangular shapes */
        .passenger-form .form-control,
        .passenger-form,
        .passenger-header {
            border-radius: 6px;
        }
        
        /* Consistent spacing */
        .passenger-form .col-6,
        .passenger-form .col-3,
        .passenger-form .col-4,
        .passenger-form .col-12 {
            margin-bottom: 0;
        }
        .row { display: flex; justify-content: space-between; align-items: center; gap: 12px; }
        .total { font-size: 18px; font-weight: 700; }
        .note { background: #fff8e1; border: 1px solid #ffe082; padding: 10px 12px; border-radius: 6px; }
    </style>
    <script>
        function param(name) {
            const url = new URL(window.location.href);
            return url.searchParams.get(name) || '';
        }
        function hydrateFromParams() {
            const busName = param('bus') || 'SuperExpress 102';
            const route = param('route') || 'Rajkot → Ahmedabad';
            const fare = parseFloat(param('fare') || '450');
            const dep = param('dep') || '08:30 AM';
            const arr = param('arr') || '12:15 PM';
            if (document.getElementById('<%= txtBusName.ClientID %>')) document.getElementById('<%= txtBusName.ClientID %>').value = busName;
            if (document.getElementById('<%= txtRoute.ClientID %>')) document.getElementById('<%= txtRoute.ClientID %>').value = route;
            if (document.getElementById('<%= txtFarePerTicket.ClientID %>')) document.getElementById('<%= txtFarePerTicket.ClientID %>').value = isNaN(fare) ? 0 : fare;
            if (document.getElementById('<%= txtDepTime.ClientID %>')) document.getElementById('<%= txtDepTime.ClientID %>').value = dep;
            if (document.getElementById('<%= txtArrTime.ClientID %>')) document.getElementById('<%= txtArrTime.ClientID %>').value = arr;
        }
        function updateTotal() {
            var fare = parseFloat(document.getElementById('<%= txtFarePerTicket.ClientID %>').value || '0');
            var seats = parseInt(document.getElementById('<%= txtNumSeats.ClientID %>').value || '0');
            var total = fare * seats;
            document.getElementById('totalPrice').innerText = '₹ ' + (isNaN(total) ? '0' : total.toFixed(2));
        }
        
        function updatePassengerForms() {
            var numSeats = parseInt(document.getElementById('<%= txtNumSeats.ClientID %>').value || '1');
            
            // Show/hide passenger forms based on number of seats
            for (var i = 1; i <= 3; i++) {
                var form = document.getElementById('passengerForm' + i);
                if (form) {
                    if (i <= numSeats) {
                        form.style.display = 'block';
                    } else {
                        form.style.display = 'none';
                        // Clear form data when hiding
                        clearPassengerForm(i);
                    }
                }
            }
            
            // Update total price
            updateTotal();
        }
        
        function clearPassengerForm(passengerNumber) {
            var form = document.getElementById('passengerForm' + passengerNumber);
            if (form) {
                var inputs = form.querySelectorAll('input[type="text"], input[type="email"], input[type="number"], select');
                inputs.forEach(function(input) {
                    input.value = '';
                });
            }
        }
        function toggleSeatLayout(el) {
            var panel = document.getElementById('seatLayoutPanel');
            if (panel) {
                panel.style.display = el.checked ? 'block' : 'none';
            }
        }
        function simulatePay(e) {
            e.preventDefault();
            alert('Booking simulated! Your seats will be held for 10 minutes.');
        }
        document.addEventListener('DOMContentLoaded', function () {
            hydrateFromParams();
            var seatsEl = document.getElementById('<%= txtNumSeats.ClientID %>');
            if (seatsEl) { seatsEl.addEventListener('input', updateTotal); }
            
            // Add event listener for seat layout checkbox
            var seatLayoutCheckbox = document.getElementById('<%= chkUseSeatLayout.ClientID %>');
            if (seatLayoutCheckbox) {
                seatLayoutCheckbox.addEventListener('change', function() {
                    toggleSeatLayout(this);
                });
            }
            
            updateTotal();
        });
    </script>
    <link rel="stylesheet" href="styles.css" />
    <style>
        /* Optional: page dark bg to match Home.aspx feel */
        body { background-color: #3b4a78; color: #fff; font-family: Arial, Helvetica, sans-serif; }
    </style>
    
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="logo"><h1>BusBooking</h1></div>
            <nav class="nav">
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="Serach_buses.aspx">Search Buses</a></li>
                    <li><a href="My_booking.aspx">My Bookings</a></li>
                    <li><a href="Contact.aspx">Contact</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                    <li><a href="Register.aspx">Register</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <form id="form1" runat="server">
        <div class="page-container">
            <div class="card section">
                <div class="card-header">Book Now</div>
                <div class="card-body">
                    <div class="grid">
                        <div class="col-12">
                            <div class="note">Bus details are auto-filled from selection. Adjust travel date if needed.</div>
                        </div>

                        <!-- Bus Details (Auto-filled) -->
                        <div class="col-6">
                            <label>Bus Name / Number</label>
                            <asp:TextBox ID="txtBusName" runat="server" CssClass="form-control" ReadOnly="true" Text="SuperExpress 102"></asp:TextBox>
                            <div class="muted">Example value. You can pass values via URL query.</div>
                        </div>
                        <div class="col-6">
                            <label>Route (From → To)</label>
                            <asp:TextBox ID="txtRoute" runat="server" CssClass="form-control" ReadOnly="true" Text="Rajkot → Ahmedabad"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <label>Date of Travel</label>
                            <asp:TextBox ID="txtTravelDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTravelDate" runat="server" ControlToValidate="txtTravelDate" 
                                ErrorMessage="Travel date is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-4">
                            <label>Departure Time</label>
                            <asp:TextBox ID="txtDepTime" runat="server" CssClass="form-control" ReadOnly="true" Text="08:30 AM"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <label>Arrival Time</label>
                            <asp:TextBox ID="txtArrTime" runat="server" CssClass="form-control" ReadOnly="true" Text="12:15 PM"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <label>Fare per ticket (₹)</label>
                            <asp:TextBox ID="txtFarePerTicket" runat="server" CssClass="form-control" ReadOnly="true" Text="450"></asp:TextBox>
                        </div>

                        <!-- Passenger Details Section -->
                        <div class="col-12"><hr /></div>
                        <div class="col-12">
                            <h4 style="color: #333; margin-bottom: 20px;">Passenger Details</h4>
                            <div class="note">Please fill in details for each passenger. All fields are required.</div>
                        </div>

                        <!-- Dynamic Passenger Forms -->
                        <div id="passengerFormsContainer">
                            <!-- Passenger 1 (Always visible) -->
                            <div class="passenger-form" id="passengerForm1">
                                <div class="passenger-header">
                                    <h5>Passenger 1 Details</h5>
                                </div>
                                <div class="grid">
                                    <div class="col-6">
                                        <label>Passenger Name</label>
                                        <asp:TextBox ID="txtPassengerName1" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPassengerName1" runat="server" ControlToValidate="txtPassengerName1" 
                                            ErrorMessage="Passenger name is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-3">
                                        <label>Age</label>
                                        <asp:TextBox ID="txtAge1" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g., 28"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAge1" runat="server" ControlToValidate="txtAge1" 
                                            ErrorMessage="Age is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvAge1" runat="server" ControlToValidate="txtAge1" 
                                            ErrorMessage="Age must be between 1 and 120" CssClass="error-message" Display="Dynamic" 
                                            MinimumValue="1" MaximumValue="120" Type="Integer"></asp:RangeValidator>
                                    </div>
                                    <div class="col-3">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="ddlGender1" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="" Text="Select"></asp:ListItem>
                                            <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                            <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvGender1" runat="server" ControlToValidate="ddlGender1" 
                                            ErrorMessage="Gender is required" CssClass="error-message" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-6">
                                        <label>Contact Number</label>
                                        <asp:TextBox ID="txtContact1" runat="server" CssClass="form-control" placeholder="Enter mobile number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvContact1" runat="server" ControlToValidate="txtContact1" 
                                            ErrorMessage="Contact number is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revContact1" runat="server" ControlToValidate="txtContact1" 
                                            ErrorMessage="Please enter a valid mobile number" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-6">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ControlToValidate="txtEmail1" 
                                            ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail1" runat="server" ControlToValidate="txtEmail1" 
                                            ErrorMessage="Please enter a valid email address" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>

                            <!-- Passenger 2 (Hidden by default) -->
                            <div class="passenger-form" id="passengerForm2" style="display:none;">
                                <div class="passenger-header">
                                    <h5>Passenger 2 Details</h5>
                                </div>
                                <div class="grid">
                                    <div class="col-6">
                                        <label>Passenger Name</label>
                                        <asp:TextBox ID="txtPassengerName2" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPassengerName2" runat="server" ControlToValidate="txtPassengerName2" 
                                            ErrorMessage="Passenger name is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-3">
                                        <label>Age</label>
                                        <asp:TextBox ID="txtAge2" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g., 28"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAge2" runat="server" ControlToValidate="txtAge2" 
                                            ErrorMessage="Age is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvAge2" runat="server" ControlToValidate="txtAge2" 
                                            ErrorMessage="Age must be between 1 and 120" CssClass="error-message" Display="Dynamic" 
                                            MinimumValue="1" MaximumValue="120" Type="Integer"></asp:RangeValidator>
                                    </div>
                                    <div class="col-3">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="ddlGender2" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="" Text="Select"></asp:ListItem>
                                            <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                            <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvGender2" runat="server" ControlToValidate="ddlGender2" 
                                            ErrorMessage="Gender is required" CssClass="error-message" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-6">
                                        <label>Contact Number</label>
                                        <asp:TextBox ID="txtContact2" runat="server" CssClass="form-control" placeholder="Enter mobile number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvContact2" runat="server" ControlToValidate="txtContact2" 
                                            ErrorMessage="Contact number is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revContact2" runat="server" ControlToValidate="txtContact2" 
                                            ErrorMessage="Please enter a valid mobile number" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-6">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" ControlToValidate="txtEmail2" 
                                            ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail2" runat="server" ControlToValidate="txtEmail2" 
                                            ErrorMessage="Please enter a valid email address" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>

                            <!-- Passenger 3 (Hidden by default) -->
                            <div class="passenger-form" id="passengerForm3" style="display:none;">
                                <div class="passenger-header">
                                    <h5>Passenger 3 Details</h5>
                                </div>
                                <div class="grid">
                                    <div class="col-6">
                                        <label>Passenger Name</label>
                                        <asp:TextBox ID="txtPassengerName3" runat="server" CssClass="form-control" placeholder="Enter full name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPassengerName3" runat="server" ControlToValidate="txtPassengerName3" 
                                            ErrorMessage="Passenger name is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-3">
                                        <label>Age</label>
                                        <asp:TextBox ID="txtAge3" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g., 28"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAge3" runat="server" ControlToValidate="txtAge3" 
                                            ErrorMessage="Age is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rvAge3" runat="server" ControlToValidate="txtAge3" 
                                            ErrorMessage="Age must be between 1 and 120" CssClass="error-message" Display="Dynamic" 
                                            MinimumValue="1" MaximumValue="120" Type="Integer"></asp:RangeValidator>
                                    </div>
                                    <div class="col-3">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="ddlGender3" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="" Text="Select"></asp:ListItem>
                                            <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                            <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvGender3" runat="server" ControlToValidate="ddlGender3" 
                                            ErrorMessage="Gender is required" CssClass="error-message" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-6">
                                        <label>Contact Number</label>
                                        <asp:TextBox ID="txtContact3" runat="server" CssClass="form-control" placeholder="Enter mobile number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvContact3" runat="server" ControlToValidate="txtContact3" 
                                            ErrorMessage="Contact number is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revContact3" runat="server" ControlToValidate="txtContact3" 
                                            ErrorMessage="Please enter a valid mobile number" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-6">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtEmail3" runat="server" CssClass="form-control" TextMode="Email" placeholder="name@example.com"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail3" runat="server" ControlToValidate="txtEmail3" 
                                            ErrorMessage="Email is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmail3" runat="server" ControlToValidate="txtEmail3" 
                                            ErrorMessage="Please enter a valid email address" CssClass="error-message" Display="Dynamic" 
                                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seats and Optional Seat Selection -->
                        <div class="col-4">
                            <label>Number of Seats</label>
                            <asp:TextBox ID="txtNumSeats" runat="server" CssClass="form-control" TextMode="Number" Text="1" min="1" max="3" onchange="updatePassengerForms()"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNumSeats" runat="server" ControlToValidate="txtNumSeats" 
                                ErrorMessage="Number of seats is required" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvNumSeats" runat="server" ControlToValidate="txtNumSeats" 
                                ErrorMessage="Number of seats must be between 1 and 3" CssClass="error-message" Display="Dynamic" 
                                MinimumValue="1" MaximumValue="3" Type="Integer"></asp:RangeValidator>
                        </div>
                        <div class="col-8" style="align-self: end;">
                            <div class="row">
                                <label style="margin: 0;">
                                    <asp:CheckBox ID="chkUseSeatLayout" runat="server" Text="Enable Seat Selection" />
                                </label>
                                <span class="muted">If off, seats will be auto-assigned.</span>
                            </div>
                        </div>

                        <div class="col-12" id="seatLayoutPanel" style="display:none;">
                            <label>Select Seats</label>
                            <div class="seat-grid">
                                <asp:CheckBoxList ID="chkSeats" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" CssClass="seat-grid">
                                    <asp:ListItem Value="S1" Text="S1"></asp:ListItem>
                                    <asp:ListItem Value="S2" Text="S2"></asp:ListItem>
                                    <asp:ListItem Value="S3" Text="S3"></asp:ListItem>
                                    <asp:ListItem Value="S4" Text="S4"></asp:ListItem>
                                    <asp:ListItem Value="S5" Text="S5"></asp:ListItem>
                                    <asp:ListItem Value="S6" Text="S6"></asp:ListItem>
                                    <asp:ListItem Value="S7" Text="S7"></asp:ListItem>
                                    <asp:ListItem Value="S8" Text="S8"></asp:ListItem>
                                    <asp:ListItem Value="S9" Text="S9"></asp:ListItem>
                                    <asp:ListItem Value="S10" Text="S10"></asp:ListItem>
                                    <asp:ListItem Value="S11" Text="S11"></asp:ListItem>
                                    <asp:ListItem Value="S12" Text="S12"></asp:ListItem>
                                    <asp:ListItem Value="S13" Text="S13"></asp:ListItem>
                                    <asp:ListItem Value="S14" Text="S14"></asp:ListItem>
                                    <asp:ListItem Value="S15" Text="S15"></asp:ListItem>
                                    <asp:ListItem Value="S16" Text="S16"></asp:ListItem>
                                    <asp:ListItem Value="S17" Text="S17"></asp:ListItem>
                                    <asp:ListItem Value="S18" Text="S18"></asp:ListItem>
                                    <asp:ListItem Value="S19" Text="S19"></asp:ListItem>
                                    <asp:ListItem Value="S20" Text="S20"></asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                            <div class="muted" style="margin-top:8px;">Layout is illustrative. Integrate real-time availability later.</div>
                        </div>

                        <!-- Payment Summary -->
                        <div class="col-12"><hr /></div>
                        <div class="col-6">
                            <label>Total Price</label>
                            <div class="total" id="totalPrice">₹ 0.00</div>
                            <div class="muted">Calculated as Fare × Number of Seats</div>
                        </div>
                        <div class="col-6" style="align-self: end; text-align: right;">
                            <div class="btn-row">
                                <asp:Button ID="btnConfirmPay" runat="server" Text="Confirm & Pay" CssClass="btn" OnClick="btnConfirmPay_Click" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>BusBooking</h4>
                    <p>Your trusted partner for online bus ticket booking.</p>
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
                    <p>Email: info@busbooking.com</p>
                    <p>Phone: +91 1234567890</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 BusBooking. All rights reserved.</p>
            </div>
        </div>
    </footer>
</body>
<script>
    // Put any last-second script hooks here if needed.
    // Already included logic for params, total calc, and simulate pay.
    // Keep scripts at the bottom for better page performance.
</script>
</html>






