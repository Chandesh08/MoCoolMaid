using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;
//using System.Web.Configuration;
//using System.Data.SqlClient;
//using System.Text;
using System.IO;
using System.Security.Cryptography;
//using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace mocoolmaid
{
    public partial class registerho : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getLoctionlist();
                ListItem li = new ListItem("Select Location", "-1");
                holocation.Items.Insert(0, li);
            }
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
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create DataSet
            DataSet ds = new DataSet();
            //Fill the Dataset and ensure the DB Connection is closed
            using (da)
            {
                da.Fill(ds);
            }
            //To load country names in dropdown
            holocation.DataSource = ds;
            //assign a field name to ddl
            holocation.DataTextField = "DISTRICT_NAME";
            holocation.DataValueField = "LOCATION_ID";
            holocation.DataBind();

        }

        protected void clearbtn_Click(object sender, EventArgs e)
        {
            hofname.Text = "";
            holname.Text = "";
            hophone.Text = "";
            hoemail.Text = "";
            hostreet.Text = "";
            hotown.Text = "";
            holocation.SelectedIndex = 0;
            houser.Text = "";
            hopass.Text = "";
        }

        protected void hkregister_Click(object sender, EventArgs e)
        {
            //Check whether the fileupload contains a file
            if (hophoto.HasFile)
            {
                if (CheckFileType(hophoto.FileName))
                {
                    String filen = Path.GetFileName(hophoto.PostedFile.FileName);
                    hophoto.PostedFile.SaveAs(Server.MapPath("~/img/") +
                    filen);
                    // Create Connection
                    SqlConnection con = new SqlConnection(_conString);
                    // Create Command
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    //search for username from tbluser
                    cmd.CommandText = "SELECT HK_USERNAME FROM TBLHOUSEKEEPER WHERE HK_USERNAME=@un";
                    cmd.Connection = con;
                    //create a parameterized query
                    cmd.Parameters.AddWithValue("@un", houser.Text);
                    //Create DataReader
                    SqlDataReader dr;
                    con.Open();
                    dr = cmd.ExecuteReader();
                    //Check if username already exists in the DB
                    if (dr.HasRows)
                    {
                        lblmsg.Text = "Username Already Exist, Please Choose Another";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                        houser.Focus();
                    }
                    else
                    {
                        //Ensure the DataReader is closed
                        dr.Close();
                        //int loc = hklocation.SelectedIndex;
                        // Create another Command object to store insert statement
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.Connection = con;
                        cmd1.CommandText = "INSERT INTO TBLHOUSEOWNER(HO_LNAME, HO_FNAME, HO_PHONE_NUMBER, HO_EMAIL, HO_STREET, HO_TOWN, HO_STATUS, HO_PICTURE, HO_USERNAME, HO_PASSWORD, LOCATION_ID) " +
                        "VALUES(@lname, @fname, @phone, @email, @street, @town, @status, @photo, @username, @pwd, @location)";
                        cmd1.Parameters.AddWithValue("@fname", hofname.Text);
                        cmd1.Parameters.AddWithValue("@lname", holname.Text);
                        cmd1.Parameters.AddWithValue("@phone", hophone.Text);
                        cmd1.Parameters.AddWithValue("@email", hoemail.Text);
                        cmd1.Parameters.AddWithValue("@street", hostreet.Text);
                        cmd1.Parameters.AddWithValue("@town", hotown.Text);
                        cmd1.Parameters.AddWithValue("@location", holocation.SelectedItem.Value);
                        cmd1.Parameters.AddWithValue("@username", houser.Text);
                        cmd1.Parameters.AddWithValue("@photo", "img/" + filen);

                        //add a method to encrypt your password
                        cmd1.Parameters.AddWithValue("@pwd", hopass.Text);
                        //set the status to active or inactive
                        cmd1.Parameters.AddWithValue("@status", "Active");
                        cmd1.CommandType = CommandType.Text;
                        cmd1.ExecuteNonQuery();
                        //call the sendemail method
                        sendemail();
                        con.Close();
                        Response.Redirect("hologin.aspx");
                    }
                }
            }
        }
        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }
        private void sendemail()
        {
            //String filen = Path.GetFileName(FileUpload1.PostedFile.FileName);
            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            try
            {
                m.From = new MailAddress("mocoolmaidcompany@gmail.com");
                m.To.Add(hoemail.Text);
                m.Subject = "MocoolMaid HouseOwner Registration";
                m.IsBodyHtml = true;
                StringBuilder msgBody = new StringBuilder();
                msgBody.Append("Dear " + hofname.Text + " " + holname.Text + ", your registration is successful. We are looking forward to seeing you here and sharing our inbound marketing with you.");
                //m.Attachments.Add(new Attachment(Server.MapPath("~/Images/") +filen));
                msgBody.Append("From MoCoolMaid Company");
                m.Body = msgBody.ToString();
                sc.Host = "smtp.gmail.com";
                sc.Port = 587;
                sc.UseDefaultCredentials = false;
                sc.Credentials = new
                System.Net.NetworkCredential("mocoolmaidcompany@gmail.com", "mocoolmaid");
                sc.EnableSsl = true;
                sc.Send(m);
                Response.Write("Email Sent successfully");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}