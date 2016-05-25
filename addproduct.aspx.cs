using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
public partial class addproduct : System.Web.UI.Page
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
        string q = "insert into addproduct values(@pname,@catid,@subcatid,@bid,@rate,@desc,@pimg,@dis)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@pname", TextBox1.Text);
        mycomm.Parameters.AddWithValue("@catid", DropDownList1.SelectedValue);
        mycomm.Parameters.AddWithValue("@subcatid", DropDownList2.SelectedValue);
        mycomm.Parameters.AddWithValue("@bid", DropDownList3.SelectedValue);
        mycomm.Parameters.AddWithValue("@rate", TextBox2.Text);
        mycomm.Parameters.AddWithValue("@desc", Editor1.Content);
        if (FileUpload1.HasFile)
        {
            mycomm.Parameters.AddWithValue("@pimg", FileUpload1.FileName);
            FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
        }
        else
        {
            mycomm.Parameters.AddWithValue("@pimg", "no-photo.jpg");
        }
        mycomm.Parameters.AddWithValue("@dis", TextBox4.Text);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            Response.Write("<script>alert('Product added Successfully')</script>");
        }
        else
        {
            Response.Write("<script>alert('Product not added Successfully')</script>");
        }
       
    }
}