<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="vieworders.aspx.cs" Inherits="vieworders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            width: 100%;
        }
        .style8
        {
            width: 158px;
        }
        .style9
        {
            width: 158px;
            font-weight: bold;
        }
        .style301
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style7">
        <tr>
            <td class="style8">
                <h2>
                    <strong class="style301">View Orders</strong></h2>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                Choose Date</td>
            <td align="left">
                <asp:Calendar ID="Calendar1" runat="server" Height="238px" 
                    Width="285px">
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style9" valign="top">
                Orders</td>
            <td align="left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="OrderNo" DataSourceID="SqlDataSource1" 
                    onrowupdating="GridView1_RowUpdating" Width="100%">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="orderno" 
                            DataNavigateUrlFormatString="displayorderdetails.aspx?oid={0}" 
                            DataTextField="OrderNo" HeaderText="Order No." />
                        <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" 
                            SortExpression="TotalCost" />
                        <asp:BoundField DataField="ShippingAddress" HeaderText="ShippingAddress" 
                            SortExpression="ShippingAddress" />
                        <asp:BoundField DataField="PaymentMode" HeaderText="PaymentMode" 
                            SortExpression="PaymentMode" />
                        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                            SortExpression="OrderDate" />
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>Processing</asp:ListItem>
                                    <asp:ListItem>Order Approved</asp:ListItem>
                                    <asp:ListItem>Packing</asp:ListItem>
                                    <asp:ListItem>Shipped</asp:ListItem>
                                    <asp:ListItem>In-Transit</asp:ListItem>
                                    <asp:ListItem>Out for Delivery</asp:ListItem>
                                    <asp:ListItem>Delivered</asp:ListItem>
                                    <asp:ListItem>Cancelled</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Username" HeaderText="Username" 
                            SortExpression="Username" />
                        <asp:CommandField EditText="Update Status" HeaderText="Update" 
                            ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    DeleteCommand="DELETE FROM [ordertable] WHERE [OrderNo] = @original_OrderNo AND (([TotalCost] = @original_TotalCost) OR ([TotalCost] IS NULL AND @original_TotalCost IS NULL)) AND (([ShippingAddress] = @original_ShippingAddress) OR ([ShippingAddress] IS NULL AND @original_ShippingAddress IS NULL)) AND (([PaymentMode] = @original_PaymentMode) OR ([PaymentMode] IS NULL AND @original_PaymentMode IS NULL)) AND (([OrderDate] = @original_OrderDate) OR ([OrderDate] IS NULL AND @original_OrderDate IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Username] = @original_Username) OR ([Username] IS NULL AND @original_Username IS NULL))" 
                    InsertCommand="INSERT INTO [ordertable] ([TotalCost], [ShippingAddress], [PaymentMode], [OrderDate], [Status], [Username]) VALUES (@TotalCost, @ShippingAddress, @PaymentMode, @OrderDate, @Status, @Username)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [OrderNo], [TotalCost], [ShippingAddress], [PaymentMode], [OrderDate], [Status], [Username] FROM [ordertable] WHERE ([OrderDate] = @OrderDate)" 
                    
                    UpdateCommand="UPDATE [ordertable] SET  [Status] = @Status WHERE [OrderNo] = @original_OrderNo" 
                    onselected="SqlDataSource1_Selected">
                    <DeleteParameters>
                        <asp:Parameter Name="original_OrderNo" Type="Decimal" />
                        <asp:Parameter Name="original_TotalCost" Type="Decimal" />
                        <asp:Parameter Name="original_ShippingAddress" Type="String" />
                        <asp:Parameter Name="original_PaymentMode" Type="String" />
                        <asp:Parameter DbType="Date" Name="original_OrderDate" />
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_Username" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TotalCost" Type="Decimal" />
                        <asp:Parameter Name="ShippingAddress" Type="String" />
                        <asp:Parameter Name="PaymentMode" Type="String" />
                        <asp:Parameter DbType="Date" Name="OrderDate" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="Username" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Calendar1" Name="OrderDate" 
                            PropertyName="SelectedDate" Type="DateTime" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" />
                        <asp:Parameter Name="original_OrderNo" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

