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
    public partial class login : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["un"] != null && Request.Cookies["pwd"] != null)
                {
                    hkusername = Request.Cookies["un"].Value;
                    hkpassword = Request.Cookies["pwd"].Value;
                }
            }
        }
        public string hkusername
        {
            get { return hkuser.Text; }
            set { hkuser.Text = value; }
        }
        public string hkpassword
        {
            get { return hkpwd.Text; }
            set { hkpwd.Text = value; }
        }
        public bool check
        {
            get { return cc.Checked; }
            set { cc.Checked = value; }
        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            //get the value of username and password fields and state of checkbox from
            //login form
            string username = hkusername;
            string password = hkpassword;
            bool chk = check;
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //searching for a record containing matching username & password with
            //an active status
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER WHERE HK_USERNAME=@un AND HK_PASSWORD=@pass AND HK_STATUS='Active'";
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
                    Response.Cookies["un"].Value = username;
                    Response.Cookies["pwd"].Value = password;
                    if (chk)
                    {
                        //if checkbox is checked, make cookies persistent
                        Response.Cookies["un"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        Response.Cookies["un"].Expires = DateTime.Now.AddDays(-100);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-100);
                        //delete content of password field
                    }
                    //check if role type is admin or user - optional
                    //create and save username in a session variable
                    Session["HKNAME"] = dr["HK_FNAME"];
                    //create and save userid in a session variable
                    Session["HKID"] = dr["HK_ID"];
                    //redirect to the corresponding page
                    Response.Redirect("hkhome.aspx");
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