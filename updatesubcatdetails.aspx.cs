using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
using System.IO;
public partial class updatesubcatdetails : System.Web.UI.Page
{
    string cid;
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
           
            string q = "select * from addsubcat where subcatid=@scid";
            mycomm = new SqlCommand(q, myconn);
            mycomm.Parameters.AddWithValue("@scid", Request.QueryString["scid"]);
            myconn.Open();
            SqlDataReader myreader = mycomm.ExecuteReader();
            if (myreader.HasRows)
            {
                myreader.Read();
                TextBox1.Text = myreader["subcatname"].ToString();
                Image2.ImageUrl = "uploads/" + myreader["subcatpic"].ToString();
                cid = myreader["catid"].ToString();

            }
            myreader.Close();
            myreader.Dispose();
            myconn.Close();
        }
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        DropDownList1.Items.FindByValue(cid).Selected = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "update addsubcat set subcatname=@scname,catid=@cid,subcatpic=@scpic where subcatid=@scid";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@scname", TextBox1.Text);
        mycomm.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue);

        if (FileUpload1.HasFile)
        {
            mycomm.Parameters.AddWithValue("@scpic", FileUpload1.FileName);
            FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
            Image2.ImageUrl = "uploads/" + FileUpload1.FileName;
        }
        else
        {
            mycomm.Parameters.AddWithValue("@scpic", Path.GetFileName(Image2.ImageUrl));
        }
        mycomm.Parameters.AddWithValue("@scid", Request.QueryString["scid"]);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        if (res == 1)
        {
            Label2.Text = "SubCategory Updated Successfully";
        }
        else
        {
            Label2.Text = "SubCategory not updated successfully";
        }

        myconn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("updatesubcat.aspx");
    }
}