using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
public partial class checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
          
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q="insert into ordertable values(@tcost,@un,@ship_add,@pay_mode,@holder_name,@card_no,@Company,@exp_date,@order_date,@status,@ot)";
        mycomm=new SqlCommand(q,myconn);
        mycomm.Parameters.AddWithValue("@tcost",Session["tamt"]);
        mycomm.Parameters.AddWithValue("@un",Session["un"]);
        mycomm.Parameters.AddWithValue("@ship_add",TextBox4.Text);
        mycomm.Parameters.AddWithValue("@pay_mode",RadioButtonList1.SelectedItem.ToString());
        if(RadioButtonList1.SelectedItem.ToString()=="Cash on Delivery")
        {
        
             mycomm.Parameters.AddWithValue("@holder_name","Null");
             mycomm.Parameters.AddWithValue("@card_no","null");
             mycomm.Parameters.AddWithValue("@company","null");
             mycomm.Parameters.AddWithValue("@exp_date","null");
             mycomm.Parameters.AddWithValue("@order_date",DateTime.Now);
             mycomm.Parameters.AddWithValue("@status","Processing");
             mycomm.Parameters.AddWithValue("@ot", DateTime.Now.TimeOfDay);
        
        }
        else{
        
             mycomm.Parameters.AddWithValue("@holder_name",TextBox2.Text);
             mycomm.Parameters.AddWithValue("@card_no",TextBox3.Text);
             mycomm.Parameters.AddWithValue("@company",DropDownList1.SelectedItem.Text);
             mycomm.Parameters.AddWithValue("@exp_date",DropDownList2.SelectedItem.Text+"/"+DropDownList3.SelectedItem.Text);
             mycomm.Parameters.AddWithValue("@order_date",DateTime.Now.Date);
             mycomm.Parameters.AddWithValue("@status","Processing");
             mycomm.Parameters.AddWithValue("@ot", DateTime.Now.TimeOfDay);
             }
        myconn.Open();
        mycomm.ExecuteNonQuery();
        myconn.Close();
          Response.Redirect("ordersummary.aspx");
        
    }   
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 1)
        {
            Panel1.Visible = true;

            
        }
        else
        {
     
      
            Panel1.Visible = false;
        }
    }
}