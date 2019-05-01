<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script lang="javascript" type="text/javascript">
        function validate() {
            var mnumber = /[0-9a-zA-Z]/;
            if (document.getElementById("<%=txtpname.ClientID%>").value == "") {

                swal("Warning", "Product Name Cant Be Blank", "warning");
                document.getElementById("<%=txtpname.ClientID%>").focus();
                return false;
            }
            if ((document.getElementById("<%=txtpname.ClientID%>").value.match(mnumber))) {

            }
            else {
                swal("Warning", "Insert Valid Product Name", "warning");
                return false;
            }


            
            var number = /[0-9]/;
            if ((document.getElementById("<%=txtmno.ClientID%>").value.match(mnumber))) {

            }
            else {
                swal("Warning", "Insert Valid Model Number", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtprice.ClientID%>").value.match(number))) {

            }
            else {
                swal("Warning", "Insert Valid Product Price", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtdesc.ClientID%>").value.match(mnumber))) {

            }
            else {
                swal("Warning", "Insert Valid Description", "warning");
                return false;
            }
            
             if (document.getElementById("<%=txtdesc.ClientID%>").value == "") {

                swal("Warning", "Description Cant Be Blank", "warning");
                document.getElementById("<%=txtdesc.ClientID%>").focus();
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
                            <h1 class="thb-shop-title">Add Products</h1>


                            <div class="row">
                                <div class="small-10 large-8 xlarge-9 columns">
                                    <div class="col2-set" id="customer_details">
                                        <div class="col-1">
                                            <div class="woocommerce-billing-fields">

                                                <h3>Product details</h3>



                                                <div class="woocommerce-billing-fields__field-wrapper">
                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <label for="txtpname">Product Name <span class="required">*</span></label>
                                                        <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" id="txtpname" runat="server" title="Enter First Name" placeholder="Enter Product Name" />
                                                    </p>
                                                    <%--<p class="form-row form-row-first validate-required" id="fname" data-priority="10">
                                                    <label for="billing_first_name">
                                                        Product Name 
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtname" placeholder="Enter First Name" runat="server" required="" />
                                                </p>--%>

                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <label for="txtmno">
                                                            ModelNo
                                                                <span class="required">*</span></label>
                                                        <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" id="txtmno" title="Enter Model No" runat="server" placeholder="Enter Model Number" />
                                                    </p>
                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide" id="billing_phone_field" data-priority="100">
                                                        <label for="txtprice">
                                                            Price
                                                                <span class="required">*</span></label>
                                                        <input type="tel" class="woocommerce-Input woocommerce-Input--text input-text" id="txtprice" runat="server" title="Enter Price" placeholder="Enter Price Of The Product" />
                                                    </p>
                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide" id="billing_phone_field" data-priority="100">
                                                        <label for="txtdesc">
                                                            Discription
                                                                <span class="required">*</span></label>
                                                        <asp:TextBox ID="txtdesc" class="woocommerce-Input woocommerce-Input--text input-text" runat="server" TextMode="MultiLine" placeholder="Enter Description"></asp:TextBox>
                                                        <%--<input type="tel"  runat="server" title="Enter Description" />--%>
                                                    </p>

                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <div class="fileUpload w3-btn w3-blue " style="margin-left: 50px; width: 290px">
                                                            <span>SELECT PRODUCT IMAGE</span>
                                                            <asp:FileUpload ID="FileUpload1" runat="server" class="upload" AllowMultiple="true" />
                                                        </div>
                                                    </p>

                                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <p class="form-row form-row-wide address-field validate-required validate-state" id="P1" data-priority="80">
                                                                <label for="billing_country" class="">
                                                                    Category                                                                          
                                                           <abbr class="required" title="required">*</abbr>
                                                                </label>
                                                                <asp:DropDownList ID="ddcategory" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddcategory_SelectedIndexChanged" required=""></asp:DropDownList>
                                                            </p>
                                                            <p class="form-row form-row-wide address-field validate-required validate-state" id="P2" data-priority="80">
                                                                <asp:Label ID="lblcate" runat="server" for="billing_country" class="">
                                                                Sub Category                                                                          
                                                           <abbr class="required" title="required">*</abbr>
                                                                </asp:Label>
                                                                <%--<label for="billing_country" class="">
                                                                Sub Category                                                                          
                                                           <abbr class="required" title="required" id="lblsubcate">*</abbr>
                                                            </label>--%>
                                                                <asp:DropDownList ID="ddsubcategory" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddsubcategory_SelectedIndexChanged" required=""></asp:DropDownList>
                                                            </p>


                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <label for="txtcno">MENUFACTURING DATE<span class="required">*</span></label>
                                                        <asp:TextBox ID="txtmfdate" runat="server" TextMode="Date" required=""></asp:TextBox>
                                                    </p>
                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <label for="txtcno2">EXPIRY DATE<span class="required">*</span></label>
                                                        <asp:TextBox ID="txtexpdate" runat="server" TextMode="Date" required=""></asp:TextBox>
                                                    </p>

                                                    <div class="form-row place-order large-offset-5" style="margin-top: 30px">
                                                        <asp:Button ID="btnregister" CssClass="woocommerce-Button button" runat="server" Text="ADD PRODUCT" OnClick="btnregister_Click" OnClientClick="return validate()" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                                <div class="small-2 large-4 xlarge-3 columns text-center">
                                    <h3>Your Products</h3>
                                    <ul class="products row thb-main-products">
                                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1">
                                            <ItemTemplate>
                                                <div style="margin-left: 60px">
                                                    <li class="small-12 large-8 columns thb-listing-style2 post-105 product type-product status-publish has-post-thumbnail product_cat-women product_tag-dress product_tag-long product_tag-sleeve product_tag-strip last instock taxable shipping-taxable purchasable product-type-simple">
                                                        <a href="ProductProfile.aspx?PID=<%# Eval("ProductId") %>" title="<%# Eval("Name") %>">
                                                            <figure class="product_thumbnail thb_hover">
                                                                <span class="product_thumbnail_hover">
                                                                    <img src="Gallery/<%# Eval("Product_Image2") %>" /></span>
                                                                <img width="900" height="750" src="Gallery/<%# Eval("Product_Image") %>" class="attachment-shop_catalog size-shop_catalog wp-post-image" alt="" />
                                                            </figure>
                                                        </a>
                                                        <h3>
                                                            <a style="margin-left: 40px" href="#" title="<%# Eval("Name") %>"><%# Eval("Name") %></a>

                                                        </h3>
                                                        <div class="product_after_title">
                                                        </div>
                                                    </li>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </ul>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

