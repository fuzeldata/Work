<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style6
    {
        width: 738px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2">
    <tr>
        <td class="style6" valign="top">
            Welcome to ShoppingWorld.com. Here you can buy variety of products at reasonable 
            rates.</td>
        <td align="center">
            <asp:Image ID="Image2" runat="server" Height="140px" 
                ImageUrl="~/imgs/thinkstock_man_woman_shopping_w_digital_device.jpg" 
                Width="217px" />
        </td>
    </tr>
</table>
</asp:Content>

