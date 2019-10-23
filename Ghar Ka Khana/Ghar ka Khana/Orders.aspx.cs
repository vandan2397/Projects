using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Session["sessionname"].ToString();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text == "order_date")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Insert(0, "----select----");
            DropDownList2.DataSource = SqlDataSource1;
            DropDownList2.DataTextField = "order_date";
            DropDownList2.DataValueField = "order_date";
            DropDownList2.DataBind();

            

        }
        else if (DropDownList1.Text == "tiffin_type")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Insert(0, "----select----");
            DropDownList2.DataSource = SqlDataSource2;
            DropDownList2.DataTextField = "tiffin_type";
            DropDownList2.DataValueField = "tiffin_type";
            DropDownList2.DataBind();

            

        }
        else if (DropDownList1.Text == "cust_email")
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Insert(0, "----select----");
            DropDownList2.DataSource = SqlDataSource3;
            DropDownList2.DataTextField = "cust_email";
            DropDownList2.DataValueField = "cust_email";
            DropDownList2.DataBind();

            

        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.Text == "order_date")
        {
            GridView2.DataSource = SqlDataSource5;
            GridView2.DataBind();
        }
        else if (DropDownList1.Text == "order_type")
        {
            GridView2.DataSource = SqlDataSource6;
            GridView2.DataBind();
        }
        else if (DropDownList1.Text == "cust_email")
        {
            GridView2.DataSource = SqlDataSource7;
            GridView2.DataBind();
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
     
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
}