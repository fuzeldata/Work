<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="ordersummary.aspx.cs" Inherits="ordersummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-family: Calibri;
            font-size: xx-large;
        }
    .style2
    {
        font-size: x-large;
    }
    .style3
    {
        color: #000000;
    }
        .style4
        {
            font-family: Calibri;
            font-size: large;
        }
        .style5
        {
            font-size: medium;
        }
        .style301
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="style1">
        <strong class="style301">Your Order summary</strong></h1>
    <p class="style1">
        &nbsp;</p>
    <p class="style4">
        Thanks for shopping on our website. Your order number is
        <asp:Label ID="Label3" runat="server" Font-Size="Large"></asp:Label>
        . </p>
    <p class="style4">
        &nbsp;</p>
    <p class="style4">
        Your shipping address is
        <asp:Label ID="Label4" runat="server"></asp:Label>
    </p>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="style5" Width="957px">
            <Columns>
                <asp:ImageField DataImageUrlField="productpic" 
                    DataImageUrlFormatString="uploads/{0}" HeaderText="Picture">
                    <ControlStyle Height="75px" Width="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="productname" HeaderText="productname" 
                    SortExpression="productname" />
                <asp:BoundField DataField="rate" HeaderText="rate" SortExpression="rate" />
                <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
                <asp:BoundField DataField="size" HeaderText="size" SortExpression="size" />
                <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                <asp:BoundField DataField="orderno" HeaderText="orderno" 
                    SortExpression="orderno" />
                <asp:BoundField DataField="colorname" HeaderText="colorname" 
                    SortExpression="colorname" />
                <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
            </Columns>
        </asp:GridView>
    </p>
    <p class="style1">
        &nbsp;</p>
    <p class="style1">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
            
            
            SelectCommand="SELECT addcart1.productpic, addcart1.productname, addcart1.rate, addcart1.qty, addcart1.size, addcart1.total, addcart1.orderno, addcolor.colorname, addcart1.Brand, addcart1.id FROM addcart1 INNER JOIN addcolor ON addcart1.Colour = addcolor.colorid WHERE (addcart1.orderno = @ono)">
            <SelectParameters>
                <asp:SessionParameter Name="ono" SessionField="ono" />
            </SelectParameters>
        </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;
    </p>
<p class="style1" align="center">
        <span class="style2"><strong>&nbsp; <span class="style3">Your Total Amount is 
        £</span></strong></span><asp:Label ID="Label2" runat="server" 
            Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
    </p>
    </asp:Content>

