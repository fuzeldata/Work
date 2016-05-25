<%@ Page Title="" Language="C#" MasterPageFile="~/MainPage.master" AutoEventWireup="true" CodeFile="Default8.aspx.cs" Inherits="Default8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            font-size: 18pt;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="arriv">
	   
		<div class="arriv-top">
        	 <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#myCarousel" data-slide-to="1"></li>
                      <li data-target="#myCarousel" data-slide-to="2"></li>
                    
                    </ol>
                
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                      <div class="item active">
                        <img src="images/slide3.jpg" alt="Chania" width="460" height="345">
                      </div>
                
                      <div class="item">
                        <img src="images/slide4.jpg" alt="Chania" width="460" height="345">
                      </div>
                    
                      <div class="item">
                        <img src="images/slide5.jpg" alt="Flower" width="460" height="345">
                      </div>
                
                      
                    </div>
                
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
        </div> <div class="about">
                Welcome to Amclo Online Store. Here you can buy variety of products at reasonable rates. We have variuos products to suit everyone. Please explore to find your suitable product.

	    </div>
        <div class="clearfix"></div>
        <div class="arriv-las">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3"  Width="100%" CellSpacing="10" >
                    <ItemTemplate>
                    <div class="col-md-12 arriv-left2"><table width="100%"><tr>
                        <td align="center">
                            <asp:ImageButton ID="ImageButton1" runat="server"  
                                        ImageUrl='<%# Eval("Catpic", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("catid", "displaysubcategory.aspx?cid={0}") %>' 
                                        style="width:100%;max-height:360px;height:260px;min-height:360px;margin:0px auto;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <div class="arriv-info2">
				<asp:LinkButton ID="LinkButton11" runat="server" PostBackUrl='<%# Eval("catid", "displaysubcategory.aspx?cid={0}") %>' 
                                        Text='<%# Eval("catname") %>'></asp:LinkButton>
                                       
                                    </div>
                                </td>
                            </tr>
                        </table>
                      </div>
                    </ItemTemplate>
                </asp:DataList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT  * FROM [addcat]"></asp:SqlDataSource>
            </div>

        </div>

     <div class="special">
		<h3>
            Various Products
		</h3>
		<div class="specia-top">
			<ul class="grid_2">
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="4"  Width="100%" CellSpacing="10">
                    <ItemTemplate>
                    <li>
				               <table width="100%">
                                <tr>
                                    <td>
                            <asp:ImageButton ID="ImageButton1" runat="server"  
                                        ImageUrl='<%# Eval("ProductImage", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' 
                                        style="width:100%;max-height:360px;height:260px;min-height:360px;margin:0px auto;" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="special-info grid_1 simpleCart_shelfItem">
					                        <h5>
				<asp:LinkButton ID="LinkButton11" runat="server" PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' 
                                        Text='<%# Eval("productName") %>'></asp:LinkButton></h5>
                                        <div class="item_add"><span class="item_price">
                                            <h6>
                                                £<asp:Label ID="Label1" runat="server" Text='<%# Eval("rate") %>'></asp:Label></h6></span></div>
					                        <div class="item_add"><span class="item_price">
                                       <asp:LinkButton ID="LinkButton12" runat="server" PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>'>add to cart</asp:LinkButton></span></div>
				                        </div>
                                    
                                </td>
                            </tr>
                        </table>
                      </li>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT   top 8 * FROM [addproduct] order by newid();"></asp:SqlDataSource>
                </ul>
            </div>
     
        </div>    
                    
                
            
        
</asp:Content>

