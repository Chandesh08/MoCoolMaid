using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace mocoolmaid.admindashboard.pages.examples
{
    public partial class addlocation : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["MoCoolMaidCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADID"] == null && Session["ADNAME"] == null)
            {
                Response.Redirect("../../../adminlogin.aspx");
            }
            session.Text = Session["ADNAME"].ToString();
            getGridCat();
        }
        private void ResetAll()
        {
            addloc.Visible = true;
            lbl.Text = "";
            txttinputcat.Text = "";
        }
        private void getGridCat()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM TBLLOCATION";
            con.Open();
            locgrid1.DataSource = cmd.ExecuteReader();
            locgrid1.DataBind();
            con.Close();
        }

        protected void btnselectloc_Command(object sender, CommandEventArgs e)
        {
            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');
            String catID = arg[0];
            String catName = arg[1];

            lbl.Text = catID;
            txttinputcat.Text = catName;
            addloc.Visible = false;
        }

        protected void cancel1_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        protected void addloc_Click(object sender, EventArgs e)
        {
            String LocName = txttinputcat.Text.Trim();
            // Create Connection
            SqlConnection dcon = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.Text;
            //search for username from tbluser
            cmd1.CommandText = "SELECT DISTRICT_NAME FROM TBLLOCATION WHERE DISTRICT_NAME=@loc";
            cmd1.Connection = dcon;
            //create a parameterized query
            cmd1.Parameters.AddWithValue("@loc", LocName);
            //Create DataReader
            SqlDataReader dr;
            dcon.Open();
            dr = cmd1.ExecuteReader();
            //Check if username already exists in the DB
            if (dr.HasRows)
            {
                lblMsg.Text = "District Name Already Exist";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Focus();
            }
            else
            {
                //Ensure the DataReader is closed
                dr.Close();

                Boolean IsAdded = false;
                //Add built-in function to remove spaces from Textbox Category name

                SqlConnection con = new SqlConnection(_conString);
                SqlCommand cmd = new SqlCommand();
                //add INSERT statement to create new category name
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO TBLLOCATION (DISTRICT_NAME) VALUES (@Lname)";
                //create Parameterized query to prevent sql injection by
                cmd.Parameters.AddWithValue("@Lname", LocName);
                //using above String name
                cmd.Connection = con;
                con.Open();
                //use Command method to execute INSERT statement and return
                if (string.IsNullOrWhiteSpace(txttinputcat.Text))
                {
                    lblMsg.Text = "Please enter a location name in the text box below ";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                //Boolean true if number of records inserted is greater than zero
                IsAdded = cmd.ExecuteNonQuery() > 0;
                con.Close();
                if (IsAdded)
                {
                    lblMsg.Text = LocName + " location added successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    //Refresh the GridView by calling the BindCategoryData()
                    getGridCat();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Location added');", true);
                }
                else
                {
                    lblMsg.Text = "Error while adding " + LocName + " location";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
                ResetAll();
            }
        }
        protected void updateloc_Click(object sender, EventArgs e)
        {
            //check whether the categoryid textbox is empty
            if (string.IsNullOrWhiteSpace(txttinputcat.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            int LocID = Convert.ToInt32(lbl.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String LocName = txttinputcat.Text.Trim();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLLOCATION SET DISTRICT_NAME=@lname WHERE LOCATION_ID=@lid";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@lname", LocName);
            cmd.Parameters.AddWithValue("@lid", LocID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = LocName + " location updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridCat();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Location Updated');", true);
            }
            else
            {
                lblMsg.Text = "Error while updating " + LocName + " location";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            //Ensure that no rows are selected in Gridview by changing the EditIndex
            ResetAll();
        }

        protected void delete1_Click(object sender, EventArgs e)
        {
            //check whether the categoryid textbox is empty
            if (string.IsNullOrWhiteSpace(txttinputcat.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            int LocID = Convert.ToInt32(lbl.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String LocName = txttinputcat.Text.Trim();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected category for the above CatID
            cmd.CommandText = "DELETE FROM TBLLOCATION WHERE LOCATION_ID=@Lid";
            //Create a parametererized query for CatID
            cmd.Parameters.AddWithValue("@Lid", LocID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = LocName + " location deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridCat();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Location Deleted');", true);
            }
            else
            {
                lblMsg.Text = "Error while deleting " + LocName + " Location";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            if (Session["ADNAME"] != null)
            {
                Session.RemoveAll();
                Session.Abandon();
                Response.Redirect("../../../home.aspx");
            }
        }
    }
}
