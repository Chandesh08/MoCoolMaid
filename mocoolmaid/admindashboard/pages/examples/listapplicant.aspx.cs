using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.IO;

namespace mocoolmaid.admindashboard.pages.examples
{
    public partial class listapplicant : System.Web.UI.Page
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
            getJobName();
            getApplicantlist();
            session.Text = Session["HONAME"].ToString();
        }
        private void getJobName()
        {
            string JOB_ID = Request.QueryString["JOB_ID"];
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLJOB, TBLLOCATION, TBLCATEGORY WHERE TBLCATEGORY.CATEGORY_ID=TBLJOB.CATEGORY_ID AND TBLJOB.LOCATION_ID=TBLLOCATION.LOCATION_ID AND JOB_ID=" + JOB_ID;
            con.Open();
            jobdetail.DataSource = cmd.ExecuteReader();
            jobdetail.DataBind();
            con.Close();
        }
        private void getApplicantlist()
        {
            string JOB_ID = Request.QueryString["JOB_ID"];
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER, TBLHK_JOB, TBLJOB, TBLLOCATION WHERE TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND TBLHOUSEKEEPER.HK_ID=TBLHK_JOB.HK_ID AND TBLJOB.JOB_ID=TBLHK_JOB.JOB_ID AND TBLHK_JOB.JOB_ID=" + JOB_ID;
            con.Open();
            applicant.DataSource = cmd.ExecuteReader();
            applicant.DataBind();
            con.Close();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../../home.aspx");
        }

        protected void btnapply_Command(object sender, CommandEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Application Accepted');", true);

            string[] arg = new string[6];
            arg = e.CommandArgument.ToString().Split(';');
            String id = arg[0];
            String job = arg[1];
            String email = arg[2];
            String lname = arg[3];
            String fname = arg[4];
            String jobtitle = arg[5];
            String hofname = Session["HONAME"].ToString();
            String holname = Session["HOLNAME"].ToString();
            String hoemail = Session["HOEMAIL"].ToString();
            String district = Session["DISTRICT"].ToString();
            String town = Session["HOTOWN"].ToString();
            String street = Session["HOSTREET"].ToString();
            Boolean IsUpdated = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLHK_JOB SET JOB_STATUS=@status WHERE HK_JOB_ID=@hkjobid";
            cmd1.CommandText = "UPDATE TBLJOB SET JOB_STATUS=@status WHERE JOB_ID=@jobid";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@hkjobid", id);
            cmd.Parameters.AddWithValue("@status", "Accepted");
            cmd1.Parameters.AddWithValue("@jobid", job);
            cmd1.Parameters.AddWithValue("@status", "Occupied");
            cmd.Connection = con;
            cmd1.Connection = con;
            con.Open();
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            IsUpdated = cmd1.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = "Status updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                getApplicantlist();

                
                
                    //String filen = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    MailMessage m = new MailMessage();
                    SmtpClient sc = new SmtpClient();
                    try
                    {
                        m.From = new MailAddress("mocoolmaidcompany@gmail.com");
                        m.To.Add(email);
                        m.Subject = "MocoolMaid Application Receipt";
                        m.IsBodyHtml = true;
                        StringBuilder msgBody = new StringBuilder();
                        msgBody.Append("Dear " + fname + " " + lname + ", <br/> " + hofname + " " + holname + " informs you that your application for " + jobtitle + " has been accepted. We are looking forward to seeing you here. You are advised to attend an <b>Interview</b> on "+ DateTime.Now.AddDays(4).ToString("dddd, dd MMMM yyyy") + " 01:00 PM at " + street + " " + town + " " + district +".");
                        //m.Attachments.Add(new Attachment(Server.MapPath("~/Images/") +filen));
                        msgBody.Append("<hr/>");
                        msgBody.Append("<br/><i>You may contact " + hofname + " " + holname + " for more details</i>");
                        msgBody.Append("<br/><b>Email:</b> " + hoemail);
                        msgBody.Append("<br/><b>Location:</b> " + street + " " + town + " " + district);
                        msgBody.Append("<br/>From MoCoolMaid Company");
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
            else
            {
                lblMsg.Text = "Error while updating status";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btndecline_Command(object sender, CommandEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Application Decline');", true);
            string[] arg = new string[6];
            arg = e.CommandArgument.ToString().Split(';');
            String id = arg[0];
            String job = arg[1];
            String email = arg[2];
            String lname = arg[3];
            String fname = arg[4];
            String jobtitle = arg[5];
            String hofname = Session["HONAME"].ToString();
            String holname = Session["HOLNAME"].ToString();
            String hoemail = Session["HOEMAIL"].ToString();
            String district = Session["DISTRICT"].ToString();
            String town = Session["HOTOWN"].ToString();
            String street = Session["HOSTREET"].ToString();
            Boolean IsUpdated = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLHK_JOB SET JOB_STATUS=@status WHERE HK_JOB_ID=@hkjobid";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@hkjobid", id);
            cmd.Parameters.AddWithValue("@status", "Declined");
            cmd.Connection = con;
            con.Open();
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = "Status updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                getApplicantlist();


                MailMessage m = new MailMessage();
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.From = new MailAddress("mocoolmaidcompany@gmail.com");
                    m.To.Add(email);
                    m.Subject = "MocoolMaid Application Receipt";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + fname + " " + lname + ", <br/> " + hofname + " " + holname + " informs you that your application for " + jobtitle + " has been declined.");
                    //m.Attachments.Add(new Attachment(Server.MapPath("~/Images/") +filen));
                    msgBody.Append("<hr/>");
                    msgBody.Append("<br/><i>You may contact " + hofname + " " + holname + " for more details</i>");
                    msgBody.Append("<br/><b>Email:</b> " + hoemail);
                    msgBody.Append("<br/><b>Location:</b> " + street + " " + town + " " + district);
                    msgBody.Append("<br/>From MoCoolMaid Company");
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
            else
            {
                lblMsg.Text = "Error while updating status";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void applicant_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            String status = (String)(DataBinder.Eval(e.Item.DataItem, "JOB_STATUS"));
            Label stat = (Label)e.Item.FindControl("sta");
            LinkButton apply = (LinkButton)e.Item.FindControl("btnapply");
            LinkButton decline = (LinkButton)e.Item.FindControl("btndecline");
            if (status == "Accepted")
            {
                apply.Visible = false;
                decline.Visible = false;
                stat.ForeColor = System.Drawing.Color.Green;
            }
            else if (status == "Declined")
            {
                decline.Visible = false;
                apply.Visible = false;
                stat.ForeColor = System.Drawing.Color.Red;
            }
            else if(status == "On Hold")
            {
                stat.ForeColor = System.Drawing.Color.Yellow;
            }
        }
    }
}