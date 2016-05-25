using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;

public partial class recoverpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "select * from signup where username=@un";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@un", TextBox1.Text);
        myconn.Open();
        SqlDataReader myreader = mycomm.ExecuteReader();
        if (myreader.HasRows)
        {
            Label5.Text = "";
            Panel1.Visible = true;
            myreader.Read();
            Label2.Text = myreader["sq"].ToString();
            Panel3.Visible=false;
        }
        else
        {
            Panel1.Visible = false;
            Label5.Text = "Invalid Username";
        }
        myconn.Close();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
        myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "select * from signup where username=@un and sa=@sa";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@un", TextBox1.Text);
        mycomm.Parameters.AddWithValue("@sa", TextBox2.Text);
        myconn.Open();
        SqlDataReader myreader = mycomm.ExecuteReader();
        if (myreader.HasRows)
        {
            Label3.Text = "";
            Panel2.Visible = true;
            myreader.Read();
            Label2.Text = myreader["sq"].ToString();
            Panel1.Visible = false;
        }
        else
        {
            Label3.Text = "Incorrect security answer";
        }
        myconn.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
        myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "update signup set password=@p where username=@un";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@un", TextBox1.Text);
        mycomm.Parameters.AddWithValue("@p", TextBox4.Text);
        myconn.Open();
        mycomm.ExecuteNonQuery();
        Label4.Text = "Password reset successfull, please login with new password";
        myconn.Close();
    }
}