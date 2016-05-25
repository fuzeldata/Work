using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
using System.IO;
public partial class updatecatdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null || Session["ut"] != "admin")
        {
            Response.Redirect("error.aspx");
        }
        if (Page.IsPostBack == false)
        {
            SqlConnection myconn;
            SqlCommand mycomm;
             myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            string q = "select * from addcat where catid=@cid";
            mycomm = new SqlCommand(q, myconn);
            mycomm.Parameters.AddWithValue("@cid", Request.QueryString["cid"]);
            myconn.Open();
            SqlDataReader myreader = mycomm.ExecuteReader();
            if (myreader.HasRows)
            {
                myreader.Read();
                TextBox1.Text = myreader["catname"].ToString();
                Image2.ImageUrl = "uploads/" + myreader["catpic"].ToString();

            }
            myreader.Close();
            myreader.Dispose();
            myconn.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "update addcat set catname=@cname,catpic=@cpic where catid=@cid";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@cname", TextBox1.Text);


        if (FileUpload1.HasFile)
        {
            mycomm.Parameters.AddWithValue("@cpic", FileUpload1.FileName);
            FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
            Image2.ImageUrl = "uploads/" + FileUpload1.FileName;
        }
        else
        {
            mycomm.Parameters.AddWithValue("@cpic", Path.GetFileName(Image2.ImageUrl));
        }
        mycomm.Parameters.AddWithValue("@cid", Request.QueryString["cid"]);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        if (res == 1)
        {
            Label2.Text = "Category Updated Successfully";
        }
        else
        {
            Label2.Text = "Category not updated successfully";
        }

        myconn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("addcat.aspx");
    }
}