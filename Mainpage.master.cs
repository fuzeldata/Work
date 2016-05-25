using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
public partial class Mainpage : System.Web.UI.MasterPage

{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null)
        {
            Label1.Text = "Guest";
            LinkButton4.Visible = true;
            LinkButton1.Visible = true;
        }
        else
        {
            Label1.Text = Session["nm"].ToString(); //reading from session
            LinkButton2.Visible = true;
            LinkButton3.Visible = true;
            LinkButton5.Visible = true;
            if (Session["ut"].ToString() == "admin")
            {
                LinkButton6.Visible = true;
            }
        }
        if (Session["un"] != null)
        {
            SqlConnection myconn;
            SqlCommand mycomm;
            myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            string q = "select count(cartid) as cnt from addcart where username=@un";
            mycomm = new SqlCommand(q, myconn);
            mycomm.Parameters.AddWithValue("@un", Session["un"].ToString());
            myconn.Open();
            SqlDataReader myreader;
            myreader = mycomm.ExecuteReader();
            if (myreader.HasRows)
            {
                myreader.Read();
                if (Session["ut"] == "normal")
                {
                    LinkButton4.Visible = true;
                    LinkButton4.Text = "Show Cart(" + myreader["cnt"].ToString() + ")";
                }
                else
                {
                    LinkButton4.Text = "";

                }
            }
            else
            {
                LinkButton4.Visible = true;
            }
        }
        StringBuilder htmlTable = new StringBuilder();
        SqlConnection myconn1, myconn2;
        SqlCommand mycomm1, mycomm2;
        myconn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        myconn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q1 = "select * from addcat";
        mycomm1 = new SqlCommand(q1, myconn1);
        myconn1.Open();
        SqlDataReader myreader1;
        myreader1 = mycomm1.ExecuteReader();
        if (myreader1.HasRows)
        {
            while (myreader1.Read())
            {
                htmlTable.Append("<li class='grid'><a class='color1' href='displaysubcategory.aspx?cid=" + myreader1["catid"].ToString() + "'>" + myreader1["catname"].ToString() + "</a>");
                string q2 = "select * from addsubcat where catid=@catid";
                mycomm2 = new SqlCommand(q2, myconn2);
                mycomm2.Parameters.AddWithValue("@catid", myreader1["catid"].ToString());
                myconn2.Open();
                SqlDataReader myreader2;
                myreader2 = mycomm2.ExecuteReader();
                if (myreader2.HasRows)
                {
                   htmlTable.Append("<div class='megapanel'>");
					htmlTable.Append("<div class='row'>");
					
							htmlTable.Append("<div class='h_nav'>");
                    htmlTable.Append("<ul>");
                    while (myreader2.Read())
                    {
                        htmlTable.Append("<li><a  href='displayproducts.aspx?scid=" + myreader2["subcatid"].ToString() + "'>" + myreader2["subcatname"].ToString() + "</a></li>");
                    }
                    htmlTable.Append("</ul>");
                     
                     htmlTable.Append("</div>");
                     htmlTable.Append("</div>");
                     htmlTable.Append("</div>");

                }
                htmlTable.Append("</li>");
                myreader2.Close();
                myreader2.Dispose();
                myconn2.Close();
            }
        }
        myreader1.Close();
        myreader1.Dispose();
        myconn1.Close();
        PlaceHolder1.Controls.Add(new Literal { Text = htmlTable.ToString() });
    }
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("default8.aspx");
    }
    protected void LinkButton3_Click1(object sender, EventArgs e)
    {

        Response.Redirect("changepassword.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("globalsearch.aspx?s=" + TextBox1.Text);
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (Session["un"] == null)
        {
            LinkButton4.Text = "Sign Up";
            Response.Redirect("signup.aspx");
        }
        else
        {
            Response.Redirect("addcart.aspx");
        }

    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("orderhistory.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminpanel.aspx");
    }
}

