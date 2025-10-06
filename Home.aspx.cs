using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace busbookingwebsite
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["Page"] = 0;
                fillList();
                fillGrid();
            }

        }

        void GetConnection()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        // ================= ROUTES SECTION WITH PAGING =====================
        void fillList()
        {
            GetConnection();
            da = new SqlDataAdapter("SELECT Id, RouteName, Source, Destination, Fare, Status FROM routes_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            PagedDataSource pg = new PagedDataSource();
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.AllowPaging = true;
            pg.PageSize = 2; // show 2 routes per page
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["Page"]);

            LinkButton1.Enabled = !pg.IsFirstPage;
            LinkButton2.Enabled = !pg.IsLastPage;

            DataList1.DataSource = pg;
            DataList1.DataBind();

            ViewState["totalRows"] = ds.Tables[0].Rows.Count;
        }

        protected void LinkButton1_Click(object sender, EventArgs e) // Previous
        {
            int page = Convert.ToInt32(ViewState["Page"]);
            if (page > 0)
            {
                page--;
                ViewState["Page"] = page;
                fillList();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e) // Next
        {
            int page = Convert.ToInt32(ViewState["Page"]);
            page++;
            ViewState["Page"] = page;
            fillList();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                string routeId = e.CommandArgument.ToString();
                GetConnection();
                da = new SqlDataAdapter("SELECT TOP 1 * FROM routes_tbl WHERE Id='" + routeId + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    
                    var row = ds.Tables[0].Rows[0];
                    string routeName = row.Table.Columns.Contains("RouteName") ? row["RouteName"].ToString() : "";
                    string src = row.Table.Columns.Contains("Source") ? row["Source"].ToString() : "";
                    string destination = row.Table.Columns.Contains("Destination") ? row["Destination"].ToString() : "";
                    string fare = row.Table.Columns.Contains("Fare") ? row["Fare"].ToString() : "0";
                    string dep = row.Table.Columns.Contains("DepartureTime") ? row["DepartureTime"].ToString() : "";
                    string arr = row.Table.Columns.Contains("ArrivalTime") ? row["ArrivalTime"].ToString() : "";

                    string bus = !string.IsNullOrEmpty(routeName) ? routeName : (row.Table.Columns.Contains("BusName") ? row["BusName"].ToString() : "");
                    string routeDisplay = (src + " → " + destination).Trim();

                    string url = ResolveUrl("~/Book_Now.aspx") +
                        "?id=" + HttpUtility.UrlEncode(routeId) +
                        "&bus=" + HttpUtility.UrlEncode(bus) +
                        "&route=" + HttpUtility.UrlEncode(routeDisplay) +
                        "&fare=" + HttpUtility.UrlEncode(fare) +
                        "&dep=" + HttpUtility.UrlEncode(dep) +
                        "&arr=" + HttpUtility.UrlEncode(arr);

                    Response.Redirect(url);
                }
                else
                {
                    Response.Write("<script>alert('Selected route not found.');</script>");
                }
            }
            else if (e.CommandName == "cmd_View")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("View_Detail.aspx?Page=" + id);
            }

        }

        // ================= BOOKING FORM =====================
        protected void btnBook_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string gender = rblGender.SelectedValue;
            string email = txtEmail.Text;
            string fromCity = ddlFromCity.SelectedValue;
            string toCity = ddlToCity.SelectedValue;
            string travelDate = txtTravelDate.Text;
            string seats = txtSeats.Text;
            string filePath = "";

            if (fuIDProof.HasFile)
            {
                filePath = "uploads/" + fuIDProof.FileName;
                fuIDProof.SaveAs(Server.MapPath(filePath));
            }

            GetConnection();

            // Insert Query without @ parameters
            string insertQuery = "INSERT INTO BusBookings(PassengerName, Gender, Email, FromCity, ToCity, TravelDate, Seats, IDProofPath) " +
                                 "VALUES('" + name + "', '" + gender + "', '" + email + "', '" + fromCity + "', '" + toCity + "', '" + travelDate + "', '" + seats + "', '" + filePath + "')";

            cmd = new SqlCommand(insertQuery, con);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Booking Successful!');</script>");
            fillGrid();
        }

        // ================= GRIDVIEW SECTION =====================
        void fillGrid()
        {
            GetConnection();
            da = new SqlDataAdapter("SELECT * FROM BusBookings", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                GetConnection();

                string deleteQuery = "DELETE FROM BusBookings WHERE Id='" + id + "'";
                cmd = new SqlCommand(deleteQuery, con);
                cmd.ExecuteNonQuery();

                fillGrid();
                Response.Write("<script>alert('Booking Deleted!');</script>");
            }
            else if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                GetConnection();

                da = new SqlDataAdapter("SELECT * FROM BusBookings WHERE Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtName.Text = ds.Tables[0].Rows[0]["PassengerName"].ToString();
                    rblGender.SelectedValue = ds.Tables[0].Rows[0]["Gender"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    ddlFromCity.SelectedValue = ds.Tables[0].Rows[0]["FromCity"].ToString();
                    ddlToCity.SelectedValue = ds.Tables[0].Rows[0]["ToCity"].ToString();
                    txtTravelDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["TravelDate"]).ToString("yyyy-MM-dd");
                    txtSeats.Text = ds.Tables[0].Rows[0]["Seats"].ToString();

                    ViewState["id"] = id;
                    btnBook.Text = "Update";
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}