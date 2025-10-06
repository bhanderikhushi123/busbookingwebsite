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

    public partial class Admin_routes : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCategory();
                BindGrid();
            }
        }

        void GetCon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
                con.Open();
        }

        void FillCategory()
        {
            GetCon();
            da = new SqlDataAdapter("SELECT * FROM BusCategory_tbl", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dlcat.Items.Clear();
            dlcat.Items.Add("-- Select Category --");
            foreach (DataRow row in dt.Rows)
            {
                dlcat.Items.Add(new ListItem(row["CategoryName"].ToString(), row["Id"].ToString()));
            }
            con.Close();
        }

        void BindGrid()
        {
            GetCon();
            da = new SqlDataAdapter("SELECT * FROM routes_tbl", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void btnSaveRoute_Click(object sender, EventArgs e)
        {
            if (dlcat.SelectedIndex <= 0) return;

            int c_id = Convert.ToInt32(dlcat.SelectedValue);
            GetCon();

            if (ViewState["EditingRouteId"] != null) // Update mode
            {
                int id = Convert.ToInt32(ViewState["EditingRouteId"]);
                string sql = "UPDATE routes_tbl SET c_id=" + c_id + ", " +
                             "RouteName='" + txtRouteName.Text.Trim() + "', " +
                             "Source='" + txtSource.Text.Trim() + "', " +
                             "Destination='" + txtDestination.Text.Trim() + "', " +
                             "Operator='" + txtOperator.Text.Trim() + "', " +
                             "Distance='" + txtDistance.Text.Trim() + "', " +
                             "Duration='" + txtDuration.Text.Trim() + "', " +
                             "Fare='" + txtFare.Text.Trim() + "', " +
                             "Status='" + ddlStatus.SelectedValue + "' " +
                             "WHERE Id=" + id;
                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                ViewState["EditingRouteId"] = null;
            }
            else // Insert mode
            {
                string sql = "INSERT INTO routes_tbl (c_id, RouteName, Source, Destination, Operator, Distance, Duration, Fare, Status) " +
                             "VALUES (" + c_id + ", '" +
                             txtRouteName.Text.Trim() + "', '" +
                             txtSource.Text.Trim() + "', '" +
                             txtDestination.Text.Trim() + "', '" +
                             txtOperator.Text.Trim() + "', '" +
                             txtDistance.Text.Trim() + "', '" +
                             txtDuration.Text.Trim() + "', '" +
                             txtFare.Text.Trim() + "', '" +
                             ddlStatus.SelectedValue + "')";
                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
            }

            con.Close();

            // Reset fields
            txtRouteName.Text = "";
            txtSource.Text = "";
            txtDestination.Text = "";
            txtOperator.Text = "";
            txtDistance.Text = "";
            txtDuration.Text = "";
            txtFare.Text = "";
            dlcat.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;

            BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            GetCon();

            if (e.CommandName == "cmd_dlt")
            {
                string str = "DELETE FROM routes_tbl WHERE Id=" + id;
                cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
            }
            else if (e.CommandName == "cmd_edt")
            {
                string str = "SELECT * FROM routes_tbl WHERE Id=" + id;
                da = new SqlDataAdapter(str, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    dlcat.SelectedValue = row["c_id"].ToString();
                    txtRouteName.Text = row["RouteName"].ToString();
                    txtSource.Text = row["Source"].ToString();
                    txtDestination.Text = row["Destination"].ToString();
                    txtOperator.Text = row["Operator"].ToString();
                    txtDistance.Text = row["Distance"].ToString();
                    txtDuration.Text = row["Duration"].ToString();
                    txtFare.Text = row["Fare"].ToString();
                    ddlStatus.SelectedValue = row["Status"].ToString();
                }
                ViewState["EditingRouteId"] = id;
            }

            con.Close();
            BindGrid();
        }
    }
}