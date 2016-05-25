<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="displayorderdetails.aspx.cs" Inherits="displayorderdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 100%;
        }
        .style301
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style7">
        <tr>
            <td>
&nbsp;<h1>
                    <strong class="style301">Order Details</strong></h1>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" Width="100%">
                    <Columns>
                        <asp:ImageField DataImageUrlField="productpic" 
                            DataImageUrlFormatString="uploads/{0}" HeaderText="Product Picture">
                            <ControlStyle Height="100px" Width="75px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="productname" HeaderText="Name" 
                            SortExpression="productname" />
                        <asp:BoundField DataField="rate" HeaderText="Rate" SortExpression="rate" />
                        <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
                        <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                        <asp:BoundField DataField="colorname" HeaderText="Color" 
                            SortExpression="color" />
                        <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand" />
                        <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    
                    
                    SelectCommand="SELECT addcart1.productpic, addcart1.productname, addcart1.rate, addcart1.qty, addcart1.size, addcart1.Brand, addcart1.total, addcart1.username, addcolor.colorname FROM addcart1 INNER JOIN addcolor ON addcart1.Colour = addcolor.colorid WHERE (addcart1.orderno = @orderno)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="orderno" QueryStringField="oid" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

