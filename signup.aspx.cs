using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
using System.Data;
public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            SqlConnection myconn;
            SqlCommand mycomm;
             myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            mycomm = new SqlCommand("signup1", myconn);
            mycomm.CommandType = CommandType.StoredProcedure;
            mycomm.Parameters.AddWithValue("@un", TextBox6.Text);
            myconn.Open();
            SqlDataReader myreader = mycomm.ExecuteReader();
            if (myreader.HasRows)
            {
                Label1.Text = "Email ID already registered";
                myconn.Close();
                myreader.Close();
                myreader.Dispose();
            }
            else
            {
                myreader.Close();
                myreader.Dispose();
               // q = "insert into signup values(@n,@add,@ct,@st,@ph,@un,@p,@img,@gender,@country,@sq,@sa,@ut)";
                mycomm = new SqlCommand("signup2", myconn);
                mycomm.CommandType = CommandType.StoredProcedure;
                mycomm.Parameters.AddWithValue("@n", TextBox1.Text);
                mycomm.Parameters.AddWithValue("@add", TextBox2.Text);
                mycomm.Parameters.AddWithValue("@ct", TextBox3.Text);
                mycomm.Parameters.AddWithValue("@st", TextBox4.Text);
                mycomm.Parameters.AddWithValue("@ph", TextBox5.Text);
                mycomm.Parameters.AddWithValue("@un", TextBox6.Text);
                mycomm.Parameters.AddWithValue("@p", TextBox7.Text);
                if (FileUpload1.HasFile)
                {
                    mycomm.Parameters.AddWithValue("@img", FileUpload1.FileName);
                    FileUpload1.SaveAs(MapPath("uploads/" + FileUpload1.FileName));
                }
                else
                {
                    mycomm.Parameters.AddWithValue("@img", "default.png");
                }
                mycomm.Parameters.AddWithValue("@gender", RadioButtonList1.SelectedItem.ToString());
                mycomm.Parameters.AddWithValue("@country", DropDownList1.SelectedItem.Text);
                mycomm.Parameters.AddWithValue("@sq", DropDownList2.SelectedItem.Text);
                mycomm.Parameters.AddWithValue("@sa", TextBox11.Text);
                mycomm.Parameters.AddWithValue("@ut", "normal");
                int res = mycomm.ExecuteNonQuery();
                myconn.Close();
                if (res == 1)
                {
                    Response.Redirect("thx.aspx");
                }
                else
                {
                    Label1.Text = "Signup not successful, please try again";
                }
            }
        }
    }
  
}