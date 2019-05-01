<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>



            <div role="main">
                <div class="page-padding cf shop-header-style2">
                    <h1 class="thb-shop-title">Shop</h1>
                </div>
                <div class="shop_bar">
                    <div class="row">
                        <div class="small-12 medium-1 columns" style="margin-top: 13px">
                            FILTER :
                        </div>
                        <div class="small-12 medium-7 columns">
                            <asp:DropDownList ID="DropDownList1" Style="margin-left: 10px" runat="server" Width="300" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <asp:DropDownList ID="DropDownList2" Style="margin-left: 10px" runat="server" Width="300" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="small-12 medium-1 columns" style="margin-top: 13px">
                            SORT BY : 
                        </div>
                        <div class="small-12 medium-3 columns">
                            <asp:DropDownList ID="ddsort" Style="margin-left: 10px" runat="server" Width="300" OnSelectedIndexChanged="ddsort_SelectedIndexChanged" AutoPostBack="true"  ></asp:DropDownList>
                        </div>

                        <%--<div class=" small-offset-6 small-6 columns ordering">
                        <p class="woocommerce-result-count">
                            Showing 1&ndash;12 of 30 results
                        </p>
                        <select name="orderby" class="orderby">
                            <option value="menu_order" selected='selected'>Default sorting</option>
                            <option value="popularity">Sort by popularity</option>
                            <option value="rating">Sort by average rating</option>
                            <option value="date">Sort by newness</option>
                            <option value="price">Sort by price: low to high</option>
                            <option value="price-desc">Sort by price: high to low</option>
                        </select>
                        <input type="hidden" name="shop_product_listing_layout" value="style1" /><input type="hidden" name="products_per_row" value="large-3" /><input type="hidden" name="products_per_page" value="12" />
                    </div>--%>
                    </div>
                </div>
                <div class="row">
            <div class="small-12 columns text-center">
                <ul class="products row thb-main-products">
                    <asp:Repeater ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <li class="small-6 large-3 columns thb-listing-style2 post-105 product type-product status-publish has-post-thumbnail product_cat-women product_tag-dress product_tag-long product_tag-sleeve product_tag-strip last instock taxable shipping-taxable purchasable product-type-simple">
                                <a href="ProductProfile.aspx?PID=<%# Eval("ProductId") %>" title="<%# Eval("Name") %>">
                                    <figure class="product_thumbnail thb_hover">
                                        <span class="product_thumbnail_hover">
                                            <img src="Gallery/<%# Eval("Product_Image2") %>" style="height:280px;border-radius:12px" alt="Image Problem" />
                                        </span>
                                        <img src="Gallery/<%# Eval("Product_Image") %>" style="height:280px;border-radius:12px"  alt="Image Problem" />
                                    </figure>
                                </a>
                                <h3>
                                    <div class="large-offset-2">
                                    <a style="text-transform:capitalize;" href="#" title="<%# Eval("Name") %>"><%# Eval("Name") %></a>
                                        </div>
                                </h3>
                                <div class="product_after_title">
                                    <div class="product_after_shop_loop_price">
                                        <div class="large-offset-2">
                                        <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><%# Eval("Price") %></span></span>
                                            </div>
                                    </div>

                                    <div class="product_after_shop_loop_buttons">
                                        <div class="large-offset-2">
                                        <asp:LinkButton ID="lbaddtocart" rel="nofollow" class="button product_type_simple add_to_cart_button ajax_add_to_cart" runat="server" CommandName="addtocart" CommandArgument='<%# Eval("ProductId") %>'>Add to cart</asp:LinkButton>
                                            </div>
                                        <%--<a style="margin-left:40px" rel="nofollow" href="indexf41b.html?shop_product_listing_layout=style1&amp;products_per_row=large-3&amp;products_per_page=12&amp;add-to-cart=105" data-quantity="1" data-product_id="105" data-product_sku="54687" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>--%>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <%-- <nav class="woocommerce-pagination">
                        <ul class='page-numbers'>
                            <li><span aria-current='page' class='page-numbers current'>1</span></li>
                            <li><a class='page-numbers' href='page/2/indexa369.html?shop_product_listing_layout=style1&amp;products_per_row=large-3&amp;products_per_page=12'>2</a></li>
                            <li><a class='page-numbers' href='page/3/indexa369.html?shop_product_listing_layout=style1&amp;products_per_row=large-3&amp;products_per_page=12'>3</a></li>
                            <li><a class="next page-numbers" href="page/2/indexa369.html?shop_product_listing_layout=style1&amp;products_per_row=large-3&amp;products_per_page=12">Next &rarr;</a></li>
                        </ul>
                    </nav>--%>
            </div>
        </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

