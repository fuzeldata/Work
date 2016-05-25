<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="detailsp.aspx.cs" Inherits="detailsp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 160px;
      margin: auto;
  }
        .style1
        {
            font-size: medium;
        }
        .style2
        {
            color: #000000;
        }
        select.size {
	display: block;
	list-style-type: none;
	width:300px;
	height:60px;
	margin-right: auto;
	margin-left: auto;
	border:none;
	background:none;
}
#selectboxouter
{
	width:260px;
	overflow:hidden;
	
}
.size option {
	
	display:inline-block;
	height: 40px;
	width: 40px;
	margin-right: 10px;
	
	text-align: center;
	padding-top: 10px;
	border: 1px solid #666;
	padding-right: 5px;
	padding-left: 5px;
}
.headingbig
{
	font-size:2em;
}
.headingshort
{
	font-size:1.5em;
}.boxcenter {
	height: 50px;
	width: 50px;
	margin-right: auto;
	margin-left: auto;
	margin-top:50px;
	position: relative;
	opacity:0.7;
}
.select select:after
{
	content:'';
	width:20px;position:absolute;z-index:2;
}

	form .form-select {
	width: 100px;
}
  </style>
  
  <!-- zoom -->

  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="women_main">
	<!-- start content -->
			<div class="row single">
				<div class="col-md-12 det">
				  <div class="single_left">
					<div class="grid images_3_of_2">
						<ul id="etalage">
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
						</ul>
						 <div class="clearfix"></div>		
				  </div>
				  <div class="desc1 span_3_of_2">
					<h3><asp:Label ID="Label5" runat="server" ></asp:Label></h3>
					<span class="brand">Brand:  <asp:Label ID="Label4" runat="server"  ></asp:Label></span>
					<br>
					
						<div class="price">
							<span class="text">Price:</span>
							<span class="price-new">£<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
               ></asp:Label>
                  </span><span class="price-old">£<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" 
                Font-Strikeout="True"></asp:Label></span> 
							<span class="price-tax">Discount:  <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Medium" 
                 Font-Strikeout="False"></asp:Label></span><br>
							<br>
						</div>
					<div class="det_nav1">
						
							<div class=" sky-form col col-4">
								<div id="selectboxouter">Colour
     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        Width="134px" DataSourceID="SqlDataSource1" DataTextField="colorname" 
        DataValueField="colorid">
    </asp:DropDownList>
                                    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT DISTINCT addcolor.colorname, addsize.colorid FROM addcolor INNER JOIN addsize ON addcolor.colorid = addsize.colorid WHERE (addsize.PID = @pid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="pid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        SelectCommand="SELECT addproduct.rate, addproduct.description, addproduct.productimage, addproduct.productid, addproduct.productname, brand.BName FROM addproduct INNER JOIN brand ON addproduct.brandid = brand.BID WHERE (addproduct.productid = @pid)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="null" Name="pid" 
                QueryStringField="pid" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

   <p style="font-size:17px;">Select a size :</p>
                                    <asp:ListBox ID="ListBox1" runat="server" CssClass="size" 
        DataSourceID="SqlDataSource2" DataTextField="size" DataValueField="size" 
        AutoPostBack="True" onselectedindexchanged="ListBox1_SelectedIndexChanged">
    </asp:ListBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please choose size" ControlToValidate="ListBox1"></asp:RequiredFieldValidator>
                                    <br />
                                    <br />
    Quantity<asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:DropDownList>
&nbsp; Stock
    <asp:Label ID="Label6" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label9" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
        
        SelectCommand="SELECT size FROM addsize WHERE (colorid = @colorid) AND (PID = @pid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="colorid" 
                PropertyName="SelectedValue" Type="Decimal" />
            <asp:QueryStringParameter Name="pid" QueryStringField="pid" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
							</div>
					</div>
					<div class="btn_form">
						  <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" 
        Text="Add to Cart" onclick="Button1_Click" />
					</div>
					
					
			   	 </div>
          	    <div class="clearfix"></div>
          	   </div>
          	    <div class="single-bottom1">
					<p><asp:Label ID="Label3" runat="server" Font-Size="Medium" ></asp:Label></p>
				</div>
				
	       </div>	
	
		   <div class="clearfix"></div>		
	  </div>
	<!-- end content -->
</div>

    
    
</asp:Content>

