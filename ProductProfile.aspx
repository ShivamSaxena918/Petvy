<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="ProductProfile.aspx.cs" Inherits="ProductProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <style type="text/css">
        .Star {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }

        .WaitingStar {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }

        .FilledStar {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
    <div role="main">
        <div id="product-55" class="page-padding thb-product-detail thb-product-style1 post-55 product type-product status-publish has-post-thumbnail product_cat-women product_tag-blue product_tag-classic product_tag-stylish first instock taxable shipping-taxable purchasable product-type-simple">

            <div class="row align-center" style="margin-top: 50px">
                <div class="small-12 large-6 columns">
                    <div class="row">
                        <div class="large-2 columns small-order-2 large-order-1 product-thumbnail-container">
                            <div id="product-thumbnails" class="product-thumbnails carousel slick" data-navigation="false" data-autoplay="false" data-columns="4" data-asnavfor="#product-images" data-infinite="false">
                                <div class="first woocommerce-product-gallery__image">
                                    <asp:Image ID="imgfirstthumb" runat="server" Width="100" Height="100" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="" />
                                    <%--<img width="150" height="150" src="../../wp-content/uploads/sites/4/2017/08/z-1-150x150.jpg" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="" />--%>
                                </div>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <div class="woocommerce-product-gallery__image">
                                            <img style="height: 100px; width: 100px" src='Gallery/<%# Eval("URL") %>' class="attachment-shop_single size-shop_single wp-post-image" alt="" title="z-1" data-caption="" /></a>
                                            <%--<asp:Image ID="imgscc" runat="server" Width="150" Height="110" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="" />--%>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="woocommerce-product-gallery woocommerce-product-gallery--with-images woocommerce-product-gallery--columns-4 images small-12 large-10 columns small-order-1 large-order-2" data-columns="4">
                            <figure id="product-images" class="woocommerce-product-gallery__wrapper product-images carousel slick" data-navigation="true" data-autoplay="false" data-columns="1" data-asnavfor="#product-thumbnails">
                                <div class="first woocommerce-product-gallery__image">
                                    <a href="Gallery/z20-1.jpg">
                                        <asp:Image ID="imgfirst" runat="server" Style="height: 450px; width: 450px" CssClass="attachment-shop_single size-shop_single wp-post-image" alt="" />
                                    </a>
                                </div>
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <div class="first woocommerce-product-gallery__image">
                                            <a href="Gallery/z20-2.jpg">
                                                <img style="height: 450px; width: 450px" src='Gallery/<%# Eval("URL") %>' class="attachment-shop_single size-shop_single wp-post-image" alt="" title="z-1" data-caption="" /></a>
                                        </div>
                                        <%-- <div data-thumb="Gallery/z20-3.jpg" class="first woocommerce-product-gallery__image">
                                            <a href="Gallery/z20-3.jpg">
                                                <img width="1000" height="1250" src="Gallery/z20-3.jpg" class="attachment-shop_single size-shop_single wp-post-image" alt="" title="z-1" data-caption="" sizes="(max-width: 1000px) 100vw, 1000px" /></a>
                                        </div>--%>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </figure>
                        </div>
                    </div>
                </div>
                <div class="small-12 large-4 columns product-information">

                    <div class="summary entry-summary">

                        <h1 class="product_title entry-title">
                            <asp:Label ID="lblproductname" runat="server" Text="Label"></asp:Label></h1>
                        <p class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblprice" runat="server" Text="Label"></asp:Label></span></p>
                        <div class="woocommerce-product-details__short-description">
                            <div class="woocommerce-product-details__short-description">
                                <b>
                                    <p>
                                        <asp:Label ID="lbldesc" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </b>
                            </div>
                        </div>


                    </div>

                    <div class="quantity">
                        <label class="screen-reader-text" for="quantity_5a9232140666c">Quantity</label>
                        <input type="number" id="txtquantity" runat="server" class="input-text qty text" step="1" min="1" max="" value="1" title="Qty" size="4" pattern="[0-9]*" inputmode="numeric" />
                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Add to cart" class="single_add_to_cart_button button alt" OnClick="Button1_Click" />
                    
                    <div class="product_meta">
                        <span class="posted_in">Category: <a href="#" rel="tag">
                            <asp:Label ID="lblcategory" runat="server" Text="Label"></asp:Label></a></span>
                        <span class="tagged_as">Tags:blue,classic,stylish</span>
                    </div>
                    <asp:PlaceHolder ID="plBarCode" runat="server" />

                </div>

            </div>
        </div>
        <div class="row align-center">
            <div class="small-12 medium-10 large-7 columns">
                <div class="woocommerce-tabs wc-tabs-wrapper">
                    <ul class="tabs wc-tabs" role="tablist">
                        <li class="additional_information_tab" id="tab-title-additional_information" role="tab" aria-controls="tab-additional_information">
                            <a href="#tab-additional_information">Additional information</a>
                        </li>
                        <li class="reviews_tab" id="tab-title-reviews" role="tab" aria-controls="tab-reviews">
                            <a href="#tab-reviews">Ratings (<asp:Label ID="lblreviewcount" runat="server" Text="Label"></asp:Label>)</a>
                        </li>
                    </ul>

                    <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--additional_information panel entry-content wc-tab" id="tab-additional_information" role="tabpanel" aria-labelledby="tab-title-additional_information">

                        <h2>Additional information</h2>

                        <table class="shop_attributes">
                            <tr>
                                <th>Price</th>
                                <td class="product_weight">
                                    <asp:Label ID="lblpprice" runat="server" Text="Label"></asp:Label></td>
                            </tr>


                            <tr>
                                <th>Model Number</th>
                                <td>
                                    <p>
                                        <asp:Label ID="lblmno" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>Seller Name </th>
                                <td>
                                    <p>
                                        <asp:Label ID="lblsellname" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>Menufectured Date</th>
                                <td>
                                    <p>
                                        <asp:Label ID="lblmfd" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th>Expiry Date</th>
                                <td>
                                    <p>
                                        <asp:Label ID="lblexp" runat="server" Text="Label"></asp:Label>
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--reviews panel entry-content wc-tab" id="tab-reviews" role="tabpanel" aria-labelledby="tab-title-reviews">
                        <div id="reviews" class="woocommerce-Reviews">
                            <div id="comments">
                                <h2 class="woocommerce-Reviews-title">Reviews</h2>


                                <p class="woocommerce-noreviews">
                                    Number Of Review Available :<asp:Label ID="lblavai" runat="server" Text="Label"></asp:Label>
                                </p>

                            </div>


                            <div id="review_form_wrapper">
                                <div id="review_form">
                                    <div id="respond" class="comment-respond">
                                        <span id="reply-title" class="comment-reply-title">
                                            <asp:Label ID="lblstat" runat="server" Text="Label"></asp:Label></span>

                                        <div class="comment-form-rating" style="margin-left: 180px">
                                            <%--<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                            </cc1:ToolkitScriptManager>
                                            <cc1:Rating ID="Rating1" AutoPostBack="false" OnChanged="Rating1_Changed" runat="server"
                                                StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
                                                FilledStarCssClass="FilledStar">
                                            </cc1:Rating>--%>
                                            <h5>
                                                <asp:Label ID="lblexist" runat="server" Visible="false" ForeColor="Red"></asp:Label></h5>
                                            <h5>
                                                <asp:Label ID="lblerr" runat="server" Visible="false" Text="To rate this product you have to Login/Register first"></asp:Label></h5>
                                            <br />

                                        </div>
                                        <div style="margin-top:20px">
                                            Average Rating Of This Product is 
                                            <br />
                                            <h1 class="text-center">
                                                <asp:Label ID="Label1" runat="server" Text="3/5"></asp:Label></h1>
                                        </div>

                                    </div>
                                    <!-- #respond -->
                                </div>
                            </div>


                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--    <section class="related products">

                <h2>Related products</h2>


                <ul class="products row thb-main-products">

                    <li class="small-6 large-3 columns thb-listing-style2 post-163 product type-product status-publish has-post-thumbnail product_cat-accessories product_cat-women product_tag-bag product_tag-bucket product_tag-roxy first instock taxable shipping-taxable purchasable product-type-simple">
                        <figure class="product_thumbnail thb_hover">
                            <a href="../roxy-mini-bucket-bag-in-checkerboard/index.html" title="Roxy Mini Bucket Bag in Checkerboard">
                                <span class="product_thumbnail_hover" style="background-image: url(../../wp-content/uploads/sites/4/2017/08/z22-2-600x750.jpg)"></span>
                                <img width="600" height="750" src="../../wp-content/uploads/sites/4/2017/08/z22-1-600x750.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z22-1-600x750.jpg 600w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z22-1-1000x1250.jpg 1000w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z22-1-300x375.jpg 300w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z22-1-500x625.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" />
                            </a>
                        </figure>
                        <h3>
                            <a href="../roxy-mini-bucket-bag-in-checkerboard/index.html" title="Roxy Mini Bucket Bag in Checkerboard">Roxy Mini Bucket Bag in Checkerboard</a>
                            <div class="yith-wcwl-add-to-wishlist add-to-wishlist-163">
                                <div class="yith-wcwl-add-button show"><a href="indexe3f2.html?add_to_wishlist=163" data-product-id="163" data-product-type="simple" class="add_to_wishlist"><span class="text">Add To Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistaddedbrowse hide" style="display: none;"><a href="../../wishlist/index.html"><span class="text">Added to Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistexistsbrowse hide" style="display: none"><a href="../../wishlist/index.html"><span class="text">View Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                            </div>
                        </h3>
                        <div class="product_after_title">
                            <div class="product_after_shop_loop_price">

                                <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>80.00</span></span>
                            </div>

                            <div class="product_after_shop_loop_buttons">
                                <a rel="nofollow" href="indexfdfc.html?add-to-cart=163" data-quantity="1" data-product_id="163" data-product_sku="45645" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                            </div>
                        </div>
                    </li>

                    <li class="small-6 large-3 columns thb-listing-style2 post-267 product type-product status-publish has-post-thumbnail product_cat-women product_tag-chest product_tag-flower product_tag-pocket  instock taxable shipping-taxable purchasable product-type-variable has-children">
                        <figure class="product_thumbnail thb_hover">
                            <a href="../flower-embroidery-w-chest-pocket-shirt/index.html" title="Flower Embroidery w/ Chest Pocket Shirt">
                                <span class="product_thumbnail_hover" style="background-image: url(../../wp-content/uploads/sites/4/2017/08/z7-4-600x750.jpg)"></span>
                                <img width="600" height="750" src="../../wp-content/uploads/sites/4/2017/08/v_1-600x750.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/v_1-600x750.jpg 600w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/v_1-1000x1250.jpg 1000w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/v_1-300x375.jpg 300w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/v_1-500x625.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" />
                            </a>
                        </figure>
                        <h3>
                            <a href="../flower-embroidery-w-chest-pocket-shirt/index.html" title="Flower Embroidery w/ Chest Pocket Shirt">Flower Embroidery w/ Chest Pocket Shirt</a>
                            <div class="yith-wcwl-add-to-wishlist add-to-wishlist-267">
                                <div class="yith-wcwl-add-button show"><a href="indexeaf4.html?add_to_wishlist=267" data-product-id="267" data-product-type="variable" class="add_to_wishlist"><span class="text">Add To Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistaddedbrowse hide" style="display: none;"><a href="../../wishlist/index.html"><span class="text">Added to Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistexistsbrowse hide" style="display: none"><a href="../../wishlist/index.html"><span class="text">View Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                            </div>
                        </h3>
                        <div class="product_after_title">
                            <div class="product_after_shop_loop_price">

                                <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>140.00</span> &ndash; <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>160.00</span></span>
                            </div>

                            <div class="product_after_shop_loop_buttons">
                                <a rel="nofollow" href="../flower-embroidery-w-chest-pocket-shirt/index.html" data-quantity="1" data-product_id="267" data-product_sku="53634-1" class="button product_type_variable add_to_cart_button">Select options</a>
                            </div>
                        </div>
                    </li>

                    <li class="small-6 large-3 columns thb-listing-style2 post-74 product type-product status-publish has-post-thumbnail product_cat-women product_tag-bag product_tag-fur product_tag-saddle  instock taxable shipping-taxable purchasable product-type-simple">
                        <figure class="product_thumbnail thb_hover">
                            <a href="../cross-body-purse-two-in-saddle/index.html" title="Cross Body Purse Two in Saddle">
                                <span class="product_thumbnail_hover" style="background-image: url(../../wp-content/uploads/sites/4/2017/08/z4-4-600x750.jpg)"></span>
                                <img width="600" height="750" src="../../wp-content/uploads/sites/4/2017/08/z4-1-600x750.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z4-1-600x750.jpg 600w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z4-1-1000x1250.jpg 1000w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z4-1-300x375.jpg 300w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z4-1-500x625.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" />
                            </a>
                        </figure>
                        <h3>
                            <a href="../cross-body-purse-two-in-saddle/index.html" title="Cross Body Purse Two in Saddle">Cross Body Purse Two in Saddle</a>
                            <div class="yith-wcwl-add-to-wishlist add-to-wishlist-74">
                                <div class="yith-wcwl-add-button show"><a href="index6f7e.html?add_to_wishlist=74" data-product-id="74" data-product-type="simple" class="add_to_wishlist"><span class="text">Add To Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistaddedbrowse hide" style="display: none;"><a href="../../wishlist/index.html"><span class="text">Added to Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistexistsbrowse hide" style="display: none"><a href="../../wishlist/index.html"><span class="text">View Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                            </div>
                        </h3>
                        <div class="product_after_title">
                            <div class="product_after_shop_loop_price">

                                <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>160.00</span></span>
                            </div>

                            <div class="product_after_shop_loop_buttons">
                                <a rel="nofollow" href="index66bc.html?add-to-cart=74" data-quantity="1" data-product_id="74" data-product_sku="54678" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                            </div>
                        </div>
                    </li>

                    <li class="small-6 large-3 columns thb-listing-style2 post-136 product type-product status-publish has-post-thumbnail product_cat-women product_tag-gray product_tag-parachute product_tag-poplin last instock taxable shipping-taxable purchasable product-type-simple">
                        <figure class="product_thumbnail thb_hover">
                            <a href="../parachute-poplin-top-in-gray/index.html" title="Parachute Poplin Top in Gray">
                                <span class="product_thumbnail_hover" style="background-image: url(../../wp-content/uploads/sites/4/2017/08/z16-2-600x750.jpg)"></span>
                                <img width="600" height="750" src="../../wp-content/uploads/sites/4/2017/08/z16-1-600x750.jpg" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" srcset="http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z16-1-600x750.jpg 600w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z16-1-1000x1250.jpg 1000w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z16-1-300x375.jpg 300w, http://newnorth.fuelthemes.net/north-snap/wp-content/uploads/sites/4/2017/08/z16-1-500x625.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" />
                            </a>
                        </figure>
                        <h3>
                            <a href="../parachute-poplin-top-in-gray/index.html" title="Parachute Poplin Top in Gray">Parachute Poplin Top in Gray</a>
                            <div class="yith-wcwl-add-to-wishlist add-to-wishlist-136">
                                <div class="yith-wcwl-add-button show"><a href="indexf2d8.html?add_to_wishlist=136" data-product-id="136" data-product-type="simple" class="add_to_wishlist"><span class="text">Add To Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistaddedbrowse hide" style="display: none;"><a href="../../wishlist/index.html"><span class="text">Added to Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                                <div class="yith-wcwl-wishlistexistsbrowse hide" style="display: none"><a href="../../wishlist/index.html"><span class="text">View Wishlist</span><svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="wishlist_icon" x="0" y="0" width="12.6" height="11" viewBox="0 0 12.6 11" enable-background="new 0 0 12.584 11" xml:space="preserve"><path fill="#010101" d="M6.3 10.5c0 0 0 0-0.1 0C4.1 9 0.5 6 0.5 4 0.5 2.3 1.8 0.5 3.7 0.5c0.9 0 1.6 0.3 2.2 1l0.4 0.5 0.4-0.5C7.2 0.8 8 0.5 8.9 0.5c1.9 0 3.2 1.8 3.2 3.5 0 2-3.6 5.1-5.7 6.5L6.3 10.5z" /></svg></a></div>
                            </div>
                        </h3>
                        <div class="product_after_title">
                            <div class="product_after_shop_loop_price">

                                <span class="price"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#36;</span>360.00</span></span>
                            </div>

                            <div class="product_after_shop_loop_buttons">
                                <a rel="nofollow" href="indexa763.html?add-to-cart=136" data-quantity="1" data-product_id="136" data-product_sku="87977" class="button product_type_simple add_to_cart_button ajax_add_to_cart">Add to cart</a>
                            </div>
                        </div>
                    </li>

                </ul>
            </section>--%>
    </div>
    <!-- #product-55 -->





    </div>
    <!-- End role["main"] -->

</asp:Content>

