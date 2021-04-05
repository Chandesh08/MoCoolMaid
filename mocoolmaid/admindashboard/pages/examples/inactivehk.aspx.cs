using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace mocoolmaid.admindashboard.pages.examples
{
    public partial class inactivehk : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADID"] == null && Session["ADNAME"] == null)
            {
                Response.Redirect("../../../adminlogin.aspx");
            }
            session.Text = Session["ADNAME"].ToString();
            getGridHK();
        }
        private void getGridHK()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER, TBLLOCATION WHERE TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HK_STATUS='Deactive'";
            con.Open();
            hkgrid.DataSource = cmd.ExecuteReader();
            hkgrid.DataBind();
            con.Close();
        }

        protected void btnselectHK_Command(object sender, CommandEventArgs e)
        {
            string[] arg = new string[3];
            arg = e.CommandArgument.ToString().Split(';');
            int HKID = Convert.ToInt32(arg[0]);
            String HKName = arg[1] + " " + arg[2];

            Boolean IsUpdated = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLHOUSEKEEPER SET HK_STATUS=@status WHERE Hk_ID=@hoid";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@status", "Active");
            cmd.Parameters.AddWithValue("@hoid", HKID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = HKName + " is activated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridHK();
            }
            else
            {
                lblMsg.Text = "Error while activating " + HKName + " account";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session["ADNAME"] != null)
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("../../../home.aspx");
            }
        }

        protected void searchjob_TextChanged(object sender, EventArgs e)
        {
            string jobname = searchjob.Text.Trim();

            string param1 = "";

            if (jobname != null)
            {
                param1 = " AND HK_LNAME LIKE + @name + '%'";
            }

            // Create Connection
            using (SqlConnection dbconn = new SqlConnection(_conString))
            {
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dbconn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER, TBLLOCATION WHERE TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HK_STATUS='Deactive'" + param1;
                cmd.Parameters.AddWithValue("@name", jobname);
                //Create DataReader
                SqlDataReader reader;
                dbconn.Open();
                reader = cmd.ExecuteReader();
                hkgrid.DataSource = reader;
                hkgrid.DataBind();
            }
        }
    }
}