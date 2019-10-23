using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Tiffin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=D:\\Gharkakhana\\App_Data\\Gharkakhana.mdf;Integrated Security=True;User Instance=True");
    public void clearall()
    {
       txt_type.Text = "";
       txt_price.Text = "";
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = Session["sessionname"].ToString();
        Label1.Visible = false;
        if (Page.IsPostBack == true)
        {
            Label1.Text=("Tiffin inserted");
        }
        //Label2.Text = Session["sessionname"].ToString();
    }
    protected void add_Click(object sender, EventArgs e)
    {
        string a, b, c, d, f, g, h, i, j,l,k;
        if (roti.Checked == true)
        {
            a = "Roti";
        }
        else
        {
            a = "Sabji";
        }

        if (sabji.Checked == true)
        {
            b = "Sabji";
        }
        else
        {
            b = "Dal";
        }

        if (dal.Checked == true)
        {
            c = "Dal";
        }
        else
        {
            c = "Rice";
        }

        if (rice.Checked==true)
        {
            d = "Rice";
        }
        else
        {
            d = "Salad";
        }

        if (salad.Checked == true)
        {
            f = "Salad";
        }
        else
        {
            f = "Papad";
        }

        if (papad.Checked == true)
        {
            g = "Papad";
        }
        else
        {
            g = "Buttermilk";
        }

        if (buttermilk.Checked == true)
        {
            h = "Buttermilk";
        }
        else
        {
            h = "Khicdi";
        }

        if (khicdi.Checked == true)
        {
            i = "Khicdi";
        }
        else
        {
            i = "Kadi";
        }

        if (kadi.Checked == true)
        {
            j = "Kadi";
        }
        else
        {
            j = "Sweet";
        }

        if (sweet.Checked == true)
        {
            l = "Sweet";
        }
        else
        {
            l = "Farsan";
        }

        if (farsan.Checked == true)
        {
            k = "Farsan";
        }
        else
        {
            k = "Roti";
        }

        con.Open();
        string str = "insert into Tiffin values (@p1,@p2,@p3)";
        SqlCommand cmd = new SqlCommand(str,con);

        cmd.Parameters.AddWithValue("@p1", txt_type.Text);
        cmd.Parameters.AddWithValue("@p2", a + "," + b + "," + c + "," + d + "," + f + "," + g + "," + h + "," + i + "," + j + "," + k + "," + l );
        cmd.Parameters.AddWithValue("@p3", txt_price.Text);
        cmd.ExecuteNonQuery();
        Label1.Visible = true;
        clearall();
        con.Close();
    }
 
}