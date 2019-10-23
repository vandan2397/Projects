<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

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
            height: 74px;
            color: #FFFFFF;
            font-family: "Arial Black";
            font-size: xx-large;
        }
        .style19
    {
        height: 56px;
            font-family: "Arial Black";
            font-size: large;
            color: #FFFFFF;
        }
        
    .style36
    {
        color: #FFFFFF;
        font-family: "Arial Black";
        font-size: large;
        height: 12px;
        width: 1000px;
    }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellspacing="1" class="style13" background-color: "black">
    <tr>
        <td align="center" class="style35">
            Orders</td>
    </tr>
    <tr>
        <td align="left" class="style36">
            <asp:Label ID="Label1" runat="server" style="color: #00FF00" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="center" class="style36">
            <asp:Label ID="Label2" runat="server" style="color: #00FF00" Text="Search by:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>---select---</asp:ListItem>
                <asp:ListItem>order_date</asp:ListItem>
                <asp:ListItem>order_type</asp:ListItem>
                <asp:ListItem>cust_email</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" style="color: #00FF00" 
                Text="Search type:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" style="font-weight: 700" 
                Text="Refresh" onclick="Button1_Click" />
        </td>
    </tr>
    <tr>
        <td align="center" class="style36">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT DISTINCT [order_date] FROM [Cust_order]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT DISTINCT [tiffin_type] FROM [Cust_order]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT DISTINCT [sessionid] FROM [Cust_order]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td align="center" class="style36">
            <asp:Panel ID="Panel1" runat="server"  >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="order_id" DataSourceID="SqlDataSource4"  >
                    <Columns>
                        <asp:BoundField DataField="order_id" HeaderText="order_id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="order_id" />
                        <asp:BoundField DataField="order_date" HeaderText="order_date" 
                            SortExpression="order_date" />
                        <asp:BoundField DataField="tiffin_type" HeaderText="tiffin_type" 
                            SortExpression="tiffin_type" />
                        <asp:BoundField DataField="tiffin_items" HeaderText="tiffin_items" 
                            SortExpression="tiffin_items" />
                        <asp:BoundField DataField="nooftiffins" HeaderText="nooftiffins" 
                            SortExpression="nooftiffins" />
                        <asp:BoundField DataField="deliverytime" HeaderText="deliverytime" 
                            SortExpression="deliverytime" />
                        <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                        <asp:BoundField DataField="sessionid" HeaderText="sessionid" 
                            SortExpression="sessionid" />
                        <asp:BoundField DataField="cust_name" HeaderText="cust_name" 
                            SortExpression="cust_name" />
                        <asp:BoundField DataField="cust_address" HeaderText="cust_address" 
                            SortExpression="cust_address" />
                        <asp:BoundField DataField="cust_phone" HeaderText="cust_phone" 
                            SortExpression="cust_phone" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Cust_order]"></asp:SqlDataSource>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td align="center" class="style36">
            <asp:Panel ID="Panel2" runat="server">
                <asp:GridView ID="GridView2" runat="server">
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [Cust_order] WHERE ([order_date] = @order_date2)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="order_date2" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Cust_order] WHERE ([tiffin_type] = @tiffin_type)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="tiffin_type" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Cust_order] WHERE ([sessionid] = @sessionid)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="sessionid" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="style19" align="center">
                Register Yourself ---------------&gt; Place Order ---------------&gt; Enjoy Your Meal</td>
    </tr>
</table>
</asp:Content>

