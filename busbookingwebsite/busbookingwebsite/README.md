# Online Bus Booking System - HTML/CSS Template

A complete, responsive HTML/CSS template for an online bus booking system that can be easily converted to ASP.NET Web Forms or ASP.NET MVC.

## 📁 Template Structure

```
bus-booking-template/
│
├── index.html               # Home page with search functionality
├── search.html              # Search results page
├── bus-details.html         # Bus seat selection page
├── login.html               # User login page
├── register.html            # User registration page
├── booking-summary.html     # Booking confirmation page
├── my-bookings.html         # User booking history
├── payment.html             # Payment gateway page
├── styles.css               # Complete responsive CSS
└── README.md               # This file
```

## 🎨 Features

### ✅ User Interface Features
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional design with gradient backgrounds
- **Interactive Elements**: Hover effects, smooth transitions, and visual feedback
- **Accessibility**: Proper semantic HTML and keyboard navigation support

### ✅ Pages Included

#### 1. **Home Page** (`index.html`)
- Hero section with search form
- Popular routes showcase
- Feature highlights
- Responsive navigation

#### 2. **Search Results** (`search.html`)
- Bus listings with detailed information
- Filter options (price, bus type, timing)
- Bus operator details and amenities
- Pricing and seat availability

#### 3. **Bus Details** (`bus-details.html`)
- Interactive seat selection layout
- Visual seat legend (available, selected, booked, ladies)
- Real-time booking summary
- Bus information and timing details

#### 4. **Authentication** (`login.html`, `register.html`)
- Clean login and registration forms
- Form validation styling
- Responsive design for all screen sizes

#### 5. **Booking Summary** (`booking-summary.html`)
- Journey details confirmation
- Passenger information forms
- Price breakdown
- Contact details collection

#### 6. **My Bookings** (`my-bookings.html`)
- Booking history with status indicators
- Tabbed interface (Upcoming, Completed, Cancelled)
- Action buttons for each booking

#### 7. **Payment** (`payment.html`)
- Multiple payment method options
- Credit card form with validation styling
- Order summary sidebar

## 🎯 Responsive Design Features

### Mobile-First Approach
- **Breakpoints**: 480px, 768px, 1200px
- **Flexible Grid System**: CSS Grid and Flexbox
- **Touch-Friendly**: Large buttons and touch targets
- **Optimized Typography**: Readable on all screen sizes

### Responsive Components
- **Navigation**: Collapses to mobile menu on small screens
- **Forms**: Stack vertically on mobile devices
- **Cards**: Single column layout on mobile
- **Seat Selection**: Scrollable on mobile devices
- **Tables**: Horizontal scroll on small screens

## 🚀 How to Convert to ASP.NET

### 1. **File Extensions**
- Change `.html` to `.aspx` for Web Forms
- Change `.html` to `.cshtml` for MVC Razor Views

### 2. **Form Actions**
- Update form `action` attributes to point to your ASP.NET controllers/pages
- Add `runat="server"` to form elements in Web Forms

### 3. **Data Binding**
- Replace static content with ASP.NET data binding expressions
- Use `<%# %>` for Web Forms or `@Model` for MVC

### 4. **Server Controls**
- Convert `<input>` to `<asp:TextBox>`
- Convert `<select>` to `<asp:DropDownList>`
- Convert `<button>` to `<asp:Button>`

### 5. **CSS Integration**
- Keep the existing `styles.css` file
- Add any additional ASP.NET-specific styles
- Use CSS classes for consistent styling

## 🎨 CSS Architecture

### **Design System**
- **Color Palette**: Purple gradient theme (#667eea to #764ba2)
- **Typography**: Segoe UI font family
- **Spacing**: Consistent padding and margins
- **Shadows**: Subtle box-shadows for depth

### **Component Classes**
- `.btn-primary`, `.btn-secondary`, `.btn-danger` - Button styles
- `.form-group`, `.form-row` - Form layout
- `.card`, `.card-header`, `.card-body` - Card components
- `.status-badge` - Status indicators

### **Utility Classes**
- `.container` - Centered container with max-width
- `.text-center` - Center alignment
- `.hidden` - Hide elements
- `.active` - Active state styling

## 📱 Mobile Responsiveness

### **Breakpoints**
```css
/* Mobile */
@media (max-width: 480px) { ... }

/* Tablet */
@media (max-width: 768px) { ... }

/* Desktop */
@media (min-width: 769px) { ... }
```

### **Mobile Optimizations**
- Single column layouts
- Larger touch targets
- Simplified navigation
- Optimized form inputs
- Reduced padding and margins

## 🔧 Customization Guide

### **Colors**
Update the CSS custom properties in `styles.css`:
```css
:root {
    --primary-color: #667eea;
    --secondary-color: #764ba2;
    --success-color: #28a745;
    --danger-color: #dc3545;
    --warning-color: #ffc107;
}
```

### **Typography**
Change the font family in the body selector:
```css
body {
    font-family: 'Your-Font', sans-serif;
}
```

### **Layout**
Modify the container max-width:
```css
.container {
    max-width: 1200px; /* Change this value */
}
```

## 🚀 Getting Started

1. **Download** all files to your project directory
2. **Open** `index.html` in a web browser to preview
3. **Customize** colors, fonts, and content as needed
4. **Convert** to ASP.NET by changing file extensions
5. **Integrate** with your backend logic

## 📋 Browser Support

- ✅ Chrome (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Edge (latest)
- ✅ Internet Explorer 11+

## 🎯 Key Features for ASP.NET Integration

### **Form Handling**
- All forms are properly structured for server-side processing
- Input validation attributes included
- Consistent naming conventions

### **Data Display**
- Structured for easy data binding
- Placeholder content for testing
- Responsive tables and lists

### **Navigation**
- Clean URL structure
- Active state management
- Breadcrumb-ready markup

### **User Experience**
- Loading states ready for AJAX
- Error message styling
- Success confirmation layouts

## 📞 Support

This template is designed to be:
- **Self-contained**: No external dependencies
- **Lightweight**: Optimized CSS and HTML
- **Maintainable**: Clean, well-commented code
- **Extensible**: Easy to add new features

Perfect for converting to ASP.NET Web Forms or MVC applications! 