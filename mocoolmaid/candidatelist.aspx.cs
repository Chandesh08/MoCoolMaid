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
    public partial class candidatelist1 : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCandidateList();
                getLoctionlist();
                getCategorylist();
                getAgelist();
                counthk();
            }
        }
        private void getCandidateList()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER, TBLLOCATION WHERE TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HK_STATUS='Active'";
            cmd.CommandText = "SELECT TBLHOUSEKEEPER.HK_ID, HK_LNAME, HK_FNAME, AGE, HK_PICTURE, HK_CATEGORY, HK_STREET, HK_TOWN, DISTRICT_NAME, AVG(COALESCE(COUNTER,0)) AS RATE FROM TBLHOUSEKEEPER LEFT JOIN TBLHKHO_REVIEWS ON TBLHOUSEKEEPER.HK_ID=TBLHKHO_REVIEWS.HK_ID LEFT JOIN TBLLOCATION ON TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID WHERE HK_STATUS='Active' GROUP BY TBLHOUSEKEEPER.HK_ID, HK_LNAME, HK_FNAME, AGE, HK_PICTURE, HK_CATEGORY, HK_STREET, HK_TOWN, DISTRICT_NAME";
            //cmd.CommandText = "SELECT DISTINCT TBLHKHO_REVIEWS.HK_ID, HK_LNAME, HK_FNAME, AGE, HK_PICTURE, HK_CATEGORY, HK_STREET, HK_TOWN, DISTRICT_NAME, COUNTER FROM TBLHOUSEKEEPER FULL OUTER JOIN TBLHKHO_REVIEWS ON TBLHOUSEKEEPER.HK_ID=TBLHKHO_REVIEWS.HK_ID FULL OUTER JOIN TBLLOCATION ON TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID WHERE HK_STATUS='Active'";
            con.Open();
            candidatelist.DataSource = cmd.ExecuteReader();
            candidatelist.DataBind();
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
            loca.DataSource = cmd.ExecuteReader();
            loca.DataTextField = "DISTRICT_NAME";
            loca.DataValueField = "LOCATION_ID";
            loca.DataBind();
            ListItem li = new ListItem("Select Location", "-1");
            loca.Items.Insert(0, li);
            con.Close();
        }
        private void getCategorylist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT HK_CATEGORY FROM TBLHOUSEKEEPER";
            con.Open();
            cate.DataSource = cmd.ExecuteReader();
            cate.DataTextField = "HK_CATEGORY";
            cate.DataValueField = "HK_CATEGORY";
            cate.DataBind();
            ListItem li = new ListItem("Select Category", "-1");
            cate.Items.Insert(0, li);
            con.Close();
        }
        private void getAgelist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT AGE FROM TBLHOUSEKEEPER";
            con.Open();
            age.DataSource = cmd.ExecuteReader();
            age.DataTextField = "AGE";
            age.DataValueField = "AGE";
            age.DataBind();
            ListItem li = new ListItem("Select Age", "-1");
            age.Items.Insert(0, li);
            con.Close();
        }
        void counthk()
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT COUNT(*) FROM TBLHOUSEKEEPER";
            con.Open();
            lblcount.Text = "Number of House Keeper: " + cmd.ExecuteScalar();

            con.Close();
        }

        protected void searchcan_TextChanged(object sender, EventArgs e)
        {
            string ddval = loca.SelectedValue;
            string ddval1 = cate.SelectedValue;
            string ddval2 = age.SelectedValue;
            string hkname = searchcan.Text.Trim();

            string param1 = "";
            string param2 = "";
            string param3 = "";
            string param4 = "";

            if (hkname != null)
            {
                param1 = " AND HK_FNAME LIKE + @name + '%'";
            }
            if (ddval != "-1")
            {
                param2 = " AND TBLHOUSEKEEPER.LOCATION_ID = @loc_id";
            }
            if (ddval1 != "-1")
            {
                param3 = " AND HK_CATEGORY = @cat_id";
            }
            if (ddval2 != "-1")
            {
                param4 = " AND AGE = @age";
            }
            // Create Connection
            using (SqlConnection dbconn = new SqlConnection(_conString))
            {
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dbconn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT TBLHOUSEKEEPER.HK_ID, HK_LNAME, HK_FNAME, AGE, HK_PICTURE, HK_CATEGORY, HK_STREET, HK_TOWN, DISTRICT_NAME, AVG(COALESCE(COUNTER,0)) AS RATE FROM TBLHOUSEKEEPER LEFT JOIN TBLHKHO_REVIEWS ON TBLHOUSEKEEPER.HK_ID=TBLHKHO_REVIEWS.HK_ID LEFT JOIN TBLLOCATION ON TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID WHERE HK_STATUS='Active'" + param1 + param2 + param3 + param4 + " GROUP BY TBLHOUSEKEEPER.HK_ID, HK_LNAME, HK_FNAME, AGE, HK_PICTURE, HK_CATEGORY, HK_STREET, HK_TOWN, DISTRICT_NAME";
                cmd.Parameters.AddWithValue("@name", hkname);
                cmd.Parameters.AddWithValue("@loc_id", ddval);
                cmd.Parameters.AddWithValue("@cat_id", ddval1);
                cmd.Parameters.AddWithValue("@age", ddval2);
                //Create DataReader
                SqlDataReader reader;
                dbconn.Open();
                reader = cmd.ExecuteReader();
                candidatelist.DataSource = reader;
                candidatelist.DataBind();
            }
        }
    }
}