<%@ Page Title="" Language="C#" MasterPageFile="~/Gharkakhana.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
    {
        width: 1000px;
        background-color: #000000;
            margin-top: -25px;
            
        }
    .style14
    {
        height: 39px;
        color: #00FF00;
        font-family: "Arial Black";
        font-size: medium;
    }
    .style16
    {
        height: 189px;
        font-size: small;
        font-family: "Arial Black";
        color: #00FF00;
    }
    .style17
    {
        height: 198px;
        color: #00FF00;
        font-size: small;
        font-family: "Arial Black";
    }
    .style18
    {
        height: 35px;
    }
    .style19
    {
        height: 56px;
            font-family: "Arial Black";
            font-size: large;
            color: #FFFFFF;
        }
    .style32
    {
        height: 39px;
        color: #00FF00;
        font-family: "Arial Black";
        font-size: medium;
        width: 250px;
    }
    .style33
    {
        height: 198px;
        width: 250px;
    }
    .style34
    {
        height: 189px;
        width: 250px;
        color: #00FF00;
        font-size: small;
        font-family: "Arial Black";
    }
    .style35
    {
        height: 35px;
        width: 250px;
        font-family: "Arial Black";
        font-size: small;
        color: #FFFFFF;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" class="style13" background-color: "black">
    <tr>
        <td align="center" class="style32">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FFFFFF" 
                Text="SINGLE MEAL"></asp:Label>
        </td>
        <td align="center" class="style32">
            <asp:Label ID="Label2" runat="server" style="color: #FFFFFF" Text="COMBO MEAL"></asp:Label>
        </td>
        <td align="center" class="style32">
            <asp:Label ID="Label3" runat="server" style="color: #FFFFFF" Text="MONTHLY"></asp:Label>
        </td>
        <td class="style14">
        </td>
    </tr>
    <tr>
        <td class="style33">
        <img src="images/single.jpg">
        </td>
        <td class="style33">
         <img src="images/combo.jpg">
        </td>
        
        <td class="style33">
         <img src="images/monthly.jpg">
        </td>
        <td align="center" class="style17">
            Cash on Delivery<br />
            <br />
            Place Order of Next day<br />
        </td>
    </tr>
    <tr>
        <td align="center" class="style34">
            (For one person)<br />
            Dal<br />
            Rice<br />
            Roti(5)<br />
            Sabji(2)<br />
            Salad<br />
            Sweet(1)<br />
            Papad(1)<br />
            <br />
            <asp:Button ID="order1" runat="server" Height="24px" 
                style="font-weight: 700; font-family: 'Arial Black'" Text="Order now" 
                Width="99px" onclick="order1_Click" />
            <br />
        </td>
        <td align="center" class="style34">
            (For two person)<br />
            Dal(2)<br />
            Rice(2)<br />
            Roti(10)<br />
            Sabji(4)<br />
            Salad<br />
            Sweet(2)<br />
            Papad(2)<br />
            <br />
            <asp:Button ID="order2" runat="server" Height="24px" 
                style="font-weight: 700; font-family: 'Arial Black'" Text="Order now" 
                Width="99px" onclick="order2_Click" />
        </td>
        <td align="center" class="style34">
           <blink> Get 25 tiffins in just 1250 rs</blink><br />
            <br />
            Call 9898888778<br />
        </td>
        <td align="center" class="style16">
            Order Time: Before 10 pm<br />
            <br />
            Delivery time: 12pm to 1pm
        </td>
    </tr>
    <tr>
        <td align="center" class="style35">
            Price: 60 rs</td>
        <td align="center" class="style35">
            Price: 100 rs</td>
        <td class="style35">
        </td>
        <td class="style18">
        </td>
    </tr>
    <tr>
        <td class="style19" colspan="4" align="center">
            Register Yourself ---------------&gt; Place Order ---------------&gt; Enjoy Your Meal</td>
    </tr>
</table>
    </asp:Content>

