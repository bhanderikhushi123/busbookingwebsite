using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace busbookingwebsite
{
    public partial class View_Detail : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fill();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fill()
        {
            da = new SqlDataAdapter("SELECT * FROM routes_tbl WHERE Id='" + Request.QueryString["Page"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            con.Close();
        }
    }
}