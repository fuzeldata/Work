using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;

public partial class addsize : System.Web.UI.Page
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
        string q = "insert into addsize values(@cid,@scid,@pid,@colorid,@size,@stock)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@cid",DropDownList1.SelectedValue.ToString());
        mycomm.Parameters.AddWithValue("@scid", DropDownList2.SelectedValue.ToString());
        mycomm.Parameters.AddWithValue("@pid", DropDownList3.SelectedValue.ToString());
        mycomm.Parameters.AddWithValue("@colorid", DropDownList4.SelectedValue.ToString());
        mycomm.Parameters.AddWithValue("@size",TextBox1.Text);
        mycomm.Parameters.AddWithValue("@stock", TextBox2.Text);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            Label1.Text = "Size added successfully";
        }
        else
        {
            Label1.Text = "error in adding size";
        }
        GridView1.DataBind();
    }
}