<%@ Page Title="" Language="C#" MasterPageFile="~/Mainpage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="arriv">
	<div class="container">
		<div class="arriv-top">
        	 <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#myCarousel" data-slide-to="1"></li>
                      <li data-target="#myCarousel" data-slide-to="2"></li>
                      <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>
                
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                      <div class="item active">
                        <img src="images/1.jpg" alt="Chania" width="460" height="345">
                      </div>
                
                      <div class="item">
                        <img src="images/2.jpg" alt="Chania" width="460" height="345">
                      </div>
                    
                      <div class="item">
                        <img src="images/4.jpg" alt="Flower" width="460" height="345">
                      </div>
                
                      <div class="item">
                        <img src="images/7.jpg" alt="Flower" width="460" height="345">
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
        </div>
		<div class="arriv-las">
			<asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" 
                    DataSourceID="SqlDataSource1" RepeatColumns="4"  Width="100%">
                    <ItemTemplate>
                    <div class="col-md-12 arriv-left2"><table><tr>
                        <td>
                            <asp:ImageButton ID="ImageButton1" runat="server"  
                                        ImageUrl='<%# Eval("ProductImage", "uploads/{0}") %>' 
                                        PostBackUrl='<%# Eval("productid", "detailsp.aspx?pid={0}") %>' 
                                        style="width:100%;max-height:360px;height:260px;min-height:360px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                         <div class="arriv-info2">
					<a href="details.aspx"><h3>Casual Glasses<i class="ars"></i></h3></a>
				</div>
                        </td>
                    </tr>
                   </table>
            </div>
				
				
			
		</ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MyConnectionString %>" 
                    SelectCommand="SELECT   top 8 * FROM [addproduct] order by newid();"></asp:SqlDataSource>
			
		</div>
		
	</div>
</div>
    <div class="special">
	<div class="container">
		<h3>Special Offers</h3>
		<div class="specia-top">
			<ul class="grid_2">
                 <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" 
                DataSourceID="SqlDataSource1" >
                    <ItemTemplate>
		                <li>
				               <table>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server"  
                            ImageUrl='<%# Eval("productimage", "uploads/{0}") %>'  style="width:100%;max-height:360px;height:260px;min-height:360px"
                             /></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         <div class="special-info grid_1 simpleCart_shelfItem">
					                        <h5><asp:Label ID="Label1" runat="server" Text='<%# Eval("productname") %>'></asp:Label></h5>
					                        <div class="item_add"><span class="item_price">
                                            <h6><asp:Label ID="Label2" runat="server" Text='<%# Eval("productname") %>'></asp:Label></h6></span></div>
					                        <div class="item_add"><span class="item_price"><asp:LinkButton ID="LinkButton1" 
                            runat="server" PostBackUrl='<%# Eval("productid") %>'>LinkButton</asp:LinkButton></span></div>
				                        </div>
                                    </td>
                                </tr>
                               
                               </table>
				               
		                </li>
    </ItemTemplate>
                </asp:DataList>
		    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT top 6 [productid], [productname], [productimage] FROM [addproduct]">
            </asp:SqlDataSource>

                </ul>
            </div>
        </div>
        </div>
</asp:Content>

