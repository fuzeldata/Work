<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="addcoupon.aspx.cs" Inherits="addcoupon" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style301
        {
            width: 291px
        }
        .style302
        {
            width: 291px;
            font-weight: bold;
        }
        .style303
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="nav-justified">
        <tr>
            <td class="style301">
                <strong class="style303">Add discount coupon</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td class="style302">
                Coupon Code</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style302">
                Minimum Cart Value</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style302">
                Discount Percent</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="TextBox4_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="TextBox4">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Add Coupon" />
            </td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;</td>
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
                &nbsp;</td>
            <td>
                <strong>Already added coupons</strong></td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="CouponID" DataSourceID="SqlDataSource1" Width="566px">
                    <Columns>
                        <asp:BoundField DataField="CouponName" HeaderText="CouponName" 
                            SortExpression="CouponName" />
                        <asp:BoundField DataField="MinCartValue" HeaderText="Minimum CartValue" 
                            SortExpression="MinCartValue" />
                        <asp:BoundField DataField="CouponPercent" HeaderText="Discount Percent" 
                            SortExpression="CouponPercent" />
                        <asp:CommandField HeaderText="Edit/Delete" ShowDeleteButton="True" 
                            ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    DeleteCommand="DELETE FROM [addcoupon] WHERE [CouponID] = @original_CouponID" 
                    InsertCommand="INSERT INTO [addcoupon] ([CouponName], [MinCartValue], [CouponPercent]) VALUES (@CouponName, @MinCartValue, @CouponPercent)" 
                    OldValuesParameterFormatString="original_{0}" 
                    onselected="SqlDataSource1_Selected" SelectCommand="SELECT * FROM [addcoupon]" 
                    UpdateCommand="UPDATE [addcoupon] SET [CouponName] = @CouponName, [MinCartValue] = @MinCartValue, [CouponPercent] = @CouponPercent WHERE [CouponID] = @original_CouponID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CouponID" Type="Decimal" />
                        <asp:Parameter Name="original_CouponName" Type="String" />
                        <asp:Parameter Name="original_MinCartValue" Type="Decimal" />
                        <asp:Parameter Name="original_CouponPercent" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CouponName" Type="String" />
                        <asp:Parameter Name="MinCartValue" Type="Decimal" />
                        <asp:Parameter Name="CouponPercent" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CouponName" Type="String" />
                        <asp:Parameter Name="MinCartValue" Type="Decimal" />
                        <asp:Parameter Name="CouponPercent" Type="Decimal" />
                        <asp:Parameter Name="original_CouponID" Type="Decimal" />
                        <asp:Parameter Name="original_CouponName" Type="String" />
                        <asp:Parameter Name="original_MinCartValue" Type="Decimal" />
                        <asp:Parameter Name="original_CouponPercent" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style301">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

