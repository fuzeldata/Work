using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
public partial class changepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null)
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "update signup set password=@newp where username=@uname and password=@oldp";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@newp", TextBox2.Text);
        mycomm.Parameters.AddWithValue("@uname", Session["un"].ToString());
        mycomm.Parameters.AddWithValue("@oldp", TextBox1.Text);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();

        if (res == 1)
        {
            Label2.Text = "Password changed successfully";
        }
        else
        {
            Label2.Text = "Current password Incorrect";
        }
    }
}