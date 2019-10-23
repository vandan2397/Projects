<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.master" AutoEventWireup="true" CodeFile="Cust_order.aspx.cs" Inherits="Cust_order" %>

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
                Customer Order</td>
        </tr>
        <tr>
            <td align="left" class="style32">
                &nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Order Date:
                <asp:TextBox ID="txt_date" runat="server" Width="189px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;Tiffin Type:
                <asp:DropDownList ID="DropDownList_type" runat="server" Height="18px" 
                    Width="151px" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList_type_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tiffin Items:
                <asp:TextBox ID="txt_items" runat="server" Width="372px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" class="style32">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No of Items:
                <asp:DropDownList ID="DropDownList_nooftifffins" runat="server" Height="22px" 
                    Width="72px" AutoPostBack="True">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="left" class="style32">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Delivery Time:
                <asp:TextBox ID="txt_time" runat="server" Width="111px">12pm to 1pm</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total:
                <asp:TextBox ID="txt_total" runat="server" Width="225px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <asp:Button ID="order" runat="server" 
                    style="font-weight: 700; font-family: 'Arial Black'" Text="Order" 
                    onclick="order_Click" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <asp:Label ID="Label1" runat="server" style="color: #FFFFFF" Text="Label" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <asp:TextBox ID="txt_session" runat="server" Width="111px" Visible="False"></asp:TextBox>
            &nbsp;
                <asp:TextBox ID="txt_name" runat="server" Width="111px" Visible="False"></asp:TextBox>
            &nbsp;
                <asp:TextBox ID="txt_address" runat="server" Width="111px" Visible="False"></asp:TextBox>
            &nbsp;<asp:TextBox ID="txt_phone" runat="server" Width="111px" Visible="False"></asp:TextBox>
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

