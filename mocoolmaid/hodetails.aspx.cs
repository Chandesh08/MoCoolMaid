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
    public partial class hodetails : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getCandidateDetail();
            getGridJob();
        }
        private void getCandidateDetail()
        {
            string HO_ID = Request.QueryString["H0_ID"];
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER, TBLLOCATION WHERE TBLHOUSEOWNER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HO_ID=" + HO_ID;
            con.Open();
            candetail.DataSource = cmd.ExecuteReader();
            candetail.DataBind();
            con.Close();
        }
        private void getGridJob()
        {
            string HO_ID = Request.QueryString["H0_ID"];
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT JOB_ID, JOB_TITLE, JOB_TYPE, DEADLINE_DATE, POSTED_DATE, DISTRICT_NAME, JOB_STATUS FROM TBLJOB, TBLLOCATION WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HO_ID=" + HO_ID;
            con.Open();
            joblist1.DataSource = cmd.ExecuteReader();
            joblist1.DataBind();
            con.Close();
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