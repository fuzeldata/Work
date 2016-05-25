using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null || Session["ut"] != "admin")
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("addcat.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("addsubcat.aspx");
    }
    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        Response.Redirect("addproduct.aspx");
    }
    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        Response.Redirect("addpicture.aspx");
    }
    protected void LinkButton15_Click(object sender, EventArgs e)
    {
        Response.Redirect("addsize.aspx");
    }
    protected void LinkButton16_Click(object sender, EventArgs e)
    {
        Response.Redirect("updatesubcat.aspx");
    }
    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        Response.Redirect("addbrand.aspx");
    }
    protected void LinkButton18_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateproduct.aspx");
    }
    protected void LinkButton19_Click(object sender, EventArgs e)
    {
        Response.Redirect("displaycolor.aspx");
    }
    protected void LinkButton20_Click(object sender, EventArgs e)
    {
        Response.Redirect("vieworders.aspx");
    }
    protected void LinkButton21_Click(object sender, EventArgs e)
    {
        Response.Redirect("addstock.aspx");
    }
    protected void LinkButton22_Click(object sender, EventArgs e)
    {
        Response.Redirect("nostock.aspx");
    }
    protected void LinkButton23_Click(object sender, EventArgs e)
    {
        Response.Redirect("addcoupon.aspx");
    }
}