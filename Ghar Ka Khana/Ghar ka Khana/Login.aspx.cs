using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\Gharkakhana\\App_Data\\Gharkakhana.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void clear_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Cust_registeration where cust_email='" +txt_emailid.Text.Trim()+ "' and cust_password='" +txt_password.Text.Trim()+ "' ",con);
        SqlDataReader r = cmd.ExecuteReader();
        r.Read();
        if (r.HasRows)
        {
            if (r["cust_role"].ToString() == "admin")
            {
                Label1.Text = "login successful";
                Session["sessionname"] = txt_emailid.Text;
                Session["sessiontype"] = "admin";
                Response.Redirect("Admin_regsiteration.aspx");
                 Session.RemoveAll();
                con.Close();
            }
            else if (r["cust_role"].ToString() == "user")
            {
                Label1.Text = "login successful";
                 Session["sessionname"] = txt_emailid.Text;
                Session["sessiontype"] = "user";
                Response.Redirect("Cust_order.aspx");
                 Session.RemoveAll();
                con.Close();
            }
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "EmailId or Password Incorrect";
        }
    }
}