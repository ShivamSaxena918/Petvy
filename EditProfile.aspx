<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .container {
            position: relative;
            width: 50%;
        }

        .image {
            opacity: 1;
            display: block;
            width: 100%;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
        }

        .middle {
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .container:hover .image {
            opacity: 0.3;
        }

        .container:hover .middle {
            opacity: 1;
        }

        .text {
            background-color: dodgerblue;
            color: white;
            font-size: 16px;
            padding: 16px 32px;
        }
    </style>
    <script lang="javascript" type="text/javascript">
        function validate() {
            var names = /[a-zA-Z]/;
            if ((document.getElementById("<%=txtname.ClientID%>").value.match(names))) {

            }
            else {
                swal("Warning", "Insert Valid First Name", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtlname.ClientID%>").value.match(names))) {

            }
            else {
                swal("Warning", "Insert Valid Last Name", "warning");
                return false;
            }
            var number = /[0-9]{10}/;
            if ((document.getElementById("<%=txtcno.ClientID%>").value.match(number))) {

            }
            else {
                swal("Warning", "Insert Valid Contact Number", "warning");
                return false;
            }
            var address = /[A-Za-z0-9 ]/;
            if ((document.getElementById("<%=txtstreet.ClientID%>").value.match(address))) {

            }
            else {
                swal("Warning", "Insert Valid Street Address", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtlandmark.ClientID%>").value.match(address))) {

            }
            else {
                swal("Warning", "Insert Valid Landmark", "warning");
                return false;
            }
            if ((document.getElementById("<%=txtarea.ClientID%>").value.match(address))) {

            }
            else {
                swal("Warning", "Insert Area Address", "warning");
                return false;
            }
            var pin = /[0-9]{6}/;
            if ((document.getElementById("<%=txtpin.ClientID%>").value.match(pin))) {

            }
            else {
                swal("Warning", "Insert Valid Pincode", "warning");
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
                        <h1 class="thb-shop-title">My Profile</h1>
                        <div class="row fade-in">
                            <div class="small-12 large-12 xlarge-12 columns text-center">
                                <div class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields align-center">

                                            <div class="woocommerce-billing-fields__field-wrapper">
                                                <div class="container large-12" style="margin-left: 290px">
                                                    <asp:Image ID="imgprofile" runat="server" Style="height: 200px; width: 200px; border: dashed; margin-left: 65px; border-width: 2px" />
                                                    <div class="middle">

                                                        <div class="fileUpload w3-btn w3-blue " style="margin-left: 65px">
                                                            <span>Edit Photo</span>
                                                            <asp:FileUpload ID="FileUpload1" runat="server" class="upload" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="small-12 large-12 xlarge-9 columns">

                                <h3>Basic Details</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="small-12 large-4 xlarge-9 columns">
                                <p class="form-row form-row-first validate-required" id="fname" data-priority="10">
                                    <label for="billing_first_name">
                                        First Name
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtname" placeholder="Enter First Name" runat="server" required="" />
                                </p>
                            </div>
                            <div class="small-12 large-4 xlarge-9 columns">
                                <p class="form-row form-row-last validate-required" id="mname" data-priority="20">
                                    <label for="billing_last_name">
                                        Middle Name
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text" id="txtmname" placeholder="Enter Middle Name" runat="server" />
                                </p>
                            </div>

                            <div class="small-12 large-4 xlarge-9 columns">
                                <p class="form-row form-row-last validate-required" id="lname" data-priority="20">
                                    <label for="billing_last_name">
                                        Last Name
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtlname" placeholder="Enter Last Name" runat="server" required="" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="small-12 large-6 xlarge-9 columns">
                                <p class="form-row form-row-last validate-required" id="cno" data-priority="20">
                                    <label for="billing_last_name">
                                        Contact Number
                                 <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtcno" placeholder="Enter Contact Number" runat="server" required="" />
                                </p>
                            </div>
                            <div class="small-12 large-6 xlarge-9 columns">
                                <p class="form-row form-row-last validate-required" id="email" data-priority="20">
                                    <label for="billing_last_name">
                                        Email Address
                                 <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtemail" placeholder="Enter Email Address" runat="server" required="" disabled="disabled" />
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="small-12 large-12 xlarge-9 columns text-right">
                                <a style="color: dodgerblue" href="ChangePass.aspx">Want To Change Password??</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="small-12 large-12 xlarge-9 columns">

                                <h3>Address Details</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="small-12 large-12 xlarge-9 columns">
                                <p class="form-row form-row-wide address-field validate-required" id="billing_address_1_field" data-priority="50">
                                    <label for="billing_address_1" class="">
                                        Street address
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtstreet" placeholder="House number and street name" value="" runat="server" required="" />
                                </p>
                            </div>

                        </div>
                        <div class="row">
                            <div class="small-12 large-5 xlarge-9 columns">
                                <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                    <label for="billing_address_1" class="">
                                        Landmark
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtlandmark" placeholder="Enter Famous Landmark Like Road/Building/Area" value="" runat="server" required="" />
                                </p>
                            </div>

                            <div class="small-12 large-5 xlarge-9 columns">
                                <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                    <label for="billing_address_1" class="">
                                        Area
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txtarea" placeholder="Enter Famous Landmark Like Road/Building/Area" value="" runat="server" required="" />
                                </p>
                            </div>
                            <div class="small-12 large-2 xlarge-9 columns">
                                <p class="form-row form-row-wide address-field validate-required validate-postcode" id="billing_postcode_field" data-priority="90">
                                    <label for="billing_postcode" class="">
                                        Pincode
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txtpin" placeholder="Enter Pin Code" runat="server" required="" />
                                </p>
                            </div>
                        </div>


                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="small-12 large-4 xlarge-9 columns">
                                        <p class="form-row form-row-wide address-field validate-required validate-state" id="P1" data-priority="80">
                                            <label for="billing_country" class="">
                                                Country                                                                            
                                                           <abbr class="required" title="required">*</abbr>
                                            </label>
                                            <asp:DropDownList ID="ddcountrylist" CssClass="form-control" runat="server" AutoPostBack="true" required="" OnSelectedIndexChanged="ddcountrylist_SelectedIndexChanged"></asp:DropDownList>
                                        </p>
                                    </div>
                                    <div class="small-12 large-4 xlarge-9 columns">
                                        <p class="form-row form-row-wide address-field validate-required validate-state" id="billing_state_field" data-priority="80">
                                            <label for="billing_state" class="">
                                                State
                                                                <abbr class="required" title="required">*</abbr></label>
                                            <asp:DropDownList ID="ddstatelist" CssClass="form-control" runat="server" AutoPostBack="true" required="" OnSelectedIndexChanged="ddstatelist_SelectedIndexChanged"></asp:DropDownList>
                                        </p>
                                    </div>
                                    <div class="small-12 large-4 xlarge-9 columns">
                                        <p class="form-row form-row-wide address-field validate-required" id="billing_city_field" data-priority="70">
                                            <label for="billing_city" class="">
                                                City
                                                                <abbr class="required" title="required">*</abbr></label>
                                            <asp:DropDownList ID="ddcitylist" CssClass="form-control" runat="server" required=""></asp:DropDownList>
                                        </p>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="row">
                            <div class="small-12 large-12 xlarge-9 columns">
                                <asp:LinkButton ID="lbbusiness" runat="server" Style="color: dodgerblue" OnClick="CheckBox1_CheckedChanged">Want To Change Business Details ??</asp:LinkButton>
                            </div>
                        </div>

                        <div class="row">
                            <div class="small-12 large-12 xlarge-12 columns text-right">
                                <asp:Button ID="btncancel1" runat="server" Text="CANCEL" Style="width: 200px" OnClick="btncancel1_Click" />
                                <asp:Button ID="btnsubmit" runat="server" Text="SUBMIT CHANGES" Style="width: 200px" OnClick="btnsubmit_Click" OnClientClick="return validate()" />
                            </div>
                        </div>


                        <asp:Panel ID="Panel1" runat="server">
                            <div class="row">
                            </div>
                            <div class="row">
                                <div class="small-12 large-12 xlarge-9 columns" style="margin-top: 50px">

                                    <h3>Business Details</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="small-12 large-10 xlarge-9 columns">


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
                                            <label for="billing_company" class="">Business Email</label><input type="text" class="input-text " id="txteemail" placeholder="Business Email" value="" runat="server" />
                                        </p>
                                        <p class="form-row form-row-wide" data-priority="30">
                                            <label for="billing_company" class="">Business URL</label><input type="text" class="input-text " name="billing_company" id="txtURL" placeholder="Enter Your Business URL" value="" runat="server" />
                                        </p>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <p class="form-row form-row-wide address-field validate-required validate-state" id="P1" data-priority="80">
                                                    <label for="billing_country" class="">
                                                        Country                                                                            
                                                           <abbr class="required" title="required">*</abbr>
                                                    </label>
                                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" required=""></asp:DropDownList>
                                                </p>

                                                <p class="form-row form-row-wide address-field validate-required validate-state" id="billing_state_field" data-priority="80">
                                                    <label for="billing_state" class="">
                                                        State
                                                                <abbr class="required" title="required">*</abbr></label>
                                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" required=""></asp:DropDownList>
                                                </p>
                                                <p class="form-row form-row-wide address-field validate-required" id="billing_city_field" data-priority="70">
                                                    <label for="billing_city" class="">
                                                        City
                                                                <abbr class="required" title="required">*</abbr></label>
                                                    <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" required=""></asp:DropDownList>
                                                </p>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <p class="form-row form-row-wide address-field validate-required" id="billing_address_1_field" data-priority="50">
                                            <label for="billing_address_1" class="">
                                                Street address
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txttstreet" placeholder="House number and street name" value="" runat="server" />
                                        </p>
                                        <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                            <label for="billing_address_1" class="">
                                                Area
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txttarea" placeholder="Enter Your Business Area" value="" runat="server" />
                                        </p>
                                        <p class="form-row form-row-wide address-field validate-required" data-priority="50">
                                            <label for="billing_address_1" class="">
                                                Landmark
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " name="billing_address_1" id="txttlandmark" placeholder="Enter Famous Landmark Like Road/Building/Area" value="" runat="server" />
                                        </p>

                                        <p class="form-row form-row-wide address-field validate-required validate-postcode" id="billing_postcode_field" data-priority="90">
                                            <label for="billing_postcode" class="">
                                                Postcode / ZIP
                                                                <abbr class="required" title="required">*</abbr></label><input type="text" class="input-text " id="txttpin" placeholder="Enter Pin/Zip Code" value="" autocomplete="postal-code" runat="server" />
                                        </p>
                                        <p class="form-row form-row-wide validate-required validate-phone" id="billing_phone_field" data-priority="100">
                                            <label for="billing_phone" class="">
                                                Business Phone Number
                                                                <abbr class="required" title="required">*</abbr></label><input type="tel" class="input-text " id="txttphno" placeholder="Enter Phone Number" value="" runat="server" />
                                        </p>


                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-row form-row-wide validate-required validate-phone">
                                    <label for="billing_phone" class="">
                                        Your Shop Images
                                                                <abbr class="required" title="required">*</abbr></label>
                                </div>
                            </div>


                            <div class="row">
                                <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
                                    <ItemTemplate>
                                        <div class="container large-12">
                                            <img src="Gallery/<%# Eval("Url") %>" style="height: 200px; width: 380px; margin-left: 30px; border-radius: 2px" />
                                            <div class="middle">

                                                <span style="margin-left: 30px" class="w3-btn w3-red">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" CommandArgument='<%# Eval("ImageId") %>'>Delete</asp:LinkButton></span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>


                            <div class="row">
                                <div class="small-12 large-3 xlarge-9 columns" style="margin-top: 20px">
                                    <div class="fileUpload w3-btn w3-blue" style="width: 100%; border: 3px">


                                        <span>Select More Images</span>
                                        <asp:FileUpload ID="FileUpload2" runat="server" class="upload" AllowMultiple="true" />
                                    </div>
                                </div>
                            </div>


























                        </asp:Panel>
                        <div class="row">
                            <div class="small-12 large-12 xlarge-12 columns text-right">
                                <asp:Button ID="btncancle2" runat="server" Text="CANCEL" Style="width: 200px" OnClick="btncancel1_Click" />
                                <asp:Button ID="btnsubmit2" runat="server" Text="SUBMIT CHANGES" Style="width: 200px; margin-top: 30px" OnClick="btnsubmit2_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

