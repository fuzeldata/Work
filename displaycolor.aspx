<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="displaycolor.aspx.cs" Inherits="displaycolor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 244px;
        }
        .style301
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <h1>
                    <strong class="style301">Add Color</strong></h1>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Color name</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Add Color" />
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="colorid" DataSourceID="SqlDataSource1" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="colorname" HeaderText="Colour Name" 
                            SortExpression="colorname" />
                        <asp:CommandField HeaderText="Edit/Delete" ShowDeleteButton="True" 
                            ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    DeleteCommand="DELETE FROM [addcolor] WHERE [colorid] = @original_colorid" 
                    InsertCommand="INSERT INTO [addcolor] ([colorname]) VALUES (@colorname)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [addcolor]" 
                    UpdateCommand="UPDATE [addcolor] SET [colorname] = @colorname WHERE [colorid] = @original_colorid">
                    <DeleteParameters>
                        <asp:Parameter Name="original_colorid" Type="Decimal" />
                        <asp:Parameter Name="original_colorname" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="colorname" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="colorname" Type="String" />
                        <asp:Parameter Name="original_colorid" Type="Decimal" />
                        <asp:Parameter Name="original_colorname" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

