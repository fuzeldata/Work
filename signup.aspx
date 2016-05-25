<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style6
    {
        width: 163px;
    }
    .style7
    {
        width: 257px;
    }
    .style8
    {
        width: 258px;
    }
        .style9
        {
            width: 257px;
            text-align: left;
        }
        .style10
        {
            width: 163px;
            text-align: left;
        }
        .style11
        {
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style2" >
    <tr>
        <td class="style6">
            <h2>
                <strong class="style11">SignUp</strong></h2>
        </td>
        <td class="style7">
            &nbsp;</td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            &nbsp;</td>
        <td class="style7">
            &nbsp;</td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Name</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="* This information is required" 
                ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
        <td align="center" rowspan="8">
            <asp:Image ID="Image2" runat="server" Height="186px" 
                ImageUrl="~/imgs/sign-up.jpg" Width="222px" />
        </td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Address</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <strong>City</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <strong>State</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Phone</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox5" ErrorMessage="Phone number should be of 10 digits" 
                ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Email ID(Username)</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox6" ErrorMessage="Please enter in proper format" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Password</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="style8">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Confirm Password</strong></td>
        <td class="style7">
            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td class="style8">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox7" ControlToValidate="TextBox8" 
                ErrorMessage="Password doesn't match"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Country</strong></td>
        <td class="style7">
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Choose your country</asp:ListItem>
                <asp:ListItem>India</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>
                <asp:ListItem>USA</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Image</strong></td>
        <td class="style7">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style10">
            <strong>Gender</strong></td>
        <td class="style9">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="20px" 
                RepeatDirection="Horizontal" Width="252px">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            Security Question</td>
        <td class="style7">
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>What is your pet name?</asp:ListItem>
                <asp:ListItem>Who is favourite actor?</asp:ListItem>
                <asp:ListItem>Who was your first teacher?</asp:ListItem>
                <asp:ListItem>What was the make of your first vehicle?</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            Security Answer</td>
        <td class="style7">
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            &nbsp;</td>
        <td class="style7">
            <asp:Button ID="Button1" runat="server" Text="Sign Up" 
                onclick="Button1_Click" />
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            &nbsp;</td>
        <td class="style7">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
        <td class="style8">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style6">
            &nbsp;</td>
        <td colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                DisplayMode="List" ShowMessageBox="True" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

