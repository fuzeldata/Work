using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class vieworders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null || Session["ut"] != "admin")
        {
            Response.Redirect("error.aspx");
        }

        if (Page.IsPostBack == false)
        {
            Calendar1.SelectedDate = DateTime.Now.Date;
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList mydrpdwn = GridView1.Rows[e.RowIndex].Cells[5].FindControl("DropDownList1") as DropDownList;
        SqlDataSource1.UpdateParameters["Status"].DefaultValue = mydrpdwn.SelectedItem.Text;
      
    }
    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            Label2.Text = "No orders for this date";
        }
        else
        {
            Label2.Text = "";
        }
    }
}