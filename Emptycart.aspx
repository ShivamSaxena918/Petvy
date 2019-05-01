<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Emptycart.aspx.cs" Inherits="Emptycart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div class="page-padding post-6 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <div class="my_woocommerce_page page-padding text-center cart-empty">
                                <section>
                                    <figure></figure>
                                    <p class="cart-empty">Your cart is currently empty.</p>
                                    <p class="return-to-shop"><a class="button wc-backward" href="Product.aspx">Return To Shop</a></p>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

