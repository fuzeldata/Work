using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
using System.Text;
public partial class detailsp : System.Web.UI.Page
{
    StringBuilder htmlTable = new StringBuilder();
    StringBuilder htmlTable2 = new StringBuilder();
    string pic;
    protected void Page_Load(object sender, EventArgs e)
    {
        double dis=0,orgcost = 0;
        SqlConnection myconn,myconn1;
        SqlCommand mycomm,mycomm1;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
         myconn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "SELECT addproduct.rate, addproduct.description, addproduct.productimage, addproduct.productid, addproduct.productname, addproduct.discount, brand.BName FROM addproduct INNER JOIN brand ON addproduct.brandid = brand.BID WHERE (addproduct.productid = @pid)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
        myconn.Open();
        SqlDataReader myreader = mycomm.ExecuteReader();
        if (myreader.HasRows)
        {
            myreader.Read();
            Label5.Text = myreader["productname"].ToString();
            Label7.Text = myreader["rate"].ToString();
            orgcost = Convert.ToDouble(myreader["rate"].ToString());
            dis = Convert.ToDouble(myreader["discount"].ToString());
            Label8.Text = "(" + myreader["discount"].ToString() + "% Discount)";
            Label4.Text = myreader["bname"].ToString();
            Label3.Text = myreader["description"].ToString();
            pic = myreader["productimage"].ToString();
          // htmlTable.Append("<img class='my-foto' src='uploads/" + myreader["productimage"].ToString() + "' data-large='uploads/" + myreader["productimage"].ToString() + "' width='300' height='375'>");
        }

        double namt = orgcost- ((dis * orgcost) / 100);
        Label2.Text = Math.Truncate(namt).ToString();

      
      //  PlaceHolder1.Controls.Add(new Literal { Text = htmlTable.ToString() });


        q = "select * from addproductpic where pid=@pid";
        mycomm1 = new SqlCommand(q, myconn1);
        mycomm1.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
        myconn1.Open();
        SqlDataReader articleReader = mycomm1.ExecuteReader();
        if (articleReader.HasRows)
        {
           
            while (articleReader.Read())
            {
                htmlTable2.Append("<li>");
                htmlTable2.Append("<img class='etalage_thumb_image' src='uploads/" + articleReader["pic"].ToString() + "' class='img-responsive'/>");
                htmlTable2.Append("<img class='etalage_source_image' src='uploads/" + articleReader["pic"].ToString() + "' class='img-responsive' title='' />");
                htmlTable2.Append("</li>");
            }
            PlaceHolder1.Controls.Add(new Literal { Text = htmlTable2.ToString() });
            myconn1.Close();
            articleReader.Close();
            articleReader.Dispose();
        }
        else
        {
            htmlTable2.Append("<li>");
            htmlTable2.Append("<img class='etalage_thumb_image' src='uploads/" + myreader["productimage"].ToString() + "' class='img-responsive'/>");
            htmlTable2.Append("<img class='etalage_source_image' src='uploads/" + myreader["productimage"].ToString() + "' class='img-responsive' title='' />");
            htmlTable2.Append("</li>");
            PlaceHolder1.Controls.Add(new Literal { Text = htmlTable2.ToString() });
        }
        myreader.Close();
        myreader.Dispose();
        myconn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["un"] != null)
        {
            int stock;
            stock = Convert.ToInt32(Label6.Text);
            int r, q, tcost;
            r = Convert.ToInt32(Label2.Text);
            q = Convert.ToInt32(DropDownList2.SelectedValue);
            tcost = r * q;
            if (q > stock)
            {
                Label9.Text = "Quantity your are buying is not available in stock,please change your quantity";
            }
            else
            {
                SqlConnection myconn;
                SqlCommand mycomm;
                 myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                string s = "insert into addcart values(@pic,@pname,@rate,@qt,@size,@color,@brand,@total,@un,@pid)";
                mycomm = new SqlCommand(s, myconn);
                mycomm.Parameters.AddWithValue("@pic", pic);
                mycomm.Parameters.AddWithValue("@pname", Label5.Text);
                mycomm.Parameters.AddWithValue("@rate", Label2.Text);
                mycomm.Parameters.AddWithValue("@qt", DropDownList2.SelectedItem.ToString());
                mycomm.Parameters.AddWithValue("@size", ListBox1.SelectedItem.ToString());
                mycomm.Parameters.AddWithValue("@color", DropDownList1.SelectedValue);
                mycomm.Parameters.AddWithValue("@brand", Label4.Text);
                mycomm.Parameters.AddWithValue("@total", tcost);
                mycomm.Parameters.AddWithValue("@un", Session["un"].ToString());
                mycomm.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                myconn.Open();
                mycomm.ExecuteNonQuery();
                myconn.Close();
                Response.Redirect("addcart.aspx");

            }
        }
        else
        {
            Response.Redirect("login.aspx?returnurl=detailsp.aspx?pid=" + Request.QueryString["pid"]);
        }
    }
   
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int stock;   
        SqlConnection myconn;
        SqlCommand mycomm;
         myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "select * from addsize where pid=@pid and colorid=@coid and size=@sz";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
        mycomm.Parameters.AddWithValue("@coid", DropDownList1.SelectedValue);
        mycomm.Parameters.AddWithValue("@sz", ListBox1.SelectedValue);
        myconn.Open();
        SqlDataReader myreader = mycomm.ExecuteReader();
        if (myreader.HasRows)
        {
            myreader.Read();
        
            stock = Convert.ToInt32(myreader["stock"].ToString());
            if (stock <= 0)
            {
                Button1.Enabled = false;
                Label6.Text = "Out of Stock";
            }
            else
            {
                Button1.Enabled = true;
                Label6.Text = stock.ToString();
            }
        }
        myreader.Close();
        myreader.Dispose();
        myconn.Close();
    }
}
    
