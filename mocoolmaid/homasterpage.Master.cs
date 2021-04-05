using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mocoolmaid
{
    public partial class homasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HOID"] == null && Session["HONAME"] == null)
            {
                Response.Redirect("hologin.aspx");
            }
            honame.Text = Session["HONAME"].ToString();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session["HONAME"] != null)
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("home.aspx");
            }
        }
    }
}