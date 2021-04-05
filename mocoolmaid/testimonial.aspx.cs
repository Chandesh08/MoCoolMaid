using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace mocoolmaid
{
    public partial class testimonial : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            int hoid = Convert.ToInt32(Session["HOID"]);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO TBLTESTIMONIAL (TESTIMONIAL_DESC, HO_ID) VALUES(@test, @hoid)";
            cmd.Parameters.AddWithValue("@test", txttestimonial.Text);
            cmd.Parameters.AddWithValue("@hoid", hoid);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}