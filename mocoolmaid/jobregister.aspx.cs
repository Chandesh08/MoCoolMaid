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
    public partial class jobregister : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getLoctionlist();
                getCategorylist();
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Boolean IsUpdated = false;

            //Add UPDATE statement to update category name for the above CatID
            String updatesql = "INSERT INTO TBLJOB (JOB_TITLE, JOB_DESCRIPTION, SALARY, JOB_STATUS, JOB_TYPE, SKILLS_REQUIRED, DEADLINE_DATE, JOB_RESPONSIBILITY, JOB_GENDER, EXPERIENCE_REQUIRED, WORKING_HOURS, LOCATION_ID, CATEGORY_ID, POSTED_DATE, HO_ID)" +
                "VALUES(@title, @desc, @salary, @status, @jobtype, @skill, @ddate, @jrespon, @gender, @erequired, @whours, @loc, @cat, @pdate, @hoid)";
            SqlConnection dcon = new SqlConnection(_conString);
            SqlCommand cmd1 = new SqlCommand(updatesql, dcon);
            //Create two parameterized queries [CatID and CatName]
            cmd1.Parameters.AddWithValue("@title", jobtitle.Text);
            cmd1.Parameters.AddWithValue("@desc", jobdesc.Text);
            cmd1.Parameters.AddWithValue("@jobtype", jobtype.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@gender", genderlist.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@salary", salary.Text);
            cmd1.Parameters.AddWithValue("@ddate", ddate.Text);
            cmd1.Parameters.AddWithValue("@status", "Vacant");
            cmd1.Parameters.AddWithValue("@skill", skill.Text);
            cmd1.Parameters.AddWithValue("@jrespon", jobres.Text);
            cmd1.Parameters.AddWithValue("@erequired", exrequired.Text);
            cmd1.Parameters.AddWithValue("@whours", whours.Text);
            cmd1.Parameters.AddWithValue("@loc", loc.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@cat", cat.SelectedValue.ToString());
            cmd1.Parameters.AddWithValue("@pdate", DateTime.Today);
            cmd1.Parameters.AddWithValue("@hoid", Session["HOID"].ToString());
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
            }
            else
            {
                lblMsg.Text = "Error while updating records";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}