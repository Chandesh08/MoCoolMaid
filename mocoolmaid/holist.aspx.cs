using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace mocoolmaid
{
    public partial class holist : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            getHouseOwnerList();
            getLoctionlist();
            }
        }
        private void getHouseOwnerList()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER, TBLLOCATION WHERE TBLHOUSEOWNER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HO_STATUS='Active'";
            con.Open();
            holists.DataSource = cmd.ExecuteReader();
            holists.DataBind();
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
            loc.DataSource = cmd.ExecuteReader();
            loc.DataTextField = "DISTRICT_NAME";
            loc.DataValueField = "LOCATION_ID";
            loc.DataBind();
            ListItem li = new ListItem("Select Location", "-1");
            loc.Items.Insert(0, li);
            con.Close();
        }

        protected void search_TextChanged(object sender, EventArgs e)
        {
            string ddval = loc.SelectedValue;
            string hkname = search.Text.Trim();

            string param1 = "";
            string param2 = "";

            if (hkname != null)
            {
                param1 = " AND HO_FNAME LIKE + @name + '%'";
            }
            if (ddval != "-1")
            {
                param2 = " AND TBLHOUSEOWNER.LOCATION_ID = @loc_id";
            }
            // Create Connection
            using (SqlConnection dbconn = new SqlConnection(_conString))
            {
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dbconn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER, TBLLOCATION WHERE TBLHOUSEOWNER.LOCATION_ID=TBLLOCATION.LOCATION_ID" + param1 + param2;
                cmd.Parameters.AddWithValue("@name", hkname);
                cmd.Parameters.AddWithValue("@loc_id", ddval);
                //Create DataReader
                SqlDataReader reader;
                dbconn.Open();
                reader = cmd.ExecuteReader();
                holists.DataSource = reader;
                holists.DataBind();
            }
        }
    }
}