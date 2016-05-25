<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="addcat.aspx.cs" Inherits="addcat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 194px;
        }
        .style301
        {
            font-size: x-large;
        }
        .style302
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td class="style6">
                <h2 class="style301">
                    <strong class="style302">Add Category</strong></h2>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                <strong>Category Name</strong></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <strong>Category Picture</strong></td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add Category" 
                    onclick="Button1_Click1" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                <h2>
                    <strong>Already added categories</strong></h2>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="CatID" 
                    DataSourceID="SqlDataSource1" PageSize="5" 
                    Width="457px">
                    <Columns>
                        <asp:ImageField DataImageUrlField="CatPic" 
                            DataImageUrlFormatString="uploads/{0}" HeaderText="Picture">
                            <ControlStyle Height="100px" Width="75px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="CatName" HeaderText="CatName" 
                            SortExpression="CatName" />
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/imgs/trash_(delete)_16x16.gif" HeaderText="Delete" 
                            ShowDeleteButton="True" />
                        <asp:HyperLinkField DataNavigateUrlFields="catid" 
                            DataNavigateUrlFormatString="updatecatdetails.aspx?cid={0}" HeaderText="Update" 
                            Text="Update" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    DeleteCommand="DELETE FROM [addcat] WHERE [CatID] = @original_CatID" 
                    InsertCommand="INSERT INTO [addcat] ([CatName], [CatPic]) VALUES (@CatName, @CatPic)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [addcat]" 
                    UpdateCommand="UPDATE [addcat] SET [CatName] = @CatName, [CatPic] = @CatPic WHERE [CatID] = @original_CatID AND (([CatName] = @original_CatName) OR ([CatName] IS NULL AND @original_CatName IS NULL)) AND (([CatPic] = @original_CatPic) OR ([CatPic] IS NULL AND @original_CatPic IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CatID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CatName" Type="String" />
                        <asp:Parameter Name="CatPic" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CatName" Type="String" />
                        <asp:Parameter Name="CatPic" Type="String" />
                        <asp:Parameter Name="original_CatID" Type="Decimal" />
                        <asp:Parameter Name="original_CatName" Type="String" />
                        <asp:Parameter Name="original_CatPic" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

