<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="EmptyOrder.aspx.cs" Inherits="EmptyOrder" %>

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
                                    <p class="cart-empty">You Have Not Ordered Anything Yet..</p>
                                    <p class="return-to-shop"><a class="button wc-backward" href="Product.aspx">Shop Now !!</a></p>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

