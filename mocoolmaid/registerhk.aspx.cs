using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Net.Mail;

namespace mocoolmaid
{
    public partial class registerhk : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getLoctionlist();
                ListItem li = new ListItem("Select Location", "-1");
                hklocation.Items.Insert(0, li);
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
            hklocation.DataSource = ds;
            //assign a field name to ddl
            hklocation.DataTextField = "DISTRICT_NAME";
            hklocation.DataValueField = "LOCATION_ID";
            hklocation.DataBind();
           
        }

        protected void clearbtn_Click(object sender, EventArgs e)
        {
            hkfname.Text = "";
            hklname.Text = "";
            hkage.Text = "";
            hkphone.Text = "";
            hkemail.Text = "";
            hkstreet.Text = "";
            hktown.Text = "";
            hklocation.SelectedIndex = 0;
            hkskill.Text = "";
            hkcertificate.Text = "";
            hkhquali.Text = "";
            hkcategory.Text = "";
            hkuser.Text = "";
            hkpass.Text = "";
            textbox.Text = "";
        }

        protected void hkregister_Click(object sender, EventArgs e)
        {
            //Check whether the fileupload contains a file
            if (hkphoto.HasFile && hkcv.HasFile)
            {
                if (CheckFileType(hkphoto.FileName) && CheckFileType1(hkcv.FileName))
                {
                    String filen = Path.GetFileName(hkphoto.PostedFile.FileName);
                    hkphoto.PostedFile.SaveAs(Server.MapPath("~/img/") +
                    filen);

                    string customfolder = "files/" + hkemail.Text +"/doc/";
                    string folderPath = Server.MapPath(customfolder);
                    Directory.CreateDirectory(folderPath);
                    hkcv.SaveAs(folderPath + hkcv.FileName);

                    // Create Connection
                    SqlConnection con = new SqlConnection(_conString);
                    // Create Command
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    //search for username from tbluser
                    cmd.CommandText = "SELECT HK_USERNAME FROM TBLHOUSEKEEPER WHERE HK_USERNAME=@un";
                    cmd.Connection = con;
                    //create a parameterized query
                    cmd.Parameters.AddWithValue("@un", hkuser.Text);
                    //Create DataReader
                    SqlDataReader dr;
                    con.Open();
                    dr = cmd.ExecuteReader();
                    //Check if username already exists in the DB
                    if (dr.HasRows)
                    {
                        lblmsg.Text = "Username Already Exist, Please Choose Another";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                        hkuser.Focus();
                    }
                    else
                    {
                        //Ensure the DataReader is closed
                        dr.Close();
                        //int loc = hklocation.SelectedIndex;
                        // Create another Command object to store insert statement
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.Connection = con;
                        cmd1.CommandText = "INSERT INTO TBLHOUSEKEEPER(HK_LNAME, HK_FNAME, HK_PHONE_NUMBER, HK_EMAIL, HK_STREET, HK_TOWN, HK_STATUS, HK_SKILLS, HK_PICTURE, AGE, CV, CERTIFICATE, HIGHEST_QUALIFICATION, HK_CATEGORY, HK_USERNAME, HK_PASSWORD, LOCATION_ID) " +
                        "VALUES(@lname, @fname, @phone, @email, @street, @town, @status, @skill, @photo, @age, @cv, @certificate, @hihestcer, @category, @username, @pwd, @location)";
                        cmd1.Parameters.AddWithValue("@fname", hkfname.Text);
                        cmd1.Parameters.AddWithValue("@lname", hklname.Text);
                        cmd1.Parameters.AddWithValue("@age", hkage.Text);
                        cmd1.Parameters.AddWithValue("@phone", hkphone.Text);
                        cmd1.Parameters.AddWithValue("@email", hkemail.Text);
                        cmd1.Parameters.AddWithValue("@street", hkstreet.Text);
                        cmd1.Parameters.AddWithValue("@town", hktown.Text);
                        cmd1.Parameters.AddWithValue("@location", hklocation.SelectedItem.Value);
                        cmd1.Parameters.AddWithValue("@skill", hkskill.Text);
                        cmd1.Parameters.AddWithValue("@certificate", hkcertificate.Text);
                        cmd1.Parameters.AddWithValue("@hihestcer", hkhquali.Text);
                        cmd1.Parameters.AddWithValue("@category", hkcategory.Text);
                        cmd1.Parameters.AddWithValue("@username", hkuser.Text);
                        cmd1.Parameters.AddWithValue("@photo", "img/"+filen);
                        cmd1.Parameters.AddWithValue("@cv", customfolder + hkcv.FileName);
                        //add a method to encrypt your password
                        cmd1.Parameters.AddWithValue("@pwd", hkpass.Text);
                        //set the status to active or inactive
                        cmd1.Parameters.AddWithValue("@status", "Active");
                        cmd1.CommandType = CommandType.Text;
                        cmd1.ExecuteNonQuery();
                        //call the sendemail method
                        sendemail();
                        con.Close();
                        Response.Redirect("login.aspx");
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
        bool CheckFileType1(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".doc":
                    return true;
                case ".docx":
                    return true;
                case ".pdf":
                    return true;
                case ".ppt":
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
                m.To.Add(hkemail.Text);
                m.Subject = "MocoolMaid HouseKeeper Registration";
                m.IsBodyHtml = true;
                StringBuilder msgBody = new StringBuilder();
                msgBody.Append("Dear " + hkfname.Text + " " + hklname.Text + ", your registration is successful. We are looking forward to seeing you here and sharing our inbound marketing with you.");
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