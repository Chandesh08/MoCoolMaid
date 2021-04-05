using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace mocoolmaid
{
    public partial class hologin : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["houn"] != null && Request.Cookies["hopwd"] != null)
                {
                    hoUsername = Request.Cookies["houn"].Value;
                    hopassword = Request.Cookies["hopwd"].Value;
                }
            }
        }
        public string hoUsername
        {
            get { return houser.Text; }
            set { houser.Text = value; }
        }
        public string hopassword
        {
            get { return hopwd.Text; }
            set { hopwd.Text = value; }
        }
        public bool hocheck
        {
            get { return cc.Checked; }
            set { cc.Checked = value; }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            //get the value of username and password fields and state of checkbox from
            //login form
            string username = hoUsername;
            string password = hopassword;
            bool chk = hocheck;
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //searching for a record containing matching username & password with
            //an active status
            cmd.CommandText = "SELECT * FROM TBLHOUSEOWNER, TBLLOCATION WHERE TBLHOUSEOWNER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HO_USERNAME=@un AND HO_PASSWORD=@pass AND HO_STATUS='Active'";
            //create three parameterized query for the above select statement
            //use above variables and decrypt password
            cmd.Parameters.AddWithValue("@un", username);
            cmd.Parameters.AddWithValue("@pass", password);
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            // check if the DataReader contains a record
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    //create a memory cookie to store username and pwd
                    Response.Cookies["houn"].Value = username;
                    Response.Cookies["hopwd"].Value = password;
                    if (chk)
                    {
                        //if checkbox is checked, make cookies persistent
                        Response.Cookies["houn"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["hopwd"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        Response.Cookies["houn"].Expires = DateTime.Now.AddDays(-100);
                        Response.Cookies["hopwd"].Expires = DateTime.Now.AddDays(-100);
                        //delete content of password field
                    }
                    //check if role type is admin or user - optional
                    //create and save username in a session variable
                    //create and save userid in a session variable
                    Session["HOID"] = dr["HO_ID"];
                    Session["HONAME"] = dr["HO_FNAME"];
                    Session["HOLNAME"] = dr["HO_LNAME"];
                    Session["HOEMAIL"] = dr["HO_EMAIL"];
                    Session["DISTRICT"] = dr["DISTRICT_NAME"];
                    Session["HOSTREET"] = dr["HO_STREET"];
                    Session["HOTOWN"] = dr["HO_TOWN"];
                    //redirect to the corresponding page
                    Response.Redirect("hohome.aspx");
                }
                con.Close();
            }
            else
            {
                //delete content of password field
                lblmsg.Text = "You are not registered or your account has been suspended!";

            }
        }
    }
}