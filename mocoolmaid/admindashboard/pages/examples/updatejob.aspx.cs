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
    public partial class updatejob : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["HONAME"] != null)
            //{
            //    Session.RemoveAll();
            //    Session.Abandon();
            //    Response.Redirect("../../../home.aspx");
            //}
            if (!IsPostBack)
            {
                getLoctionlist();
                getCategorylist();
                form();
            }
            session.Text = Session["HONAME"].ToString();
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
            cat.DataSource = cmd.ExecuteReader();
            cat.DataTextField = "CATEGORY_NAME";
            cat.DataValueField = "CATEGORY_ID";
            cat.DataBind();
            ListItem li = new ListItem("Select Category", "-1");
            cat.Items.Insert(0, li);
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
        private void form()
        {
            String id = Request.QueryString["JOB_ID"].ToString();
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLJOB WHERE JOB_ID=@jobid";
            cmd.Parameters.AddWithValue("@jobid", id);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();
            title.Text = dr["JOB_TITLE"].ToString();
            desc.Text= dr["JOB_DESCRIPTION"].ToString();
            jobtype.SelectedValue = dr["JOB_TYPE"].ToString();
            genderlist.SelectedValue = dr["JOB_GENDER"].ToString();
            salary.Text = dr["SALARY"].ToString();
            ddate.Text = dr["DEADLINE_DATE"].ToString();
            status.SelectedValue= dr["JOB_STATUS"].ToString();
            skill.Text = dr["SKILLS_REQUIRED"].ToString();
            jrespon.Text = dr["JOB_RESPONSIBILITY"].ToString();
            erequired.Text = dr["EXPERIENCE_REQUIRED"].ToString();
            whours.Text = dr["WORKING_HOURS"].ToString();
            loc.SelectedValue = dr["LOCATION_ID"].ToString();
            cat.SelectedValue = dr["CATEGORY_ID"].ToString();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            String jobid = Request.QueryString["JOB_ID"].ToString();
            Boolean IsUpdated = false;
            
            //Add UPDATE statement to update category name for the above CatID
            String updatesql = "UPDATE TBLJOB SET JOB_TITLE=@title, JOB_DESCRIPTION=@desc, SALARY=@salary, JOB_STATUS=@status, JOB_TYPE=@jobtype, SKILLS_REQUIRED=@skill, DEADLINE_DATE=@ddate, JOB_RESPONSIBILITY=@jrespon, JOB_GENDER=@gender, EXPERIENCE_REQUIRED=@erequired, WORKING_HOURS=@whours, LOCATION_ID=@loc, CATEGORY_ID=@cat WHERE JOB_ID=@jobid";
            SqlConnection dcon = new SqlConnection(_conString);
            SqlCommand cmd1 = new SqlCommand(updatesql, dcon);
            //Create two parameterized queries [CatID and CatName]
            cmd1.Parameters.AddWithValue("@title", title.Text);
            cmd1.Parameters.AddWithValue("@desc", desc.Text);
            cmd1.Parameters.AddWithValue("@jobtype", jobtype.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@gender", genderlist.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@salary", salary.Text);
            cmd1.Parameters.AddWithValue("@ddate", ddate.Text);
            cmd1.Parameters.AddWithValue("@status", status.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@skill", skill.Text);
            cmd1.Parameters.AddWithValue("@jrespon", jrespon.Text);
            cmd1.Parameters.AddWithValue("@erequired", erequired.Text);
            cmd1.Parameters.AddWithValue("@whours", whours.Text);
            cmd1.Parameters.AddWithValue("@loc", loc.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@cat", cat.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@jobid", jobid);
            cmd1.Connection = dcon;
            dcon.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd1.ExecuteNonQuery() > 0;
            dcon.Close();
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

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../../home.aspx");
        }
    }
    }