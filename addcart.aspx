<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="addcart.aspx.cs" Inherits="addcart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        font-size: xx-large;
        font-family: Calibri;
    }
    .style2
    {
        color: #000000;
        font-size: x-large;
    }
        .style302
        {
            width: 239px;
        }
        .style303
        {
            width: 453px;
        }
        .style304
        {
            width: 239px;
            color: #000000;
        }
        .style305
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <h1 class="style1">
                Your Shopping Cart</h1>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="cartid" DataSourceID="SqlDataSource2" 
                onrowdeleted="GridView1_RowDeleted" Width="100%">
                <Columns>
                    <asp:ImageField DataImageUrlField="productpic" 
                        DataImageUrlFormatString="uploads/{0}" HeaderText="Picture">
                        <ControlStyle Height="100px"/>
                    </asp:ImageField>
                    <asp:BoundField DataField="productname" HeaderText="Product" 
                        SortExpression="productname" />
                    <asp:BoundField DataField="brand" HeaderText="Brand" />
                    <asp:BoundField DataField="colorname" HeaderText="Color" 
                        SortExpression="colorname" />
                    <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                    <asp:BoundField DataField="rate" HeaderText="Rate" SortExpression="rate" />
                    <asp:BoundField DataField="qty" HeaderText="Qty." SortExpression="qty" />
                    <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                </Columns>
                <RowStyle BorderStyle="None" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                DeleteCommand="DELETE FROM [addcart] WHERE [cartid] = @original_cartid" 
                InsertCommand="INSERT INTO [addcart] ([productpic], [productname], [rate], [qty], [size], [color], [brand], [total], [username]) VALUES (@productpic, @productname, @rate, @qty, @size, @color, @brand, @total, @username)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT addcart.cartid, addcart.productpic, addcart.productname, addcart.rate, addcart.qty, addcart.size, addcart.total, addcart.username, addcolor.colorname, addcart.brand FROM addcart INNER JOIN addcolor ON addcart.color = addcolor.colorid WHERE (addcart.username = @username)" 
                
                
                UpdateCommand="UPDATE [addcart] SET [productpic] = @productpic, [productname] = @productname, [rate] = @rate, [qty] = @qty, [size] = @size, [color] = @color, [brand] = @brand, [total] = @total, [username] = @username WHERE [cartid] = @original_cartid AND (([productpic] = @original_productpic) OR ([productpic] IS NULL AND @original_productpic IS NULL)) AND (([productname] = @original_productname) OR ([productname] IS NULL AND @original_productname IS NULL)) AND (([rate] = @original_rate) OR ([rate] IS NULL AND @original_rate IS NULL)) AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([size] = @original_size) OR ([size] IS NULL AND @original_size IS NULL)) AND (([color] = @original_color) OR ([color] IS NULL AND @original_color IS NULL)) AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL)) AND (([username] = @original_username) OR ([username] IS NULL AND @original_username IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_cartid" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="productpic" Type="String" />
                    <asp:Parameter Name="productname" Type="String" />
                    <asp:Parameter Name="rate" Type="Decimal" />
                    <asp:Parameter Name="qty" Type="Decimal" />
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="color" Type="String" />
                    <asp:Parameter Name="brand" Type="String" />
                    <asp:Parameter Name="total" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="un" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="productpic" Type="String" />
                    <asp:Parameter Name="productname" Type="String" />
                    <asp:Parameter Name="rate" Type="Decimal" />
                    <asp:Parameter Name="qty" Type="Decimal" />
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="color" Type="String" />
                    <asp:Parameter Name="brand" Type="String" />
                    <asp:Parameter Name="total" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="original_cartid" Type="Decimal" />
                    <asp:Parameter Name="original_productpic" Type="String" />
                    <asp:Parameter Name="original_productname" Type="String" />
                    <asp:Parameter Name="original_rate" Type="Decimal" />
                    <asp:Parameter Name="original_qty" Type="Decimal" />
                    <asp:Parameter Name="original_size" Type="String" />
                    <asp:Parameter Name="original_color" Type="String" />
                    <asp:Parameter Name="original_brand" Type="String" />
                    <asp:Parameter Name="original_total" Type="String" />
                    <asp:Parameter Name="original_username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td align="center">
            <table class="nav-justified">
                <tr>
                    <td class="style304">
                        &nbsp;</td>
                    <td class="style303">
                        <span class="style305"><strong>Total Bill :- £ </strong></span>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" 
                ForeColor="Black"></asp:Label>
            &nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style302">
                        &nbsp;</td>
                    <td class="style303">
            <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" 
                Font-Italic="False" ForeColor="#990000" onclick="LinkButton4_Click">Continue Shopping</asp:LinkButton>
        &nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                Text="Check Out" />
                    </td>
                    <td>
                        <strong>Discount Coupon(If any)</strong>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Apply" />
                        <br />
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>

