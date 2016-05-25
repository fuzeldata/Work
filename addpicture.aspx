<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="addpicture.aspx.cs" Inherits="addpicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 313px;
        }
        .style301
        {
            font-size: large;
        }
        .style302
        {
            font-size: x-large;
        }
        .style303
        {
            width: 313px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <h1 class="style301">
                    <strong class="style302">Add Product Pictures</strong></h1>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style303">
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
            <td class="style303">
                Choose Sub Category</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="SubCatName" 
                    DataValueField="SubCatID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT [SubCatID], [SubCatName] FROM [addsubcat] WHERE ([CatID] = @CatID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="CatID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style303">
                Choose Product</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="productname" 
                    DataValueField="productid" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    
                    SelectCommand="SELECT [productid], [productname] FROM [addproduct] WHERE (([subcatid] = @subcatid) AND ([catid] = @catid))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="subcatid" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="catid" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style303">
                Add Picture</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Add Picture" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table class="nav-justified">
                        <tr>
                            <td>
                                <strong>Already added pictures for this product</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="picid" DataSourceID="SqlDataSource4" Width="235px">
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="pic" DataImageUrlFormatString="uploads/{0}" 
                                            HeaderText="Picture">
                                            <ControlStyle Height="50px" />
                                        </asp:ImageField>
                                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" />
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                    ConflictDetection="CompareAllValues" 
                                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                                    DeleteCommand="DELETE FROM [addproductpic] WHERE [picid] = @original_picid AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL))" 
                                    InsertCommand="INSERT INTO [addproductpic] ([pic]) VALUES (@pic)" 
                                    OldValuesParameterFormatString="original_{0}" 
                                    onselected="SqlDataSource4_Selected" 
                                    SelectCommand="SELECT [picid], [pic] FROM [addproductpic] WHERE (([CatID] = @CatID) AND ([SubCatID] = @SubCatID) AND ([PID] = @PID))" 
                                    UpdateCommand="UPDATE [addproductpic] SET [pic] = @pic WHERE [picid] = @original_picid AND (([pic] = @original_pic) OR ([pic] IS NULL AND @original_pic IS NULL))">
                                    <DeleteParameters>
                                        <asp:Parameter Name="original_picid" Type="Decimal" />
                                        <asp:Parameter Name="original_pic" Type="String" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="pic" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="CatID" 
                                            PropertyName="SelectedValue" Type="Decimal" />
                                        <asp:ControlParameter ControlID="DropDownList2" Name="SubCatID" 
                                            PropertyName="SelectedValue" Type="Decimal" />
                                        <asp:ControlParameter ControlID="DropDownList3" Name="PID" 
                                            PropertyName="SelectedValue" Type="Decimal" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="pic" Type="String" />
                                        <asp:Parameter Name="original_picid" Type="Decimal" />
                                        <asp:Parameter Name="original_pic" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

