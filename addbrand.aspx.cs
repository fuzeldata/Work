using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;

public partial class addbrand : System.Web.UI.Page
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
        string q = "insert into brand values(@bname,@bpic)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@bname", TextBox1.Text);
        if (FileUpload1.HasFile)
        {
            mycomm.Parameters.AddWithValue("@bpic", FileUpload1.FileName);
            FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
        }
        else
        {
            mycomm.Parameters.AddWithValue("@bpic", "na.jpg");
        }
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            Response.Write("<script>alert('Brand added Successfully')</script>");
        }
        else
        {
            Response.Write("<script>alert('Brand not added Successfully')</script>");
        }
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        FileUpload fileUpload = GridView1.Rows[e.RowIndex].Cells[0].FindControl("FileUpload2") as FileUpload;
        Label img = GridView1.Rows[e.RowIndex].Cells[0].FindControl("Label2") as Label;
        if (fileUpload.HasFile)
        {
            fileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath("uploads"), fileUpload.FileName));
            SqlDataSource1.UpdateParameters["BLogo"].DefaultValue = fileUpload.FileName;
        }
        else
        {
            SqlDataSource1.UpdateParameters["BLogo"].DefaultValue = img.Text;
        }
    }
}
   