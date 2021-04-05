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
    public partial class adminlogin : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["ADU"] != null && Request.Cookies["ADP"] != null)
                {
                    AdUsername = Request.Cookies["ADU"].Value;
                    Adpassword = Request.Cookies["ADP"].Value;
                }
            }
        }
        public string AdUsername
        {
            get { return adusername.Text; }
            set { adusername.Text = value; }
        }
        public string Adpassword
        {
            get { return adpass.Text; }
            set { adpass.Text = value; }
        }
        public bool Adcheck
        {
            get { return adcc.Checked; }
            set { adcc.Checked = value; }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
           // get the value of username and password fields and state of checkbox from
                //login form
            string username = AdUsername;
            string password = Adpassword;
            bool chk = Adcheck;
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //searching for a record containing matching username & password with
            //an active status
            cmd.CommandText = "SELECT * FROM TBLADMIN WHERE ADMIN_USERNAME=@un AND ADMIN_PASSWORD=@pass";
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
                    Response.Cookies["ADU"].Value = username;
                    Response.Cookies["ADP"].Value = password;
                    if (chk)
                    {
                        //if checkbox is checked, make cookies persistent
                        Response.Cookies["ADU"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["ADP"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        Response.Cookies["ADU"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["ADP"].Expires = DateTime.Now.AddDays(100);
                        //delete content of password field
                    }
                    //check if role type is admin or user - optional
                    //create and save username in a session variable
                    //create and save userid in a session variable
                    Session["ADID"] = dr["AMIN_ID"];
                    Session["ADNAME"] = dr["ADMIN_FNAME"];
                    //redirect to the corresponding page
                    Response.Redirect("admindashboard/addashboard.aspx");
                }
                con.Close();
            }
            else
            {
                //delete content of password field
                lblmsg.Text = "You are not registered or your account has been suspended!"+password+username;

            }
        }
    }
}