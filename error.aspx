<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
        <tr>
            <td>
                Please login to access the page. Click
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/login.aspx">here</asp:HyperLink>
&nbsp;to login.</td>
        </tr>
    </table>
</asp:Content>

