<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div class="page-padding post-6 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <h1 class="thb-shop-title">Shopping Cart</h1>

                            <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="product-remove">&nbsp;</th>
                                        <th class="product-thumbnail">&nbsp;</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>


                                                <tbody>

                                                    <tr class="woocommerce-cart-form__cart-item cart_item">

                                                        <td class="product-remove">
                                                            <asp:LinkButton ID="lblremove" aria-label="Remove this item" CommandName="delete" CommandArgument='<%# Eval("CartId") %>'  CssClass="remove" runat="server">&times;</asp:LinkButton>
                                                            <%--<a   data-product_id="196" data-product_sku="53634"></a>--%>
                                                        </td>

                                                        <td class="product-thumbnail">
                                                            <a href="../product/embossed-backpack-in-brown/index.html">
                                                                <img width="150" height="150" src='Gallery/<%# Eval("Url") %>' class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="" /></a>

                                                        </td>

                                                        <td class="product-name" data-title="Product">
                                                            <a href="../product/embossed-backpack-in-brown/index.html"><%# Eval("Name") %></a>

                                                        </td>

                                                        <td class="product-price" data-title="Price">
                                                            <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377</span><asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label></span>

                                                        </td>

                                                        <td class="product-quantity" data-title="Quantity">
                                                            <div class="quantity">
                                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("CartId") %>' />
                                                                <%--<label class="screen-reader-text" for="quantity_5a927e65b6b05">Quantity</label>--%>
                                                                <asp:TextBox runat="server" id="txtqty" class="input-text qty text" step="1" min="0" max="" name="cart[9dcb88e0137649590b755372b040afad][qty]" title="Qty" Text='<%# Eval("Qty") %>' size="4" pattern="[0-9]*" inputmode="numeric" ></asp:TextBox>
                                                                <%--<input type="number" id="quantity_5a927e65b823f" class="input-text qty text" step="1" min="0" max="" name="cart[9dcb88e0137649590b755372b040afad][qty]" value='<%# Eval("Qty") %>' title="Qty" size="4" pattern="[0-9]*" inputmode="numeric" />--%>
                                                            </div>
                                                        </td>

                                                        <td class="product-subtotal" data-title="Total">
                                                            <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lbltotal" runat="server" Text="Label"></asp:Label></span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </ItemTemplate>
                                            
                                        </asp:Repeater>
                                    </ContentTemplate>
                                </asp:UpdatePanel>



                                <tfoot>
                                    <tr>
                                        <td colspan="6" class="actions">
                                            <div class="row align-justify">
                                                <div class="small-12 medium-6 columns">
                                                </div>
                                                <div class="small-12 medium-6 columns">
                                                    <asp:Button ID="btnupdate" runat="server" Text="Update Cart" CssClass="button" OnClick="btnupdate_Click"  />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tfoot>


                            </table>

                            <div class="row align-right">
                                <div class="small-12 medium-8 large-5 columns">
                                    <div class="cart-collaterals">

                                        <div class="cart_totals ">


                                            <h2>Cart totals</h2>

                                            <table cellspacing="0" class="shop_table shop_table_responsive">

                                                <tr class="cart-subtotal">
                                                    <th>Subtotal</th>
                                                    <td data-title="Subtotal"><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblsubtotal" runat="server" Text="Label"></asp:Label></span></td>
                                                </tr>

                                                <tr class="tax-rate tax-rate-vat-1">
                                                    <th>CGST <small>(2.5% on Single Product)</small></th>
                                                    <td><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblcgst" runat="server" Text="Label"></asp:Label></span></td>
                                                </tr>
                                                <tr class="tax-rate tax-rate-vat-1">
                                                    <th>SGST <small>2.5% on Single Product</small></th>
                                                    <td><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblsgst" runat="server" Text="Label"></asp:Label></span></td>
                                                </tr>


                                                <tr class="order-total">
                                                    <th>Total</th>
                                                    <td data-title="Total"><strong><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lbltttotal" runat="server" Text="Label"></asp:Label></span></strong> </td>
                                                </tr>


                                            </table>

                                            <div class="wc-proceed-to-checkout">
                                                <asp:Button ID="btncheckout" class="checkout-button button alt wc-forward" runat="server" Text="Proceed to checkout" OnClick="btncheckout_Click" />
                                                <%--<a href="../checkout/index.html" class="checkout-button button alt wc-forward">Proceed to checkout</a>--%>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End role["main"] -->

</asp:Content>

