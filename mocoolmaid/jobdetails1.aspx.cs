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
    public partial class jobdetails1 : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                getJobName();
            }
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
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND JOB_ID=@jid";
            cmd.Parameters.AddWithValue("@jid", JOB_ID);
            con.Open();
            jobdetail.DataSource = cmd.ExecuteReader();
            jobdetail.DataBind();
            con.Close();
        }

        protected void applybtn_Click(object sender, EventArgs e)
        {
            string JOB_ID = Request.QueryString["JOB_ID"];
            Boolean IsUpdated = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "INSERT INTO TBLHK_JOB (JOB_ID, HK_ID, DATE_APPLIED, JOB_STATUS) VALUES(@jid, @hkid, @date, @status)";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@hkid", Session["HKID"].ToString());
            cmd.Parameters.AddWithValue("@jid", JOB_ID);
            cmd.Parameters.AddWithValue("@date", DateTime.Today.ToString());
            cmd.Parameters.AddWithValue("@status", "On Hold");
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = "You have successfully applied.";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                Response.Redirect("admindashboard/hkdashboard.aspx");
            }
            else
            {
                lblMsg.Text = "Error while applying";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void jobdetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btn = (Button)e.Item.FindControl("applybtn");
            Label btndead = (Label)e.Item.FindControl("deadline");
            DateTime date2 = DateTime.Today;
            DateTime idate = (DateTime)(DataBinder.Eval(e.Item.DataItem, "DEADLINE_DATE"));
            String status = (String)(DataBinder.Eval(e.Item.DataItem, "JOB_STATUS"));
            if (idate < date2)
            {
                btn.Visible = false;
                btndead.Visible = true;
            }
            if (status == "Occupied")
            {
                btn.Visible = false;
                btndead.Visible = true;
                btndead.Text = "Occupied";
            }
        }
    }
}