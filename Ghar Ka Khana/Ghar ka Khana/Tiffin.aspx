<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Tiffin.aspx.cs" Inherits="Tiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        
    .style13
    {
        width: 1000px;
        background-color: #000000;
         margin-top: -25px;
    }
    
        .style35
        {
            height: 78px;
            color: #FFFFFF;
            font-family: "Arial Black";
            font-size: xx-large;
        }
        .style32
    {
        height: 12px;
        color: #00FF00;
        font-family: "Arial Black";
        font-size: medium;
        text-align: center;
    }
    .style19
    {
        height: 56px;
            font-family: "Arial Black";
            font-size: large;
            color: #FFFFFF;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" class="style13" background-color: "black">
    <tr>
        <td align="center" class="style35">
            Tiffin</td>
    </tr>
    <tr>
        <td align="left" >
                &nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" 
                    style="font-family: 'Arial Black'; color: #00FF00" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" class="style32">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tiffin Type:
            <asp:TextBox ID="txt_type" runat="server" Width="189px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="center" class="style32">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Order Type: <asp:CheckBox 
                ID="roti" runat="server" Text="Roti"  />
&nbsp;
            <asp:CheckBox ID="sabji" runat="server" Text="Sabji" />
&nbsp;
            <asp:CheckBox ID="dal" runat="server" Text="Dal" />
&nbsp;<asp:CheckBox ID="rice" runat="server" Text="Rice" />
            &nbsp;<asp:CheckBox ID="salad" runat="server" Text="Salad" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="papad" runat="server" Text="Papad" />
&nbsp;
            <asp:CheckBox ID="buttermilk" runat="server" Text="Buttermilk" />
&nbsp;
            <asp:CheckBox ID="khicdi" runat="server" Text="khicdi" />
&nbsp;
            <asp:CheckBox ID="kadi" runat="server" Text="Kadi" />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="sweet" runat="server" Text="Sweet" />
            <asp:CheckBox ID="farsan" runat="server" Text="Farsan" />
        </td>
    </tr>
    <tr>
        <td align="center" class="style32">
&nbsp; Tiffin Price:
            <asp:TextBox ID="txt_price" runat="server" Width="152px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="left" class="style32">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="style32">
            <asp:Label ID="Label1" runat="server" style="color: #FFFFFF" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" class="style32">
&nbsp;&nbsp;
                <asp:Button ID="add" runat="server" 
                    style="font-weight: 700; font-family: 'Arial Black'" Text="Add" 
                Width="83px" onclick="add_Click" />
        </td>
    </tr>
    <tr>
        <td class="style19" align="center">
                Register Yourself ---------------&gt; Place Order ---------------&gt; Enjoy Your Meal</td>
    </tr>
    <tr>
        <td class="style19" align="center">
                &nbsp;</td>
    </tr>
</table>
</asp:Content>

