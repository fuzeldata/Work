<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="globalsearch.aspx.cs" Inherits="globalsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: medium;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="nav-justified">
        <tr>
            <td align="center">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" 
                    DataSourceID="SqlDataSource1" RepeatColumns="4" Width="100%">
                    <ItemTemplate>
                        <table align="center" cellpadding="0" cellspacing="1" width="200px">
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="225px" 
                                        ImageUrl='<%# Eval("productimage", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' Width="182px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" 
                                        Font-Strikeout="False" Font-Underline="False"  
                                        PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' 
                                        Text='<%# Eval("productname") %>'></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    £
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("rate") %>' 
                                        Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:Label ID="Label3" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    
                    
                    SelectCommand="SELECT addproduct.productid, addproduct.productname, addproduct.productimage, addproduct.rate FROM addcat INNER JOIN addproduct ON addcat.CatID = addproduct.catid INNER JOIN addsubcat ON addproduct.subcatid = addsubcat.SubCatID INNER JOIN brand ON addproduct.brandid = brand.BID WHERE (addproduct.productname LIKE '%' + @pname + '%') OR (addcat.CatName=@cname + '%') OR (addsubcat.SubCatName LIKE '%' + @scname + '%') OR (brand.BName LIKE '%' + @bname + '%')" 
                    onselected="SqlDataSource1_Selected">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="null" Name="pname" 
                            QueryStringField="s" />
                        <asp:QueryStringParameter DefaultValue="null" Name="cname" 
                            QueryStringField="s" />
                        <asp:QueryStringParameter DefaultValue="null" Name="scname" 
                            QueryStringField="s" />
                        <asp:QueryStringParameter DefaultValue="null" Name="bname" 
                            QueryStringField="s" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

