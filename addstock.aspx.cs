using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
public partial class addstock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null || Session["ut"] != "admin")
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "update addsize set stock=stock+@stock where sizeid=@size";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@stock", TextBox2.Text);
        mycomm.Parameters.AddWithValue("@size", DropDownList5.SelectedValue.ToString());

        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            Label1.Text = "Stock added successfully";
        }
        else
        {
            Label1.Text = "error in adding size";
        }
    }
    }