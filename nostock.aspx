<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="nostock.aspx.cs" Inherits="nostock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style301
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="nav-justified">
        <tr>
            <td>
                <strong class="style301">Low Stock/Out of Stock Products</strong></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CaptionAlign="Left" DataKeyNames="sizeid" 
        DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="CatName" HeaderText="Category" 
                SortExpression="CatName" />
            <asp:BoundField DataField="SubCatName" HeaderText="Sub Category" 
                SortExpression="SubCatName" />
            <asp:BoundField DataField="colorname" HeaderText="Color" 
                SortExpression="colorname" />
            <asp:BoundField DataField="productname" HeaderText="Product Name" 
                SortExpression="productname" />
            <asp:BoundField DataField="stock" HeaderText="Stock" SortExpression="stock" />
            <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT addcat.CatName, addsubcat.SubCatName, addcolor.colorname, addproduct.productname, addsize.stock, addsize.size, addsize.sizeid FROM addsize INNER JOIN addcat ON addsize.CatID = addcat.CatID INNER JOIN addsubcat ON addsize.SubCatID = addsubcat.SubCatID INNER JOIN addcolor ON addsize.colorid = addcolor.colorid INNER JOIN addproduct ON addsize.PID = addproduct.productid WHERE (addsize.stock &lt;= @stock)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="stock" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

