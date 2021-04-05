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
    public partial class hodashboard : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HOID"] == null && Session["HONAME"] == null)
            {
                Response.Redirect("../hologin.aspx");
            }
            if (!IsPostBack)
            {
                getLoctionlist();
                ListItem li = new ListItem("Select Location", "-1");
                loclist.Items.Insert(0, li);
                session.Text = Session["HONAME"].ToString();
                
                form();
            }
            getHouseOwnerList();
            getGridJob();
            session.Text = Session["HONAME"].ToString();
        }
        private void getHouseOwnerList()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER, TBLLOCATION WHERE TBLHOUSEOWNER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HO_ID="+Session["HOID"].ToString();
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
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION WHERE TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HO_ID=" + Session["HOID"].ToString();
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
            cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER WHERE HO_ID=" + Session["HOID"].ToString();
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            dr.Read();
            lname.Text = dr["HO_LNAME"].ToString();
            fname.Text = dr["HO_FNAME"].ToString();
            pnum.Text = dr["HO_PHONE_NUMBER"].ToString();
            email.Text = dr["HO_EMAIL"].ToString();
            street.Text = dr["HO_STREET"].ToString();
            town.Text = dr["HO_TOWN"].ToString();
            loclist.SelectedIndex = Convert.ToInt32(dr["LOCATION_ID"]);
            pass.Text = dr["HO_PASSWORD"].ToString();
            cpass.Text = dr["HO_PASSWORD"].ToString();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Boolean IsUpdated = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLHOUSEOWNER SET HO_LNAME=@lname, HO_FNAME=@fname, HO_PHONE_NUMBER=@pnum, HO_EMAIL=@email, HO_STREET=@street, HO_TOWN=@town, HO_PASSWORD=@pass, LOCATION_ID=@loc WHERE HO_ID=" + Session["HOID"].ToString();
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@fname", fname.Text);
            cmd.Parameters.AddWithValue("@lname", lname.Text);
            cmd.Parameters.AddWithValue("@pnum", pnum.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@street", street.Text);
            cmd.Parameters.AddWithValue("@town", town.Text);
            cmd.Parameters.AddWithValue("@pass", cpass.Text);
            cmd.Parameters.AddWithValue("@loc", loclist.SelectedValue.ToString());
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

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("../home.aspx");
        }

        protected void jobdetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HyperLink btn = (HyperLink)e.Item.FindControl("jobid");
            Label btndead = (Label)e.Item.FindControl("app");
            String status = (String)(DataBinder.Eval(e.Item.DataItem, "JOB_STATUS"));
            if(status == "Occupied")
            {
                btn.Visible = false;
                btndead.Visible = true;
                btndead.Text = "This job is already occupied by a candidate.";
            }
        }
    }
}