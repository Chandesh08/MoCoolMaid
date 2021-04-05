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
    public partial class hkdashboard : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HKID"] == null && Session["HKNAME"] == null)
            {
                Response.Redirect("../login.aspx");
            }
            if (!IsPostBack)
            {
                getLoctionlist();
                ListItem li = new ListItem("Select Location", "-1");
                loclist.Items.Insert(0, li);
                form();
            }
            getHouseKeeperList();
            getGridJob();
            session.Text = Session["HKNAME"].ToString();
        }
        private void getHouseKeeperList()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER, TBLLOCATION WHERE TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HK_ID=" + Session["HKID"].ToString();
            con.Open();
            hodetail.DataSource = cmd.ExecuteReader();
            hodetail.DataBind();
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
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION, TBLHK_JOB WHERE TBLJOB.JOB_ID=TBLHK_JOB.JOB_ID AND TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HK_ID=" + Session["HKID"].ToString();
            con.Open();
            jobdetail.DataSource = cmd.ExecuteReader();
            jobdetail.DataBind();
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
            loclist.DataSource = cmd.ExecuteReader();
            loclist.DataTextField = "DISTRICT_NAME";
            loclist.DataValueField = "LOCATION_ID";
            loclist.DataBind();
            con.Close();
        }
        
        public void form()
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER WHERE HK_ID=" + Session["HKID"].ToString();
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();
            lname.Text = dr["HK_LNAME"].ToString();
            fname.Text = dr["HK_FNAME"].ToString();
            pnum.Text = dr["HK_PHONE_NUMBER"].ToString();
            email.Text = dr["HK_EMAIL"].ToString();
            street.Text = dr["HK_STREET"].ToString();
            town.Text = dr["HK_TOWN"].ToString();
            loclist.SelectedIndex = Convert.ToInt32(dr["LOCATION_ID"]);
            skill.Text = dr["HK_SKILLS"].ToString();
            certificate.Text = dr["CERTIFICATE"].ToString();
            hq.Text = dr["HIGHEST_QUALIFICATION"].ToString();
            cat.Text = dr["HK_CATEGORY"].ToString();
            pass.Text = dr["HK_PASSWORD"].ToString();
            cpass.Text = dr["HK_PASSWORD"].ToString();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Boolean IsUpdated = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLHOUSEKEEPER SET HK_LNAME=@lname, HK_FNAME=@fname, HK_PHONE_NUMBER=@pnum, HK_EMAIL=@email, HK_STREET=@street, HK_TOWN=@town, LOCATION_ID=@loc, HK_SKILLS=@skill, CERTIFICATE=@certificate, HIGHEST_QUALIFICATION=@hq, HK_CATEGORY=@cat, HK_PASSWORD=@password WHERE HK_ID=" + Session["HKID"].ToString();
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@fname", fname.Text);
            cmd.Parameters.AddWithValue("@lname", lname.Text);
            cmd.Parameters.AddWithValue("@pnum", pnum.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@street", street.Text);
            cmd.Parameters.AddWithValue("@town", town.Text);
            cmd.Parameters.AddWithValue("@loc", loclist.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@skill", skill.Text);
            cmd.Parameters.AddWithValue("@certificate", certificate.Text);
            cmd.Parameters.AddWithValue("@hq", hq.Text);
            cmd.Parameters.AddWithValue("@cat", cat.Text);
            cmd.Parameters.AddWithValue("@password", cpass.Text);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = "Records updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                form();
            }
            else
            {
                lblMsg.Text = "Error while updating records";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnselect_Command(object sender, CommandEventArgs e)
        {
            String jobid = e.CommandArgument.ToString();
            Boolean IsDeleted = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected category for the above CatID
            cmd.CommandText = "DELETE FROM TBLHK_JOB WHERE JOB_ID=@Jid AND HK_ID="+Session["HKID"].ToString();
            //Create a parametererized query for CatID
            cmd.Parameters.AddWithValue("@Jid", jobid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            getGridJob();
            if (IsDeleted)
            {
                lblMsg1.Text = "Application Cancelled!";
                lblMsg1.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridJob();
            }
            else
            {
                lblMsg1.Text = "Error while cancelling the application";
                lblMsg1.ForeColor = System.Drawing.Color.Red;
            }
            
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("../home.aspx");
        }
    }
    
}