<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="displaycategory.aspx.cs" Inherits="displaycategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td align="center">
                <h1 align="center" class="style1">
                    &nbsp;</h1>
            </td>
        </tr>
        <tr>
            <td align="center" height="200" width="180">
                &nbsp;<asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" 
                    DataSourceID="SqlDataSource1" RepeatColumns="4"  Width="100%">
                    <ItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="1" width="293px">
                        <table align="center" class="style2">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server"  
                                        ImageUrl='<%# Eval("CatPic", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("CatID", "displaysubcategory.aspx?cid={0}") %>' 
                                        Width="261px" Height="356px" />
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    <asp:LinkButton ID="LinkButton11" runat="server" Font-Underline="False" 
                                        PostBackUrl='<%# Eval("CatID", "displaysubcategory.aspx?cid={0}") %>' 
                                        Text='<%# Eval("CatName") %>'></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT * FROM [addcat]"></asp:SqlDataSource>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

