<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="updatesubcat.aspx.cs" Inherits="updatesubcat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 262px;
            font-weight: bold;
        }
        .style301
        {
            width: 262px;
            font-weight: bold;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td class="style301">
                Update Sub Category</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
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
            <td class="style6" valign="top">
                Choose Sub Categories</td>
            <td align="left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="SubCatID" DataSourceID="SqlDataSource2" Width="420px">
                    <Columns>
                        <asp:ImageField DataImageUrlField="SubCatPic" 
                            DataImageUrlFormatString="uploads/{0}" HeaderText="Image">
                            <ControlStyle Height="50px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="SubCatName" HeaderText="SubCatName" 
                            SortExpression="SubCatName" />
                        <asp:CommandField 
                            DeleteImageUrl="~/imgs/trash_(delete)_16x16.gif" HeaderText="Delete" 
                            ShowDeleteButton="True" />
                        <asp:HyperLinkField DataNavigateUrlFields="subcatid" 
                            DataNavigateUrlFormatString="updatesubcatdetails.aspx?scid={0}" 
                            HeaderText="Update" Text="Update" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    DeleteCommand="DELETE FROM [addsubcat] WHERE [SubCatID] = @original_SubCatID" 
                    InsertCommand="INSERT INTO [addsubcat] ([SubCatName], [SubCatPic]) VALUES (@SubCatName, @SubCatPic)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [SubCatName], [SubCatPic], [SubCatID] FROM [addsubcat] WHERE ([CatID] = @CatID)" 
                    UpdateCommand="UPDATE [addsubcat] SET [SubCatName] = @SubCatName, [SubCatPic] = @SubCatPic WHERE [SubCatID] = @original_SubCatID AND (([SubCatName] = @original_SubCatName) OR ([SubCatName] IS NULL AND @original_SubCatName IS NULL)) AND (([SubCatPic] = @original_SubCatPic) OR ([SubCatPic] IS NULL AND @original_SubCatPic IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_SubCatID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SubCatName" Type="String" />
                        <asp:Parameter Name="SubCatPic" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="CatID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SubCatName" Type="String" />
                        <asp:Parameter Name="SubCatPic" Type="String" />
                        <asp:Parameter Name="original_SubCatID" Type="Decimal" />
                        <asp:Parameter Name="original_SubCatName" Type="String" />
                        <asp:Parameter Name="original_SubCatPic" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

