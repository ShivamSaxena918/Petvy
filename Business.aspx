<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Business.aspx.cs" Inherits="Business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function validate() {

            var title = /[A-Za-z0-9]/;
            if (document.getElementById("<%=txttitle.ClientID%>").value.match(title)) {

            }
            else {
                swal("Warning", "Invalid Business Title Name", "warning");
                return false;
            }
            var gst = /[0-9]{15}/
            if (document.getElementById("<%=txtGST.ClientID%>").value.match(gst)) {

            }
            else {
                swal("Warning", "Invalid GST Number", "warning");
                return false;
            }
            var email = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            if ((document.getElementById("<%=txtemail.ClientID%>").value.match(email))) {

            }
            else {
                swal("Warning", "Invalid Email Address", "warning");
                return false;
            }
            var url = /^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$/;
            if ((document.getElementById("<%=txtURL.ClientID%>").value.match(url))) {

            }
            else {
                swal("Warning", "Invalid URL", "warning");
                return false;
            }
            var add = /[A-Za-z0-9 ]/;
            if ((document.getElementById("<%=txtstreet.ClientID%>").value.match(add))) {

            }
            else {
                swal("Warning", "Invalid Street Address", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtlandmark.ClientID%>").value.match(add))) {

            }
            else {
                swal("Warning", "Invalid Landmark", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtarea.ClientID%>").value.match(add))) {

            }
            else {
                swal("Warning", "Invalid Area", "warning");
                return false;
            }
            var pin = /^[0-9]{6}$/;
            if ((document.getElementById("<%=txtpin.ClientID%>").value.match(pin))) {

            }
            else {
                swal("Warning", "Invalid Pin Code", "warning");
                return false;
            }
            var phoneno = /^[0-9]{10}$/;
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
                            <h1 class="thb-shop-title">Business Registeration</h1>
                            <h3><u>Business details</u></h3>
                            <div class="row">
                                <div class="small-12 large-8 xlarge-9 large-offset-2 columns">
                                    <div class="col2-set" id="customer_details">
                                        <div class="col-1">
                                            <div class="woocommerce-billing-fields">




                                                <div class="woocommerce-billing-fields__field-wrapper">
                                                    <p class="form-row form-row-first validate-required" id="billing_first_name_field" data-priority="10">
                                                        <label for="billing_first_name" class="">
                                                            Business Title
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txttitle" placeholder="Enter Your Business/Shop Name" value="" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-last validate-required" id="billing_last_name_field" data-priority="20">
                                                        <label for="billing_last_name" class="">
                                                            GST. No.
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtGST" placeholder="Enter Your Business/Shop GST Number" value="" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-wide" data-priority="30">
                                                        <label for="billing_company" class="">Business Email</label><input type="text" class="input-text " id="txtemail" placeholder="Business Email" value="" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-wide" data-priority="30">
                                                        <label for="billing_company" class="">Business URL</label><input type="text" class="input-text " name="billing_company" id="txtURL" placeholder="Enter Your Business URL" value="" runat="server" />
                                                    </p>
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
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
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <p class="form-row form-row-wide address-field validate-required" id="billing_address_1_field" data-priority="50">
                                                        <label for="billing_address_1" class="">
                                                            Street address
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtstreet" placeholder="House number and street name" value="" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                                        <label for="billing_address_1" class="">
                                                            Area
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtarea" placeholder="Enter Your Business Area" value="" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                                        <label for="billing_address_1" class="">
                                                            Landmark
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtlandmark" placeholder="Enter Famous Landmark Like Road/Building/Area" value="" runat="server" />
                                                    </p>

                                                    <p class="form-row form-row-wide address-field validate-required validate-postcode" id="billing_postcode_field" data-priority="90">
                                                        <label for="billing_postcode" class="">
                                                            Postcode / ZIP
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtpin" placeholder="Enter Pin/Zip Code" value="" autocomplete="postal-code" runat="server" />
                                                    </p>
                                                    <p class="form-row form-row-wide validate-required validate-phone" id="billing_phone_field" data-priority="100">
                                                        <label for="billing_phone" class="">
                                                            Phone
                                                                <abbr class="required" title="required">*</abbr></label><input type="tel" class="input-text " id="txtphno" placeholder="Enter Phone Number" value="" runat="server" />
                                                    </p>
                                                    <div class="form-row form-row-wide validate-required validate-phone">
                                                        <label for="billing_phone" class="">
                                                            Your Shop Images
                                                                <abbr class="required" title="required">*</abbr></label><br />
                                                        <div class="fileUpload w3-btn w3-blue" style="margin-left:300px">
                                                            <span>Select Images</span>
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" class="upload" AllowMultiple="true" />
                                                        </div>
                                                        
                                                    </div>
                                                    <div class="form-row place-order large-offset-5" style="margin-top: 30px">
                                                        <asp:Button ID="btnregister" class="button alt" runat="server" Text="REGISTER" OnClick="btnregister_Click" OnClientClick="return validate()" />
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="col-2">

                                            <div class="woocommerce-additional-fields">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="small-12 large-4 xlarge-3 columns">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

