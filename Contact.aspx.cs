using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace busbookingwebsite
{
    public partial class Contact : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            try
            {
                // Check if page is valid (all validators passed)
                if (Page.IsValid)
                {
                    // Get form values
                    string firstName = txtFirstName.Text.Trim();
                    string lastName = txtLastName.Text.Trim();
                    string email = txtEmail.Text.Trim();
                    string phone = txtPhone.Text.Trim();
                    string subject = ddlSubject.SelectedValue;
                    string message = txtMessage.Text.Trim();
                    DateTime submittedDate = DateTime.Now;

                    // Escape single quotes to prevent SQL injection
                    firstName = firstName.Replace("'", "''");
                    lastName = lastName.Replace("'", "''");
                    email = email.Replace("'", "''");
                    phone = phone.Replace("'", "''");
                    message = message.Replace("'", "''");

                    // Open database connection
                    con = new SqlConnection(s);
                    con.Open();

                    // First, check if ContactMessages table exists, if not create it
                    try
                    {
                        string checkTableSql = "IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactMessages]') AND type in (N'U')) " +
                                               "CREATE TABLE [dbo].[ContactMessages] ([Id] [int] IDENTITY(1,1) NOT NULL, [FirstName] [nvarchar](100) NULL, " +
                                               "[LastName] [nvarchar](100) NULL, [Email] [nvarchar](100) NULL, [Phone] [nvarchar](20) NULL, " +
                                               "[Subject] [nvarchar](50) NULL, [Message] [nvarchar](max) NULL, [SubmittedDate] [datetime] NULL, " +
                                               "[Status] [nvarchar](20) NULL, CONSTRAINT [PK_ContactMessages] PRIMARY KEY CLUSTERED ([Id] ASC))";
                        cmd = new SqlCommand(checkTableSql, con);
                        cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        // Table might already exist or creation failed, continue anyway
                    }

                    // Insert contact message into database
                    string sql = "INSERT INTO ContactMessages (FirstName, LastName, Email, Phone, Subject, Message, SubmittedDate, Status) " +
                                 "VALUES ('" + firstName + "', '" + lastName + "', '" + email + "', '" + phone + "', '" + 
                                 subject + "', '" + message + "', '" + submittedDate.ToString("yyyy-MM-dd HH:mm:ss") + "', 'Pending')";

                    cmd = new SqlCommand(sql, con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    // Show success message
                    lblMessageStatus.Text = "Thank you for contacting us! Your message has been sent successfully. We will get back to you soon.";
                    lblMessageStatus.CssClass = "message-status success";
                    lblMessageStatus.Visible = true;

                    // Clear the form
                    ClearForm();
                }
                else
                {
                    // Validation failed
                    lblMessageStatus.Text = "Please fill in all required fields correctly.";
                    lblMessageStatus.CssClass = "message-status error";
                    lblMessageStatus.Visible = true;
                }
            }
            catch (SqlException sqlEx)
            {
                // Show detailed SQL error for debugging
                lblMessageStatus.Text = "Database error: " + sqlEx.Message + ". Please contact administrator.";
                lblMessageStatus.CssClass = "message-status error";
                lblMessageStatus.Visible = true;
                
                // Close connection if still open
                if (con != null && con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                // Show error message with details for debugging
                lblMessageStatus.Text = "Error: " + ex.Message + ". Please try again or contact support.";
                lblMessageStatus.CssClass = "message-status error";
                lblMessageStatus.Visible = true;
                
                // Close connection if still open
                if (con != null && con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlSubject.SelectedIndex = 0;
            txtMessage.Text = "";
        }
    }
}