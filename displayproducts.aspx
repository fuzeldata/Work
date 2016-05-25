<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="displayproducts.aspx.cs" Inherits="displayproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        .style7
        {
            color: #000000;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
    
        <tr>
            <td align="center">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" 
                    DataSourceID="SqlDataSource1" RepeatColumns="4" width="100%">
                    
                    <ItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" width="300px" >
                        <table align="center" class="style2">
                            <tr>
                                <td style="padding:2px 0px;">
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="308px" 
                                        ImageUrl='<%# Eval("productimage", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' 
                                        Width="229px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding:2px 0px;">
                                    <asp:LinkButton ID="LinkButton11" runat="server" Font-Underline="False" 
                                        PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' 
                                        Text='<%# Eval("productname") %>' Font-Bold="True" Font-Strikeout="False" 
                                        Font-Size="Small"></asp:LinkButton>
                                </td>
                            </tr>
                            <tr align="center">
                                <td style="padding:2px 0px;">
                                   £
                                    <asp:Label ID="Label2" runat="server"  Text='<%# Eval("rate") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                        </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT [productid], [productname], [subcatid], [rate], [productimage] FROM [addproduct] WHERE ([subcatid] = @subcatid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="subcatid" QueryStringField="scid" 
                            Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

