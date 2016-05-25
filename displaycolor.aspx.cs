using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;

public partial class displaycolor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "insert into addcolor values(@colorname)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@colorname", TextBox1.Text);
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            Label1.Text = "Color added successfully";
            TextBox1.Text = "";
        }
        else
        {
            Label1.Text = "Error in adding color";
        }
        GridView1.DataBind();
    }
}