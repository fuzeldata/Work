using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;using System.Configuration;
public partial class ordersummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string orderno = null;
            if (Session["un"] == null)
            {
                Response.Redirect("error.aspx");
            }
            else
            {
                Label2.Text = Session["tamt"].ToString();
                SqlConnection myconn, myconn1, myconn2;
                SqlCommand mycomm, mycomm1, mycomm2;
                myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                myconn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                myconn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);


                string q = "select * from ordertable where username=@un order by orderdate desc,ordertime desc";
                mycomm = new SqlCommand(q, myconn);
                mycomm.Parameters.AddWithValue("@un", Session["un"]);
                myconn.Open();
                SqlDataReader myreader = mycomm.ExecuteReader();

                if (myreader.HasRows)
                {
                    myreader.Read();
                    Label3.Text = myreader["orderno"].ToString();
                    orderno = myreader["orderno"].ToString();
                    Label4.Text = myreader["shippingaddress"].ToString();
                }
                myreader.Close();
                myreader.Dispose();
                myconn.Close();


                q = "select * from addcart where username=@un";
                mycomm = new SqlCommand(q, myconn);
                mycomm.Parameters.AddWithValue("@un", Session["un"]);
                myconn.Open();
                myreader = mycomm.ExecuteReader();
                if (myreader.HasRows)
                {
                    while (myreader.Read())
                    {
                        myconn1.Open();
                        string q2 = "update addsize set stock=stock-@st where pid=@pid";
                        mycomm1 = new SqlCommand(q2, myconn1);
                        mycomm1.Parameters.AddWithValue("@st", myreader["qty"].ToString());
                        mycomm1.Parameters.AddWithValue("@pid", myreader["productid"].ToString());
                        mycomm1.ExecuteNonQuery();
                        myconn1.Close();

                        myconn2.Open();
                        string q3 = "insert into addcart1 values(@orderno,@ppic,@pname,@rate,@qty,@size,@color,@brand,@total,@un,@pid)";
                        mycomm2 = new SqlCommand(q3, myconn2);
                        mycomm2.Parameters.AddWithValue("@orderno", Label3.Text);
                        mycomm2.Parameters.AddWithValue("@ppic", myreader["productpic"].ToString());
                        mycomm2.Parameters.AddWithValue("@pname", myreader["productname"].ToString());
                        mycomm2.Parameters.AddWithValue("@rate", myreader["rate"].ToString());
                        mycomm2.Parameters.AddWithValue("@qty", myreader["qty"].ToString());
                        mycomm2.Parameters.AddWithValue("@size", myreader["size"].ToString());
                        mycomm2.Parameters.AddWithValue("@color", myreader["color"].ToString());
                        mycomm2.Parameters.AddWithValue("@brand", myreader["brand"].ToString());
                        mycomm2.Parameters.AddWithValue("@total", myreader["total"].ToString());
                        mycomm2.Parameters.AddWithValue("@un", myreader["username"].ToString());
                        mycomm2.Parameters.AddWithValue("@pid", myreader["productid"].ToString());
                        mycomm2.ExecuteNonQuery();
                        myconn2.Close();
                    }

                }
                myreader.Close();
                myreader.Dispose();
                myconn.Close();


            }
            SqlCommand mycomm3;
            SqlConnection myconn3;
            myconn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            myconn3.Open();
            string q4 = "delete from addcart where username=@un";
            mycomm3 = new SqlCommand(q4, myconn3);
            mycomm3.Parameters.AddWithValue("un", Session["un"].ToString());
            mycomm3.ExecuteNonQuery();
            myconn3.Close();


            SqlCommand mycomm4;
            SqlConnection myconn4;
            myconn4 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            myconn4.Open();
            string q5 = "SELECT addcart1.productpic, addcart1.productname, addcart1.rate, addcart1.qty, addcart1.size, addcart1.total, addcart1.orderno, addcolor.colorname, addcart1.Brand FROM addcart1 INNER JOIN addcolor ON addcart1.Colour = addcolor.colorid WHERE (addcart1.orderno = @ono)";
            mycomm4 = new SqlCommand(q5, myconn4);
            mycomm4.Parameters.AddWithValue("@ono", orderno);

            SqlDataReader myreader6 = mycomm4.ExecuteReader();

            GridView1.DataSource = myreader6;
            GridView1.DataBind();
            myconn4.Close();


        }
    }
}