<%@ Page Title="" Language="C#" MasterPageFile="~/Gharkakhana.master" AutoEventWireup="true" CodeFile="Cust_registeration.aspx.cs" Inherits="Cust_registeration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

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
        color: #FF0000;
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
        
    .style13
    {
        width: 1000px;
        background-color: #000000;
         margin-top: -25px;
    }
    .style36
    {
        color: #00FF00;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" class="style13" background-color: "black">
        <tr>
            <td align="center" class="style35">
                Customer Registeration</td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style32">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
                    class="style36"> Name:</span>
                <asp:TextBox ID="txt_name" runat="server" Width="189px" 
                    style="font-family: 'Times New Roman', Times, serif"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txt_name" ErrorMessage="Enter name" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <span class="style36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone no:
                </span>
                <asp:TextBox ID="txt_phoneno" runat="server" Width="189px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txt_phoneno" ErrorMessage="Enter Phone no." 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <span class="style36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Address:
                </span>
                <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" Width="189px" 
                    ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txt_address" ErrorMessage="Enter Address" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <span class="style36">City:
                </span>
                <asp:DropDownList ID="DropDownList_city" runat="server" Height="18px" 
                    Width="110px" >
                    <asp:ListItem>Baroda</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="DropDownList_city" ErrorMessage="Select city" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="style36">&nbsp;Email Id:
                </span>
                <asp:TextBox ID="txt_emailid" runat="server" Width="271px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txt_emailid" ErrorMessage="Enter Email Id" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="txt_emailid" 
                    ErrorMessage="Enter Proper Email Id" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <span class="style36">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Password: 
                </span>
                <asp:TextBox ID="txt_password" runat="server" Width="225px"  
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txt_password" ErrorMessage="Enter Password" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <asp:DropDownList ID="DropDownList_role" runat="server" Height="16px" 
                    Visible="False" Width="106px">
                    <asp:ListItem>user</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                <asp:Label ID="Label1" runat="server" Text="You are registered" Visible="False" 
                    style="color: #FFFFFF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="style32">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="register" runat="server" 
                    style="font-weight: 700; font-family: 'Arial Black'" Text="Register" 
                    onclick="register_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="clear" runat="server" Height="28px" 
                    style="font-weight: 700; font-family: 'Arial Black'" Text="Clear" 
                    Width="93px" onclick="clear_Click" />
&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style19" align="center">
                Register Yourself ---------------&gt; Place Order ---------------&gt; Enjoy Your Meall</td>
        </tr>
        </table>
</asp:Content>

