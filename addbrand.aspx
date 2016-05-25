<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="addbrand.aspx.cs" Inherits="addbrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style301
        {
            font-weight: bold;
        }
        .style302
        {
            width: 147px;
        }
        .style303
        {
            font-size: large;
        }
        .style304
        {
            width: 147px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="mycontent">
            
        <table width="100%" >      <tr>
            <td class="style302">
                <h1>
                    <strong class="style303">Add Brand</strong></h1>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style304">
                Brand Name</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style304">
                Brand Logo</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style302">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add Brand" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td class="style301" colspan="2">
                <h2 class="style301">
                    Already added brands</h2>
            </td>
        </tr>
        <tr>
            <td class="style6" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="BID" DataSourceID="SqlDataSource1" AllowPaging="True" 
                    PageSize="5" Width="311px" onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Picture">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("BLogo") %>' 
                                    Visible="False"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Eval("BLogo", "uploads/{0}") %>' />
                            </ItemTemplate>
                            <ControlStyle Height="50px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="BName" HeaderText="BrandName" 
                            SortExpression="BName" />
                        <asp:CommandField EditText="Edit /" HeaderText="Edit/Delete" 
                            ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT * FROM [brand]" ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [brand] WHERE [BID] = @original_BID" 
                    InsertCommand="INSERT INTO [brand] ([BName], [BLogo]) VALUES (@BName, @BLogo)" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE [brand] SET [BName] = @BName, [BLogo] = @BLogo WHERE [BID] = @original_BID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_BID" Type="Decimal" />
                        <asp:Parameter Name="original_BName" Type="String" />
                        <asp:Parameter Name="original_BLogo" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="BName" Type="String" />
                        <asp:Parameter Name="BLogo" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="BName" Type="String" />
                        <asp:Parameter Name="BLogo" Type="String" />
                        <asp:Parameter Name="original_BID" Type="Decimal" />
                        <asp:Parameter Name="original_BName" Type="String" />
                        <asp:Parameter Name="original_BLogo" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </div>
    
</asp:Content>

