using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.IO;
using System.Security.Cryptography;

namespace mocoolmaid
{
    public partial class register : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void getCategorylist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLCATEGORY";
            con.Open();
            categories.DataSource = cmd.ExecuteReader();
            categories.DataTextField = "CATEGORY_NAME";
            categories.DataValueField = "CATEGORY_ID";
            categories.DataBind();
            ListItem li = new ListItem("Select Category", "-1");
            categories.Items.Insert(0, li);
            con.Close();
        }
        private void getLoctionlist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLLOCATION";
            con.Open();
            district.DataSource = cmd.ExecuteReader();
            district.DataTextField = "DISTRICT_NAME";
            district.DataValueField = "LOCATION_ID";
            district.DataBind();
            ListItem li = new ListItem("Select Location", "-1");
            district.Items.Insert(0, li);
            con.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            

        }
    }
}