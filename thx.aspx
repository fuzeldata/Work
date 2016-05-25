<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="thx.aspx.cs" Inherits="thx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
        .style2
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2" width="100%">
        <tr>
            <td align="center">
                <span class="style2"><strong class="style1">Thanks for signing up</strong></span>.<br />
                <asp:Image ID="Image1" src="images/thanks.jpg" runat="server" class="img-responsive"/>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

