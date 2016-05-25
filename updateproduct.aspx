<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="updateproduct.aspx.cs" Inherits="updateproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
            font-family: Calibri;
            height: 21px;
        }
        .style301
        {
            font-size: x-large;
        }
        .style302
        {
            font-size: large;
        }
        .style303
        {
            font-family: Calibri;
            height: 21px;
            width: 232px;
        }
        .style304
        {
            font-family: Calibri;
            height: 21px;
            width: 232px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td class="style7" colspan="2">
                <h1 class="style301">
                    <strong class="style302">Already Added Products</strong></h1>
            </td>
        </tr>
        <tr>
            <td class="style304">
                Choose Category</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="CatName" DataValueField="CatID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT [CatID], [CatName] FROM [addcat]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style304">
                Choose Sub Category</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="SubCatName" 
                    DataValueField="SubCatID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT [SubCatName], [SubCatID] FROM [addsubcat] WHERE ([CatID] = @CatID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="CatID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr align="left">
            <td class="style304" valign="top">
                Choose Products</td>
            <td align="left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource3" HorizontalAlign="Left" 
                    DataKeyNames="productid" Height="245px" Width="100%">
                    <Columns>
                        <asp:ImageField DataImageUrlField="productimage" 
                            DataImageUrlFormatString="uploads/{0}" HeaderText="Picture">
                            <ControlStyle Height="100px" Width="75px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="productname" HeaderText="Product " 
                            SortExpression="productname" />
                        <asp:BoundField DataField="rate" HeaderText="Rate" SortExpression="rate" />
                        <asp:CommandField 
                            DeleteImageUrl="~/imgs/trash_(delete)_16x16.gif" HeaderText="Delete" 
                            ShowDeleteButton="True">
                        <ControlStyle Height="20px" Width="25px" />
                        </asp:CommandField>
                        <asp:HyperLinkField DataNavigateUrlFields="productid" 
                            DataNavigateUrlFormatString="updateproductdetails.aspx?pid={0}" 
                            HeaderText="Update" Text="Update" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style303">
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    DeleteCommand="DELETE FROM [addproduct] WHERE [productid] = @original_productid" 
                    InsertCommand="INSERT INTO [addproduct] ([productname], [brandid], [rate], [description], [productimage]) VALUES (@productname, @brandid, @rate, @description, @productimage)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [productid], [productname], [brandid], [rate], [description], [productimage] FROM [addproduct] WHERE (([catid] = @catid) AND ([subcatid] = @subcatid))" 
                    UpdateCommand="UPDATE [addproduct] SET [productname] = @productname, [brandid] = @brandid, [rate] = @rate, [description] = @description, [productimage] = @productimage WHERE [productid] = @original_productid AND (([productname] = @original_productname) OR ([productname] IS NULL AND @original_productname IS NULL)) AND (([brandid] = @original_brandid) OR ([brandid] IS NULL AND @original_brandid IS NULL)) AND (([rate] = @original_rate) OR ([rate] IS NULL AND @original_rate IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([productimage] = @original_productimage) OR ([productimage] IS NULL AND @original_productimage IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_productid" Type="Decimal" />
                        <asp:Parameter Name="original_productname" Type="String" />
                        <asp:Parameter Name="original_brandid" Type="Decimal" />
                        <asp:Parameter Name="original_rate" Type="Decimal" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter Name="original_productimage" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="productname" Type="String" />
                        <asp:Parameter Name="brandid" Type="Decimal" />
                        <asp:Parameter Name="rate" Type="Decimal" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="productimage" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="catid" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="subcatid" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="productname" Type="String" />
                        <asp:Parameter Name="brandid" Type="Decimal" />
                        <asp:Parameter Name="rate" Type="Decimal" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="productimage" Type="String" />
                        <asp:Parameter Name="original_productid" Type="Decimal" />
                        <asp:Parameter Name="original_productname" Type="String" />
                        <asp:Parameter Name="original_brandid" Type="Decimal" />
                        <asp:Parameter Name="original_rate" Type="Decimal" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter Name="original_productimage" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style303">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

