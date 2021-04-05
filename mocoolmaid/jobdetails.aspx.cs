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
    public partial class jobdetails : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getJobName();
        }
        private void getJobName()
        {
            string JOB_ID = Request.QueryString["JOB_ID"];
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND JOB_ID="+JOB_ID;
            con.Open();
            jobdetail.DataSource = cmd.ExecuteReader();
            jobdetail.DataBind();
            con.Close();
        }
    }
}