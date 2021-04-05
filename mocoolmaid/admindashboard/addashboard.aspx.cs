using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace mocoolmaid.admindashboard
{
    public partial class addashboard : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADID"] == null && Session["ADNAME"] == null)
            {
                Response.Redirect("../adminlogin.aspx");
            }
            session.Text = Session["ADNAME"].ToString();
            counthk();
            countho();
            countjob();
            getGridJob();
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
            cnthk.Text =  "" + cmd.ExecuteScalar();
            con.Close();
        }
        void countho()
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT COUNT(*) FROM TBLHOUSEOWNER";
            con.Open();
            cntho.Text = "" + cmd.ExecuteScalar();

            con.Close();
        }
        void countjob()
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT COUNT(*) FROM TBLJOB";
            con.Open();
            cntjob.Text = "" + cmd.ExecuteScalar();

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
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION, TBLCATEGORY WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND TBLJOB.CATEGORY_ID=TBLCATEGORY.CATEGORY_ID AND JOB_ID=2";
            con.Open();
            jobv.DataSource = cmd.ExecuteReader();
            jobv.DataBind();
            con.Close();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session["ADNAME"] != null)
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("../home.aspx");
            }
        }
    }
}