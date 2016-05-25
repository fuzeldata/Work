<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="updatesubcatdetails.aspx.cs" Inherits="updatesubcatdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
        }
        .style301
        {
            font-size: x-large;
        }
        .style302
        {
            width: 206px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td class="style6" colspan="2">
                <h2>
                    <strong class="style301">Update Sub Category Details</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="style302">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style302">
                <strong>Choose Category</strong></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="CatName" DataValueField="CatID" 
                    ondatabound="DropDownList1_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT [CatID], [CatName] FROM [addcat]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style302">
                <strong>Sub Category Name</strong></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style302">
                <strong>Sub Category Picture</strong></td>
            <td>
                <asp:Image ID="Image2" runat="server" Height="142px" Width="98px" />
                <br />
                Choose new image, if required<br />
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style302">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Update" />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Back" />
            </td>
        </tr>
        <tr>
            <td class="style302">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="#000066"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

