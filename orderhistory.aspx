<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="orderhistory.aspx.cs" Inherits="orderhistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="nav-justified">
    <tr>
        <td>
            Order History</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="OrderNo" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="orderno" 
                        DataNavigateUrlFormatString="orderdetails.aspx?oid={0}" DataTextField="OrderNo" 
                        HeaderText="Order No" />
                    <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" 
                        SortExpression="ShippingAddress" />
                    <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" 
                        SortExpression="TotalCost" />
                    <asp:BoundField DataField="Status" HeaderText="Status" 
                        SortExpression="Status" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                        SortExpression="OrderDate" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                onselected="SqlDataSource1_Selected" 
                SelectCommand="SELECT [OrderNo], [ShippingAddress], [TotalCost], [Status], [OrderDate] FROM [ordertable] WHERE ([Username] = @Username)">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="un" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>

