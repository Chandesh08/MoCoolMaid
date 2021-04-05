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
    public partial class hkhome : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getCategorylist();
            getLoctionlist();
            getGridCategory();
            getGridJob();
            getCarouselCan();
            getTestimonialcarou();
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
        private void getTestimonialcarou()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER, TBLTESTIMONIAL WHERE TBLHOUSEOWNER.HO_ID=TBLTESTIMONIAL.HO_ID";
            con.Open();
            testimonial.DataSource = cmd.ExecuteReader();
            testimonial.DataBind();
            con.Close();
        }
        private void getGridCategory()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT CATEGORY_NAME FROM TBLCATEGORY";
            con.Open();
            categorygrid.DataSource = cmd.ExecuteReader();
            categorygrid.DataBind();
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
            cmd.CommandText = "SELECT JOB_ID, JOB_TITLE, JOB_TYPE, DEADLINE_DATE, POSTED_DATE, JOB_STATUS, DISTRICT_NAME FROM TBLJOB, TBLLOCATION WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID";
            con.Open();
            joblist.DataSource = cmd.ExecuteReader();
            joblist.DataBind();
            con.Close();
        }
        private void getCarouselCan()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER";
            con.Open();
            candidatecarou.DataSource = cmd.ExecuteReader();
            candidatecarou.DataBind();
            con.Close();
        }

        protected void joblist_ItemDataBound(object sender, RepeaterItemEventArgs e)
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