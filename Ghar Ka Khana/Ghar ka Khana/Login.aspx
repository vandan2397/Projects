<%@ Page Title="" Language="C#" MasterPageFile="~/Gharkakhana.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style13
    {
        width: 1000px;
        background-color: #000000;
        margin-top: -25px;
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
        .style35
        {
            height: 78px;
            color: #FFFFFF;
            font-family: "Arial Black";
            font-size: xx-large;
        }
        .style36
        {
            height: 12px;
            color: #00FF00;
            font-family: "Arial Black";
            font-size: medium;
        }
        .style37
        {
            height: 12px;
            color: #00FF00;
            font-family: "Arial Black";
            font-size: medium;
            }
    .style38
    {
        height: 12px;
        color: #00FF00;
        font-family: "Arial Black";
        font-size: medium;
    }
    .style39
    {
        height: 12px;
        color: #00FF00;
        font-family: "Arial Black";
        font-size: medium;
        width: 428px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" class="style13" background-color: "black">
        <tr>
            <td align="center" class="style35" colspan="2">
                Login</td>
        </tr>
        <tr>
            <td align="center" class="style32" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style39">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email Id:
            </td>
            <td align="left" class="style36">
&nbsp;<asp:TextBox ID="txt_emailid" runat="server" Width="234px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txt_emailid" ErrorMessage="Enter Email ID" 
                    
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #FF0000;"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style39">
                Password:
            </td>
            <td align="left" class="style36">
&nbsp;<asp:TextBox ID="txt_password" runat="server" Width="234px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txt_password" ErrorMessage="Enter Password" 
                    
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #FF0000;"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style37" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #FFFFFF" 
                    Text="Login Successful" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="style37" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="style38" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<asp:Button ID="clear" runat="server" Height="24px" 
                style="font-weight: 700; font-family: 'Arial Black'" Text="Login" 
                Width="81px" onclick="clear_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="clear0" runat="server" Height="24px" 
                style="font-weight: 700; font-family: 'Arial Black'" Text="Clear" 
                Width="81px" />
            </td>
        </tr>
        <tr>
            <td class="style19" colspan="2" align="center">
                Register Yourself ---------------&gt; Place Order ---------------&gt; Enjoy Your Meal</td>
        </tr>
    </table>
</asp:Content>

