<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="displaysubcategory.aspx.cs" Inherits="displaysubcategory"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
      
        <tr>
            <td align="center">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="SubCatID" 
                    DataSourceID="SqlDataSource1" RepeatColumns="4" width="100%">
                    <ItemTemplate>
                    <table align="center" cellpadding="0" cellspacing="0" width="292px">
                        <table align="center" class="style2">
                            <tr valign="top">
                                <td style="padding:0px 0px;">
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="352px" 
                                        ImageUrl='<%# Eval("SubCatPic", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("SubCatID", "displayproducts.aspx?scid={0}") %>' 
                                        Width="262px" />
                                </td>
                            </tr>
                            <tr align="center" valign="top">
                                <td style="padding:0px 0px;">
                                    <asp:LinkButton ID="LinkButton11" runat="server" Font-Underline="False" 
                                        PostBackUrl='<%# Eval("SubCatID", "displayproducts.aspx?scid={0}") %>' 
                                        Text='<%# Eval("SubCatName") %>' Font-Size="Medium"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT * FROM [addsubcat] WHERE ([CatID] = @CatID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CatID" QueryStringField="cid" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

