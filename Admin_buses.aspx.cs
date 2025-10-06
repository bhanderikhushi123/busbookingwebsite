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
    public partial class Admin_buses : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == System.Data.ConnectionState.Closed)
                con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtcategory.Text.Trim() == "")
                return;

            getcon();
            if (ViewState["EditingCategoryId"] != null) // Update mode
            {
                int id = Convert.ToInt32(ViewState["EditingCategoryId"]);
                string str = "UPDATE BusCategory_tbl SET CategoryName='" + txtcategory.Text.Trim() + "' WHERE Id=" + id;
                cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
                ViewState["EditingCategoryId"] = null;
            }
            else // Insert mode
            {
                string str = "INSERT INTO BusCategory_tbl (CategoryName) VALUES ('" + txtcategory.Text.Trim() + "')";
                cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
            }

            txtcategory.Text = "";
            BindGrid();
        }

        void BindGrid()
        {
            getcon();
            string str = "SELECT * FROM BusCategory_tbl";
            cmd = new SqlCommand(str, con);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            dr.Close();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            getcon();
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_dlt")
            {
                string str = "DELETE FROM BusCategory_tbl WHERE Id=" + id;
                cmd = new SqlCommand(str, con);
                cmd.ExecuteNonQuery();
            }
            else if (e.CommandName == "cmd_edt")
            {
                string str = "SELECT * FROM BusCategory_tbl WHERE Id=" + id;
                cmd = new SqlCommand(str, con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtcategory.Text = dr["CategoryName"].ToString();
                }
                dr.Close();
                ViewState["EditingCategoryId"] = id;
            }

            BindGrid();
        }
    }
}