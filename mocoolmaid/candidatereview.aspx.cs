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
    public partial class candidatereview : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getCandidateDetail();
        }
        private void getCandidateDetail()
        {
            string HK_ID = Request.QueryString["HK_ID"];
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHOUSEKEEPER, TBLLOCATION WHERE TBLHOUSEKEEPER.LOCATION_ID=TBLLOCATION.LOCATION_ID AND HK_ID=" + HK_ID;
            con.Open();
            candetail.DataSource = cmd.ExecuteReader();
            candetail.DataBind();
            con.Close();
        }

        protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
        {
            Boolean IsUpdated = false;
            int hoid = Convert.ToInt32(Session["HOID"]);
            int hkid = Convert.ToInt32(Request.QueryString["HK_ID"]);
            int Rate = Convert.ToInt32(e.Value);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO TBLHKHO_REVIEWS (HO_ID, HK_ID, REVIEW_DESCRIPTION, COUNTER, REVIEW_DATEPOSTED) VALUES (@hoid, @hkid, @review, @counter, @date)";
            cmd.Parameters.AddWithValue("@counter", Rate);
            cmd.Parameters.AddWithValue("@hkid", hkid);
            cmd.Parameters.AddWithValue("@hoid", hoid);
            cmd.Parameters.AddWithValue("@date", DateTime.Today.ToString());
            cmd.Parameters.AddWithValue("@review", "Text");
            cmd.Connection = con;
            con.Open();
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = "Rating done successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getCandidateDetail();
            }
            else
            {
                lblMsg.Text = "Error while rating this candidate";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            //Response.Redirect("home.aspx");
        }

        protected void candetail_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label btndead = (Label)e.Item.FindControl("rating");
            String hk_id = Request.QueryString["HK_ID"];
            String ho_id = Session["HOID"].ToString();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLHKHO_REVIEWS WHERE HK_ID=@hkid AND HO_ID=@hoid";
            cmd.Parameters.AddWithValue("@hkid", hk_id);
            cmd.Parameters.AddWithValue("@hoid", ho_id);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                btndead.Visible = false;
            }
        }
    }
}