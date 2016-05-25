using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;

public partial class addpicture : System.Web.UI.Page
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
        string q = "insert into addproductpic values(@pid,@pic,@cid,@scid)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@pid", DropDownList3.SelectedValue);
        if (FileUpload1.HasFile)
        {
            mycomm.Parameters.AddWithValue("@pic", FileUpload1.FileName);
            FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
         }
        else
        {
            mycomm.Parameters.AddWithValue("@pic","default.png");
        }
        mycomm.Parameters.AddWithValue("@cid", DropDownList1.SelectedValue);
        mycomm.Parameters.AddWithValue("@scid", DropDownList2.SelectedValue);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            Label1.Text = "Picture added successfully";

        }
        else 
        {
            Label1.Text = "Picture not added successfully";
        }
        GridView1.DataBind();
        
    }
    protected void SqlDataSource4_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            Label2.Text = "No pictures added yet"; 
        }
        else
        {
            Label2.Text = "";  
        }
    }
}