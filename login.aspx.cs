using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
using System.Data;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        //string q = "select * from signup where username=@un and password=@p";
        mycomm = new SqlCommand("login", myconn);
        mycomm.CommandType = CommandType.StoredProcedure;
        mycomm.Parameters.AddWithValue("@un", TextBox1.Text);
        mycomm.Parameters.AddWithValue("@p", TextBox2.Text);
        myconn.Open();
        SqlDataReader myreader = mycomm.ExecuteReader();
        if(myreader.HasRows)
        {
            myreader.Read();
            Session.Add("nm", myreader["name"].ToString());
            Session.Add("un", TextBox1.Text); //writing into the session

            if (myreader["usertype"].ToString() == "admin")
            {
                Session.Add("ut", "admin");
                myreader.Close();
                myreader.Dispose();
                myconn.Close();
                Response.Redirect("adminpanel.aspx");
            }
            else
            {
                Session.Add("ut", "normal");
                 myreader.Close();
                 myreader.Dispose();
                 myconn.Close();

                 if (Request.QueryString["returnurl"] != null)
                 {
                     Response.Redirect(Request.QueryString["returnurl"]);
                 }
                 else
                 {
                     Response.Redirect("displaycategory.aspx");
                 }
            }
        }
        else
        {
            myconn.Close();
            Label1.Text = "Incorrect Username/Password";
        }
        
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("recoverpass.aspx");
    }
}