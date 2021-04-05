using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mocoolmaid
{
    public partial class hkmasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HKID"] == null && Session["HKNAME"] == null)
            {
                Response.Redirect("login.aspx");
            }
            honame.Text = Session["HKNAME"].ToString();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session["HKNAME"] != null)
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("home.aspx");
            }
        }
    }
}