using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Cust_registeration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\Gharkakhana\\App_Data\\Gharkakhana.mdf;Integrated Security=True;User Instance=True");
    public void clearall()
    {
        txt_name.Text = "";
        txt_phoneno.Text = "";
        txt_address.Text = "";
        txt_password.Text = "";
        
        txt_emailid.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible= false;
        if(Page.IsPostBack==true)
        {
            Label1.Text=("you are registered");

        }
    }
   
    protected void register_Click(object sender, EventArgs e)
    {
        con.Open();
        string instr = "insert into Cust_registeration values (@p1,@p2,@p3,@p4,@p5,@p6,@p7)";
        SqlCommand cmd = new SqlCommand(instr,con);

        cmd.Parameters.AddWithValue("@p1",txt_name.Text);
        cmd.Parameters.AddWithValue("@p2",txt_phoneno.Text);
        cmd.Parameters.AddWithValue("@p3",txt_address.Text);
        cmd.Parameters.AddWithValue("@p4",DropDownList_city.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@p5",txt_emailid.Text);
        cmd.Parameters.AddWithValue("@p6",txt_password.Text);
        cmd.Parameters.AddWithValue("@p7",DropDownList_role.SelectedValue.ToString());
        cmd.ExecuteNonQuery();
        Label1.Visible = true;
        clearall();
        Response.Redirect("login.aspx");
        con.Close();
    }
    protected void clear_Click(object sender, EventArgs e)
    {
        clearall();
    }
}