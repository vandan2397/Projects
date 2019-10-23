using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Cust_order : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\Gharkakhana\\App_Data\\Gharkakhana.mdf;Integrated Security=True;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        txt_date.Enabled = false;
        txt_items.Enabled = false;
        txt_total.Enabled = false;

        Label2.Text = Session["sessionname"].ToString();

        txt_date.Text = DateTime.Now.AddDays(+1).ToShortDateString();

        if (IsPostBack == false)
        {
            con.Open();
            string str = "select tiffin_id,tiffin_type,tiffin_items from Tiffin";
            SqlCommand cmd = new SqlCommand(str,con);
            DropDownList_type.DataSource = cmd.ExecuteReader();
            DropDownList_type.DataTextField = "tiffin_type";
            DropDownList_type.DataValueField = "tiffin_id";
            DropDownList_type.DataBind();
            con.Close();
        }

        con.Open();
        string instr = "select tiffn_price from Tiffin where tiffin_type='" +DropDownList_type.SelectedItem+ "'";
        SqlCommand cmd6 = new SqlCommand(instr,con);
        Int32 a = Convert.ToInt32(cmd6.ExecuteScalar());
        Int32 b = Convert.ToInt32(DropDownList_nooftifffins.SelectedValue);

        Int32 c = a * b;
        txt_total.Text = c.ToString();
        con.Close();

        txt_session.Text = Session["sessionname"].ToString();

        con.Open();
        string cname = "select cust_name from Cust_registeration where cust_email='" + txt_session.Text + "' ";
        SqlCommand cmd2 = new SqlCommand(cname,con);
        string unm = cmd2.ExecuteScalar().ToString();
        txt_name.Text=unm.ToString();
        con.Close();

        con.Open();
        string cadd = "select cust_address from Cust_registeration where cust_email='" + txt_session.Text + "' ";
        SqlCommand cmd3 = new SqlCommand(cadd, con);
        string uadd = cmd3.ExecuteScalar().ToString();
        txt_address.Text = uadd.ToString();
        con.Close();

        con.Open();
        string cphone = "select cust_phone from Cust_registeration where cust_email='" + txt_session.Text + "' ";
        SqlCommand cmd4 = new SqlCommand(cphone, con);
        string uphone = cmd4.ExecuteScalar().ToString();
        txt_phone.Text = uphone.ToString();
        con.Close();

        if (Page.IsPostBack== true)
        {
            Label1.Text="Your order is placed";
        }
    }
    
    protected void order_Click(object sender, EventArgs e)
    {
        con.Open();
        string str = "insert into Cust_order values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10)";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.Parameters.AddWithValue("@p1", txt_date.Text);
        cmd.Parameters.AddWithValue("@p2", DropDownList_type.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@p3", txt_items.Text);
        cmd.Parameters.AddWithValue("@p4", DropDownList_nooftifffins.Text);
        cmd.Parameters.AddWithValue("@p5", txt_time.Text);
        cmd.Parameters.AddWithValue("@p6", txt_total.Text);
        cmd.Parameters.AddWithValue("@p7", txt_session.Text);
        cmd.Parameters.AddWithValue("@p8", txt_name.Text);
        cmd.Parameters.AddWithValue("@p9", txt_address.Text);
        cmd.Parameters.AddWithValue("@p10", txt_phone.Text);
        cmd.ExecuteNonQuery();
        Label1.Visible = true;
        con.Close();
    }
    protected void DropDownList_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select tiffin_items from Tiffin where tiffin_type=@p1",con);
        cmd.Parameters.AddWithValue("@p1",DropDownList_type.SelectedItem.ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txt_items.Text = ds.Tables[0].Rows[0].ItemArray[0].ToString();
        }
        con.Close();
    }
}