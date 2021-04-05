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
    public partial class addcategory : System.Web.UI.Page
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
            addcat.Visible = true;
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
            cmd.CommandText = "SELECT * FROM TBLCATEGORY";
            con.Open();
            catgrid1.DataSource = cmd.ExecuteReader();
            catgrid1.DataBind();
            con.Close();
        }
        protected void btnselect_Command(object sender, CommandEventArgs e)
        {
            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');
            String catID = arg[0];
            String catName = arg[1];

            lbl.Text = catID;
            txttinputcat.Text = catName;
            addcat.Visible = false;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        protected void addcat_Click(object sender, EventArgs e)
        {
            
            String CatName = txttinputcat.Text.Trim();
            // Create Connection
            SqlConnection dcon = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.Text;
            //search for username from tbluser
            cmd1.CommandText = "SELECT CATEGORY_NAME FROM TBLCATEGORY WHERE CATEGORY_NAME=@cat";
            cmd1.Connection = dcon;
            //create a parameterized query
            cmd1.Parameters.AddWithValue("@cat", CatName);
            //Create DataReader
            SqlDataReader dr;
            dcon.Open();
            dr = cmd1.ExecuteReader();
            //Check if username already exists in the DB
            if (dr.HasRows)
            {
                lblMsg.Text = "Category Name Already Exist";
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
                cmd.CommandText = "INSERT INTO TBLCATEGORY (CATEGORY_NAME) VALUES (@cname)";
                //create Parameterized query to prevent sql injection by
                cmd.Parameters.AddWithValue("@cname", CatName);
                //using above String name
                cmd.Connection = con;
                con.Open();
                //use Command method to execute INSERT statement and return
                if (string.IsNullOrWhiteSpace(txttinputcat.Text))
                {
                    lblMsg.Text = "Please enter a category name in the text box below ";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                //Boolean true if number of records inserted is greater than zero
                IsAdded = cmd.ExecuteNonQuery() > 0;
                con.Close();
                if (IsAdded)
                {
                    lblMsg.Text = CatName + " category added successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    //Refresh the GridView by calling the BindCategoryData()
                    getGridCat();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Category added');", true);
                }
                else
                {
                    lblMsg.Text = "Error while adding " + CatName + " category";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
                ResetAll();
            }   
        }

        protected void updatecat_Click(object sender, EventArgs e)
        {
            //check whether the categoryid textbox is empty
            if (string.IsNullOrWhiteSpace(txttinputcat.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            int CatID = Convert.ToInt32(lbl.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String CatName = txttinputcat.Text.Trim();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update category name for the above CatID
            cmd.CommandText = "UPDATE TBLCATEGORY SET CATEGORY_NAME=@cname WHERE CATEGORY_ID=@cid";
            //Create two parameterized queries [CatID and CatName]
            cmd.Parameters.AddWithValue("@cname", CatName);
            cmd.Parameters.AddWithValue("@cid", CatID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0 ;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = CatName + " category updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridCat();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Category Updated');", true);
            }
            else
            {
                lblMsg.Text = "Error while updating " + CatName + " category";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            //Ensure that no rows are selected in Gridview by changing the EditIndex
            ResetAll();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            //check whether the categoryid textbox is empty
            if (string.IsNullOrWhiteSpace(txttinputcat.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            int CatID = Convert.ToInt32(lbl.Text);
            //Add built-in function to remove spaces from Textbox Category name
            String CatName = txttinputcat.Text.Trim();
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected category for the above CatID
            cmd.CommandText = "DELETE FROM TBLCATEGORY WHERE CATEGORY_ID=@cid";
            //Create a parametererized query for CatID
            cmd.Parameters.AddWithValue("@cid", CatID);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = CatName + " category deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindCategoryData()
                getGridCat();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Category Deleted');", true);
            }
            else
            {
                lblMsg.Text = "Error while deleting " + CatName + " category";
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