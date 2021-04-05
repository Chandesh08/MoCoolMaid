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
    public partial class listjob : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["ADNAME"] != null)
            //{
            //    Session.RemoveAll();
            //    Session.Abandon();
            //    Response.Redirect("../home.aspx");
            //}
            session.Text = Session["ADNAME"].ToString();
            getGridJob();
        }
        private void getGridJob()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION, TBLHOUSEOWNER, TBLCATEGORY WHERE TBLHOUSEOWNER.HO_ID=TBLJOB.HO_ID AND TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND TBLJOB.CATEGORY_ID=TBLCATEGORY.CATEGORY_ID";
            con.Open();
            jobgrid.DataSource = cmd.ExecuteReader();
            jobgrid.DataBind();
            con.Close();
        }

        protected void searchjob_TextChanged(object sender, EventArgs e)
        {
            string jobname = searchjob.Text.Trim();

            string param1 = "";

            if (jobname != null)
            {
                param1 = " AND JOB_TITLE LIKE + @name + '%'";
            }

            // Create Connection
            using (SqlConnection dbconn = new SqlConnection(_conString))
            {
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = dbconn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION, TBLCATEGORY, TBLHOUSEOWNER WHERE TBLHOUSEOWNER.HO_ID=TBLJOB.HO_ID AND TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND TBLJOB.CATEGORY_ID=TBLCATEGORY.CATEGORY_ID" + param1;
                cmd.Parameters.AddWithValue("@name", jobname);
                //Create DataReader
                SqlDataReader reader;
                dbconn.Open();
                reader = cmd.ExecuteReader();
                jobgrid.DataSource = reader;
                jobgrid.DataBind();
            }
        }

        protected void djob_Command(object sender, CommandEventArgs e)
        {
            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');
            int JobID = Convert.ToInt32(arg[0]);
            String JobName = arg[1];

            Boolean IsDeleted = false;
            //Add built-in function to remove spaces from Textbox Category name
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected category for the above CatID
            cmd.CommandText = "DELETE FROM TBLHK_JOB WHERE JOB_ID=@Jid; DELETE FROM TBLJob WHERE JOB_ID=@Jid";
            //Create a parametererized query for CatID
            cmd.Parameters.AddWithValue("@Jid", JobID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = JobName + " deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridJob();
            }
            else
            {
                lblMsg.Text = "Error while deleting " + JobName;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../../home.aspx");
        }
    }
    }
