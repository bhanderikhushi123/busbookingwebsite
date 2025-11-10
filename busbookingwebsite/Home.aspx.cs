using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace busbookingwebsite
{
    public partial class Home : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        string idProofPath;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetConnection();
            fillgrid();
        }

        void GetConnection()
        {
            con = new SqlConnection(connStr);
            con.Open();
        }

        void UploadIDProof()
        {
            if (fuIDProof.HasFile)
            {
                idProofPath = "uploads/" + fuIDProof.FileName;
                fuIDProof.SaveAs(Server.MapPath(idProofPath));
            }
        }

        void Clear()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            ddlFromCity.SelectedIndex = 0;
            ddlToCity.SelectedIndex = 0;
            txtTravelDate.Text = "";
            txtSeats.Text = "";
        }
        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (btnBook.Text == "Book Ticket")
            {
                GetConnection();
                UploadIDProof();
                fillgrid();

                cmd = new SqlCommand(
                    "INSERT INTO BusBookings (PassengerName, Gender, Email, FromCity, ToCity, TravelDate, Seats, IDProofPath) " +
                    "VALUES ('" + txtName.Text + "', '" + rblGender.SelectedValue + "', '" + txtEmail.Text + "', '" +
                    ddlFromCity.SelectedValue + "', '" + ddlToCity.SelectedValue + "', '" + txtTravelDate.Text + "', '" +
                    txtSeats.Text + "', '" + idProofPath + "')",
                    con
                );

                cmd.ExecuteNonQuery();
                Clear();
                Response.Write("<script>alert('Booking Successfull !');</script>");
            }
            else
            {
                cmd = new SqlCommand(
    "UPDATE BusBookings SET PassengerName = '" + txtName.Text +
    "', Gender = '" + rblGender.SelectedValue +
    "', Email = '" + txtEmail.Text +
    "', FromCity = '" + ddlFromCity.SelectedValue +
    "', ToCity = '" + ddlToCity.SelectedValue +
    "', TravelDate = '" + txtTravelDate.Text +
    "', Seats = '" + txtSeats.Text +
    "' WHERE Id = '" + ViewState["id"] + "'",
    con
);
                cmd.ExecuteNonQuery();
                fillgrid();
                Clear();

                Response.Write("<script>alert('Booking Updated Successfully !');</script>");
                btnBook.Text = "Book Ticket";

            }
        }

        void fillgrid()
        {
            GetConnection();
            da = new SqlDataAdapter("SELECT * FROM BusBookings", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        void select()
        {
            GetConnection();
            da = new SqlDataAdapter("select * from BusBookings where Id='" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            //paring 
            txtName.Text = ds.Tables[0].Rows[0][1].ToString();
            rblGender.SelectedValue = ds.Tables[0].Rows[0][2].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0][3].ToString();
            ddlFromCity.SelectedValue = ds.Tables[0].Rows[0][4].ToString();
            ddlToCity.SelectedValue = ds.Tables[0].Rows[0][5].ToString();
            txtTravelDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0][6]).ToString("yyyy-MM-dd");
            txtSeats.Text = ds.Tables[0].Rows[0][7].ToString();



        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["id"] = id;
                btnBook.Text = "Update";
                select();
            }
            else if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                GetConnection();

                cmd = new SqlCommand("DELETE FROM BusBookings WHERE Id=" + id, con);
                cmd.ExecuteNonQuery();

                fillgrid();


                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Booking deleted successfully!');", true);
            }
        }
    }
}