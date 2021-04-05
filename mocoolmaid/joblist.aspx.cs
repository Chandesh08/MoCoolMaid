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
    public partial class joblist : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                getCategorylist();
                getLoctionlist();
                getJobType();
                getGridJob();
                getGender();
            }
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
            category.DataSource = cmd.ExecuteReader();
            category.DataTextField = "CATEGORY_NAME";
            category.DataValueField = "CATEGORY_ID";
            category.DataBind();
            ListItem li = new ListItem("Select Category", "-1");
            category.Items.Insert(0, li);
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
            location.DataSource = cmd.ExecuteReader();
            location.DataTextField = "DISTRICT_NAME";
            location.DataValueField = "LOCATION_ID";
            location.DataBind();
            ListItem li = new ListItem("Select Location", "-1");
            location.Items.Insert(0, li);
            con.Close();
        }
        private void getJobType()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT DISTINCT JOB_TYPE FROM TBLJOB";
            con.Open();
            jobtype.DataSource = cmd.ExecuteReader();
            jobtype.DataTextField = "JOB_TYPE";
            jobtype.DataValueField = "JOB_TYPE";
            jobtype.DataBind();
            ListItem li = new ListItem("Select Job Type", "-1");
            jobtype.Items.Insert(0, li);
            con.Close();
        }
        private void getGender()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT DISTINCT JOB_GENDER FROM TBLJOB";
            con.Open();
            gender.DataSource = cmd.ExecuteReader();
            gender.DataTextField = "JOB_GENDER";
            gender.DataValueField = "JOB_GENDER";
            gender.DataBind();
            ListItem li = new ListItem("Select Job Gender", "-1");
            gender.Items.Insert(0, li);
            con.Close();
        }
        private void getGridJob()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT JOB_ID, JOB_TITLE, JOB_TYPE, DEADLINE_DATE, JOB_STATUS, POSTED_DATE, DISTRICT_NAME FROM TBLJOB, TBLLOCATION WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID";
            con.Open();
            joblist1.DataSource = cmd.ExecuteReader();
            joblist1.DataBind();
            con.Close();
        }

        protected void search_TextChanged(object sender, EventArgs e)
        {

            string ddval = location.SelectedValue;
            string ddval1 = category.SelectedValue;
            string ddval2 = jobtype.SelectedValue;
            string ddval3 = gender.SelectedValue;
            string hkname = search.Text.Trim();

            string param1 = "";
            string param2 = "";
            string param3 = "";
            string param4 = "";
            string param5 = "";

            if (hkname != null)
            {
                param1 = " AND JOB_TITLE LIKE + @name + '%'";
            }
            if (ddval != "-1")
            {
                param2 = " AND TBLJOB.LOCATION_ID = @loc_id";
            }
            if (ddval1 != "-1")
            {
                param3 = " AND TBLJOB.CATEGORY_ID = @cat_id";
            }
            if (ddval2 != "-1")
            {
                param4 = " AND JOB_TYPE = @jt";
            }
            if (ddval3 != "-1")
            {
                param5 = " AND JOB_GENDER = @gender";
            }
            // Create Connection
            using (SqlConnection dbconn = new SqlConnection(_conString))
            {
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dbconn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION, TBLCATEGORY WHERE TBLJOB.CATEGORY_ID=TBLCATEGORY.CATEGORY_ID AND TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID" + param1 + param2 + param3 + param4 + param5;
                cmd.Parameters.AddWithValue("@name", hkname);
                cmd.Parameters.AddWithValue("@loc_id", ddval);
                cmd.Parameters.AddWithValue("@cat_id", ddval1);
                cmd.Parameters.AddWithValue("@jt", ddval2);
                cmd.Parameters.AddWithValue("@gender", ddval3);
                //Create DataReader
                SqlDataReader reader;
                dbconn.Open();
                reader = cmd.ExecuteReader();
                joblist1.DataSource = reader;
                joblist1.DataBind();
            }
        }

        protected void joblist1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label btndead = (Label)e.Item.FindControl("Label2");
            DateTime date2 = DateTime.Today;
            DateTime idate = (DateTime)(DataBinder.Eval(e.Item.DataItem, "DEADLINE_DATE"));
            String status = (String)(DataBinder.Eval(e.Item.DataItem, "JOB_STATUS"));
            if (idate < date2)
            {
                btndead.Visible = true;
                btndead.Text = "Expired";
            }
            if (status == "Occupied")
            {
                btndead.Visible = true;
                btndead.Text = "Occupied";
            }
        }
    }
}