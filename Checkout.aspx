<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function validate() {

            var letters = /[A-Za-z]/;
            if (document.getElementById("<%=txtname.ClientID%>").value.match(letters)) {

            }
            else {
                swal("Warning", "Invalid First Name", "warning");
                return false;
            }
            if (document.getElementById("<%=txtlname.ClientID%>").value.match(letters)) {

            }
            else {
                swal("Warning", "Invalid Last Name", "warning");
                return false;
            }
            var phoneno = /[0-9]{10}/;
            if ((document.getElementById("<%=txtphno.ClientID%>").value.match(phoneno))) {

            }
            else {
                swal("Warning", "Invalid Contact Name", "warning");
                return false;
            }
            return true;
        }
    </script>
    <div role="main">
        <div class="page-padding post-7 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <h1 class="thb-shop-title">Checkout</h1>

                            <div class="checkout-login">
                                <div class="row align-center">
                                    <div class="small-12 medium-7 large-5 text-center columns">
                                        <div class="thb-checkout-login">
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="small-12 large-8 xlarge-9 columns">
                                    <div class="col2-set" id="customer_details">
                                        <div class="col-1">
                                            <div class="woocommerce-billing-fields">

                                                <h3>Billing details</h3>



                                                <div class="woocommerce-billing-fields__field-wrapper">
                                                    <p class="form-row form-row-first validate-required" id="fname" data-priority="10">
                                                        <label for="billing_first_name">
                                                            First Name
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtname" placeholder="Enter First Name" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-last validate-required" id="mname" data-priority="20">
                                                        <label for="billing_last_name">
                                                            Middle Name
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text" id="txtmname" placeholder="Enter Middle Name" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-last validate-required" id="lname" data-priority="20">
                                                        <label for="billing_last_name">
                                                            Last Name
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtlname" placeholder="Enter Last Name" runat="server"/>
                                                    </p>
                                                    <p class="form-row form-row-wide validate-required validate-phone" id="billing_phone_field" data-priority="100">
                                                        <label for="billing_phone">
                                                            Phone Number
                                                                <abbr class="required" title="required">*</abbr></label><input type="tel" class="input-text " id="txtphno" runat="server" placeholder="Provide Phone Number" />
                                                    </p>
                                                    <p class="form-row form-row-wide validate-required validate-email" id="billing_email_field" data-priority="110">
                                                        <label for="billing_email" class="">
                                                            Email address
                                                                <abbr class="required" title="required">*</abbr></label><input type="email" class="input-text " id="txtemail" placeholder="Enter Proper Email" runat="server" />
                                                    </p>
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <p class="form-row form-row-wide address-field validate-required validate-state" id="P1" data-priority="80">
                                                                <label for="billing_country" class="">
                                                                    Your Saved Addresses                                                                           
                                                           <abbr class="required" title="required">*</abbr>
                                                                </label>
                                                                <asp:DropDownList ID="ddaddresses" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddaddresses_SelectedIndexChanged"></asp:DropDownList>
                                                            </p>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <p class="form-row form-row-wide address-field validate-required validate-state text-right" id="P1" data-priority="80">
                                                        <asp:Button ID="btnAdd" runat="server" Text="Add Another Address" OnClick="btnAdd_Click"  />
                                                    </p>

                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                    <asp:Panel ID="Panel1" runat="server" Visible="false">

                                                        <p class="form-row form-row-wide address-field validate-required validate-state" id="P1" data-priority="80">
                                                            <label for="billing_country" class="">
                                                                Country                                                                            
                                                           <abbr class="required" title="required">*</abbr>
                                                            </label>
                                                            <asp:DropDownList ID="ddcountrylist" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddcountrylist_SelectedIndexChanged" required=""></asp:DropDownList>
                                                        </p>

                                                        <p class="form-row form-row-wide address-field validate-required validate-state" id="billing_state_field" data-priority="80">
                                                            <label for="billing_state" class="">
                                                                State
                                                                <abbr class="required" title="required">*</abbr></label>
                                                            <asp:DropDownList ID="ddstatelist" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddstatelist_SelectedIndexChanged" required=""></asp:DropDownList>
                                                        </p>
                                                        <p class="form-row form-row-wide address-field validate-required" id="billing_city_field" data-priority="70">
                                                            <label for="billing_city" class="">
                                                                City
                                                                <abbr class="required" title="required">*</abbr></label>
                                                            <asp:DropDownList ID="ddcitylist" CssClass="form-control" runat="server"></asp:DropDownList>
                                                        </p>

                                                        <p class="form-row form-row-wide address-field validate-required" id="billing_address_1_field" data-priority="50">
                                                            <label for="billing_address_1" class="">
                                                                Street address
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtstreet" placeholder="House number and street name" value="" runat="server" />
                                                        </p>
                                                        <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                                            <label for="billing_address_1" class="">
                                                                Landmark
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtlandmark" placeholder="Enter Famous Landmark Like Road/Building/Area" value="" runat="server" />
                                                        </p>
                                                        <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                                            <label for="billing_address_1" class="">
                                                                Area
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtarea" placeholder="Enter Famous Landmark Like Road/Building/Area" value="" runat="server"/>
                                                        </p>

                                                        <p class="form-row form-row-wide address-field validate-required validate-postcode" id="billing_postcode_field" data-priority="90">
                                                            <label for="billing_postcode" class="">
                                                                Pincode
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtpin" placeholder="Enter Pin Code" runat="server" />
                                                        </p>
                                                    </asp:Panel>

                                                    </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="small-12 large-4 xlarge-3 columns">

                                    <h3 id="order_review_heading">Your order</h3>


                                    <div id="order_review" class="woocommerce-checkout-review-order">
                                        <table class="shop_table woocommerce-checkout-review-order-table">
                                            <thead>
                                                <tr>
                                                    <th class="product-name">Product</th>
                                                    <th class="product-total">Total</th>
                                                </tr>
                                            </thead>
                                            <asp:Repeater ID="rptproducts" runat="server">
                                                <ItemTemplate>
                                                    <tbody>
                                                        <tr class="cart_item">
                                                            <td class="product-name">
                                                                <asp:Label ID="lblproduct" runat="server" Text='<%# Eval("Name") %>'></asp:Label>&nbsp;<strong class="product-quantity">&times;
                                                                    <asp:Label ID="lblquantity" runat="server" Text='<%# Eval("Qty") %>'></asp:Label></strong>
                                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Price") %>' />
                                                            </td>
                                                            <td class="product-total">
                                                                <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblprice" runat="server"></asp:Label></span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <tfoot>

                                                <tr class="cart-subtotal">
                                                    <th>Subtotal</th>
                                                    <td><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblsubtotal" runat="server"></asp:Label></span></td>
                                                </tr>

                                                <tr class="tax-rate tax-rate-vat-1">
                                                    <th>CGST</th>
                                                    <td><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblCGST" runat="server"></asp:Label></span></td>
                                                </tr>
                                                <tr class="tax-rate tax-rate-vat-1">
                                                    <th>SGST</th>
                                                    <td><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblSGST" runat="server"></asp:Label></span></td>
                                                </tr>


                                                <tr class="order-total">
                                                    <th>Total</th>
                                                    <td><strong><span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol">&#8377;</span><asp:Label ID="lblttotal" runat="server" Text="Label"></asp:Label></span></strong> </td>
                                                </tr>


                                            </tfoot>
                                        </table>
                                        <div class="wc-proceed-to-checkout">
                                            <asp:Button ID="btnplaceorder" class="checkout-button button alt wc-forward" runat="server" Text="Place Order" OnClick="btnplaceorder_Click" OnClientClick="return validate()" />
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
</asp:Content>

