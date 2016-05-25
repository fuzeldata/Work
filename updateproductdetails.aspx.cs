using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
using System.IO;
public partial class updateproductdetails : System.Web.UI.Page
{
    string cid, scid, bid;
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
            string q = "select * from addproduct where productid=@pid";
            mycomm = new SqlCommand(q, myconn);
            mycomm.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
            myconn.Open();
            SqlDataReader myreader = mycomm.ExecuteReader();
            if (myreader.HasRows)
            {
                myreader.Read();
                TextBox1.Text = myreader["productname"].ToString();
                TextBox2.Text = myreader["rate"].ToString();
                TextBox3.Text = myreader["description"].ToString();
                Image2.ImageUrl = "uploads/" + myreader["productimage"].ToString();
                cid = myreader["catid"].ToString();
                scid = myreader["subcatid"].ToString();
                bid = myreader["brandid"].ToString();
            }
            myreader.Close();
            myreader.Dispose();
            myconn.Close();
        }
    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        DropDownList2.Items.FindByValue(cid).Selected = true;
    }
    protected void DropDownList3_DataBound(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            DropDownList3.Items.FindByValue(scid).Selected = true;
        }
    }
    protected void DropDownList4_DataBound(object sender, EventArgs e)
    {
        DropDownList4.Items.FindByValue(bid).Selected = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "update addproduct set productname=@pname,catid=@cid,subcatid=@scid,brandid=@bid,description=@des,rate=@rate,productimage=@pimg where productid=@pid";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@pname", TextBox1.Text);
        mycomm.Parameters.AddWithValue("@cid", DropDownList2.SelectedValue);
        mycomm.Parameters.AddWithValue("@scid", DropDownList3.SelectedValue);
        mycomm.Parameters.AddWithValue("@bid", DropDownList4.SelectedValue);
        mycomm.Parameters.AddWithValue("@des",TextBox3.Text);
        mycomm.Parameters.AddWithValue("@rate", TextBox2.Text);
        if (FileUpload1.HasFile)
        {
            mycomm.Parameters.AddWithValue("@pimg", FileUpload1.FileName);
            FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
            Image2.ImageUrl = "uploads/" + FileUpload1.FileName;
        }
        else
        {
            mycomm.Parameters.AddWithValue("@pimg", Path.GetFileName(Image2.ImageUrl));
        }
        mycomm.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        if (res == 1)
        {
            Label2.Text = "Product Updated Successfully";
        }
        else
        {
            Label2.Text = "Product not updated successfully";
        }

        myconn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateproduct.aspx");
    }
}
    
