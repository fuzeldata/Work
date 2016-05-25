<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="adminpanel.aspx.cs" Inherits="adminpanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style301
        {
            width: 242px
        }
        .style302
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width=100%>
        <tr>
            <td class="style301">
                <h1>
                    <strong class="style302">Welcome Admin</strong></h1>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style301">
                <li><asp:LinkButton ID="LinkButton11" runat="server" onclick="LinkButton11_Click">Add Category</asp:LinkButton></li>
            </td>
            <td>
                <li><asp:LinkButton ID="LinkButton12" runat="server" onclick="LinkButton12_Click">Add Sub Category</asp:LinkButton></li>
                        </td>
        </tr>
        <tr>
            <td class="style301">
                <li>
                        <asp:LinkButton ID="LinkButton17" runat="server" onclick="LinkButton17_Click">Add Brand</asp:LinkButton> 
                </li>
            </td>
            <td class="style302">
                <li>
                    <asp:LinkButton ID="LinkButton13" runat="server" onclick="LinkButton13_Click">Add Products</asp:LinkButton></li>
            </td>
        </tr>
        <tr>
            <td class="style301">
                <li>
                <asp:LinkButton ID="LinkButton19" runat="server" onclick="LinkButton19_Click">Add Color</asp:LinkButton></li>
            </td>
            <td class="style304">
                <li><asp:LinkButton ID="LinkButton14" runat="server" onclick="LinkButton14_Click">Add Product Picture</asp:LinkButton></li>
            </td>
        </tr>
        <tr>
            <td class="style301">
               
              <li><asp:LinkButton ID="LinkButton16" runat="server" onclick="LinkButton16_Click">Update SubCategory</asp:LinkButton></li>
              
            </td>
            <td class="style306">
                <li></linkbutton>
                        <asp:LinkButton ID="LinkButton15" runat="server" onclick="LinkButton15_Click">Add Size</asp:LinkButton> 
                </li>
            </td>
        </tr>
        <tr>
            <td class="style301">
                     <li>   <asp:LinkButton ID="LinkButton18" runat="server" onclick="LinkButton18_Click">Update Products</asp:LinkButton></li>
            </td>
            <td class="style306">
            <li>
                <asp:LinkButton ID="LinkButton20" runat="server" onclick="LinkButton20_Click">View Orders</asp:LinkButton>
                </li>
            </td>
        </tr>
        <tr>
            <td class="style301">
               <li> <asp:LinkButton ID="LinkButton21" runat="server" onclick="LinkButton21_Click">Add Stock</asp:LinkButton></li>
            </td>
            <td class="style306">
                <li><asp:LinkButton ID="LinkButton22" runat="server" onclick="LinkButton22_Click">Low Stock</asp:LinkButton></li>
            </td>
        </tr>
        <tr>
            <td class="style301">
              <li><asp:LinkButton ID="LinkButton23" runat="server" onclick="LinkButton23_Click">Add Coupon Code</asp:LinkButton></li>
            </td>
            <td class="style306">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

