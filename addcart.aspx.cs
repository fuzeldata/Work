using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;

public partial class addcart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["un"] == null)
        {
           // Response.Redirect("error.aspx");
        }
        else
        {
            fetchtotal();
           
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Label2.Font.Strikeout == true)
        {
            Session.Add("tamt", Label4.Text);
        }
        else
        {
            Session.Add("tamt", Label2.Text);
        }
        Response.Redirect("checkout.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("displaycategory.aspx");
    }

    void fetchtotal()
    {
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string q = "Select sum(total) from addcart where username=@un";
        mycomm = new SqlCommand(q, myconn);
        myconn.Open();
        mycomm.Parameters.AddWithValue("@un", Session["un"]);
        Object ans = mycomm.ExecuteScalar();

        Label2.Text = ans.ToString();
        myconn.Close();

    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
    
        Response.Redirect("addcart.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection myconn;
        SqlCommand mycomm;
        myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);

        string q = "Select * from addcoupon where couponname=@cname";
        mycomm = new SqlCommand(q, myconn);
        myconn.Open();
        mycomm.Parameters.AddWithValue("@cname", TextBox2.Text);

        SqlDataReader myreader = mycomm.ExecuteReader();

        double cvalue = Convert.ToDouble(Label2.Text);
        double cper = 0, minvalue=0,namt=0;
        if (myreader.HasRows)
        {
            myreader.Read();
            cper = Convert.ToDouble(myreader["couponpercent"].ToString());
            minvalue = Convert.ToDouble(myreader["mincartvalue"].ToString());

            if (cvalue >= minvalue)
            {
                namt =cvalue -  (cper * cvalue) / 100;
                Label2.Font.Strikeout = true;
                Label4.Text = Math.Truncate(namt).ToString();
                Label3.Text = "Coupon applied successfully";
            }
            else
            {
                Label3.Text = "Cart value must be £ " + minvalue + " to apply this coupon";
                Label4.Text = "";
                Label2.Font.Strikeout = false;
                Label2.Text = cvalue.ToString();
            }
        }
        else
        {
            Label3.Text = "Invalid Coupon Code";
            Label4.Text = "";
            Label2.Font.Strikeout = false;
            Label2.Text = cvalue.ToString();
        }

        myconn.Close();
    }
}