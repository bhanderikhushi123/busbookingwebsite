<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="busbookingwebsite.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        .payment-section {
            padding: 40px 0;
            background: #f5f5f5;
            min-height: 80vh;
        }

        .payment-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 12px 12px 0 0;
            text-align: center;
        }

        .payment-header h2 {
            margin: 0 0 15px 0;
            font-size: 32px;
        }

        .amount-display {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
        }

        .payment-content {
            background: white;
            border-radius: 0 0 12px 12px;
            padding: 30px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }

        .payment-methods,
        .payment-form,
        .order-summary {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 8px;
        }

        .payment-methods h3,
        .payment-form h3,
        .order-summary h3 {
            margin-top: 0;
            color: #2c3e50;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .method-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .method-option {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .method-option input[type="radio"] {
            margin-right: 15px;
            width: 20px;
            height: 20px;
        }

        .method-card {
            display: flex;
            align-items: center;
            padding: 15px;
            background: white;
            border-radius: 8px;
            border: 2px solid #e5e7eb;
            flex: 1;
            transition: all 0.3s;
        }

        .method-option input[type="radio"]:checked + .method-card {
            border-color: #667eea;
            background: #f0f4ff;
        }

        .method-icon {
            font-size: 32px;
            margin-right: 15px;
        }

        .method-info {
            display: flex;
            flex-direction: column;
        }

        .method-name {
            font-weight: 600;
            color: #2c3e50;
        }

        .method-desc {
            font-size: 14px;
            color: #6c757d;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .form-options {
            margin-bottom: 20px;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .checkbox-label input[type="checkbox"] {
            margin-right: 10px;
            width: 18px;
            height: 18px;
        }

        .btn-primary {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .summary-details {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .summary-item.total {
            border-top: 2px solid #667eea;
            border-bottom: none;
            font-weight: bold;
            font-size: 18px;
            color: #2c3e50;
            margin-top: 10px;
        }

        @media (max-width: 768px) {
            .payment-content {
                grid-template-columns: 1fr;
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
        <title>BusBooking - Payment</title>
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
</asp:Content>

<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Payment Section -->
    <section class="payment-section">
        <div class="container">
            <div class="payment-header">
                <h2>Payment</h2>
                <div class="amount-display">
                    <span>Total Amount: &#8377;<asp:Label ID="lblTotalAmount" runat="server"></asp:Label></span>
                </div>
            </div>

            <div class="payment-content">
                <!-- Payment Methods -->
                <div class="payment-methods">
                    <h3>Select Payment Method</h3>
                    <div class="method-options">
                        <label class="method-option">
                            <asp:RadioButton ID="rbCard" runat="server" GroupName="paymentMethod" Checked="true" />
                            <div class="method-card">
                                <div class="method-icon">&#128179;</div>
                                <div class="method-info">
                                    <span class="method-name">Credit/Debit Card</span>
                                    <span class="method-desc">Visa, MasterCard, RuPay</span>
                                </div>
                            </div>
                        </label>
                        
                        <label class="method-option">
                            <asp:RadioButton ID="rbUPI" runat="server" GroupName="paymentMethod" />
                            <div class="method-card">
                                <div class="method-icon">&#128241;</div>
                                <div class="method-info">
                                    <span class="method-name">UPI</span>
                                    <span class="method-desc">Google Pay, PhonePe, Paytm</span>
                                </div>
                            </div>
                        </label>
                        
                        <label class="method-option">
                            <asp:RadioButton ID="rbNetBanking" runat="server" GroupName="paymentMethod" />
                            <div class="method-card">
                                <div class="method-icon">&#127974;</div>
                                <div class="method-info">
                                    <span class="method-name">Net Banking</span>
                                    <span class="method-desc">All major banks</span>
                                </div>
                            </div>
                        </label>
                        
                        <label class="method-option">
                            <asp:RadioButton ID="rbWallet" runat="server" GroupName="paymentMethod" />
                            <div class="method-card">
                                <div class="method-icon">&#128093;</div>
                                <div class="method-info">
                                    <span class="method-name">Digital Wallet</span>
                                    <span class="method-desc">Paytm, Amazon Pay</span>
                                </div>
                            </div>
                        </label>
                    </div>
                </div>

                <!-- Payment Form -->
                <div class="payment-form">
                    <h3>Payment Details</h3>
                    <div>
                        <div class="form-group">
                            <label for="txtCardNumber">Card Number</label>
                            <asp:TextBox ID="txtCardNumber" runat="server" placeholder="1234 5678 9012 3456" MaxLength="19"></asp:TextBox>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="txtExpiryDate">Expiry Date</label>
                                <asp:TextBox ID="txtExpiryDate" runat="server" placeholder="MM/YY" MaxLength="5"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtCVV">CVV</label>
                                <asp:TextBox ID="txtCVV" runat="server" placeholder="123" MaxLength="4" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="txtCardHolderName">Card Holder Name</label>
                            <asp:TextBox ID="txtCardHolderName" runat="server" placeholder="Name on card"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label for="txtEmail">Email for Receipt</label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter email address" TextMode="Email"></asp:TextBox>
                        </div>
                        
                        <div class="form-options">
                            <label class="checkbox-label">
                                <asp:CheckBox ID="chkSaveCard" runat="server" />
                                <span>Save card for future payments</span>
                            </label>
                        </div>
                        
                        <asp:Button ID="btnPayNow" runat="server" Text="Pay Now" CssClass="btn-primary" OnClick="btnPayNow_Click" />
                    </div>
                </div>

                <!-- Order Summary -->
                <div class="order-summary">
                    <h3>Order Summary</h3>
                    <div class="summary-details">
                        <asp:Repeater ID="rptBookingSummary" runat="server">
                            <ItemTemplate>
                                <div class="summary-item">
                                    <span><%# Eval("Route") %></span>
                                    <span>&#8377;<%# Eval("TotalPrice", "{0:F2}") %></span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="summary-item total">
                            <span>Total Amount</span>
                            <span>&#8377;<asp:Label ID="lblGrandTotal" runat="server"></asp:Label></span>
                        </div>
                    </div>
                </div>
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
                    <p>Your trusted partner for online bus ticket booking.</p>
                </div>
                <div class="footer-section">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="Serach_buses.aspx">Search Buses</a></li>
                        <li><a href="My_booking.aspx">My Bookings</a></li>
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
</asp:Content>

