<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Inquiry.aspx.cs" Inherits="Inquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function validate() {
            var name = document.getElementById("<%=txtname.ClientID%>").value.trim();
            if (name == "") {

                swal("Warning", "Invalid Name", "warning");
                document.getElementById("<%=txtname.ClientID%>").focus();
                return false;
            }
            var letters = /^[A-Za-z]+$/;
            if (document.getElementById("<%=txtname.ClientID%>").value.match(letters)) {

            }
            else {
                swal("Warning", "Invalid Name", "warning");
                return false;
            }
            var email = document.getElementById("<%=txtemail.ClientID%>").value.trim();
            if (email == "") {

                swal("Warning", "Invalid Email", "warning");
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
            var emailpat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            if (document.getElementById("<%=txtemail.ClientID%>").value.match(emailpat)) {

            }
            else {
                swal("Warning", "Invalid Email", "warning");
                return false;
            }
            var mess = document.getElementById("<%=txtmessage.ClientID%>").value.trim();
            if (mess == "") {

                swal("Warning", "Invalid Inquiry Message", "warning");
                document.getElementById("<%=txtmessage.ClientID%>").focus();
                return false;
            }
            var messpat = /[a-zA-Z0-9 ]/ ;
            if (document.getElementById("<%=txtmessage.ClientID%>").value.match(messpat)) {

            }
            else {
                swal("Warning", "Invalid Message", "warning");
                return false;
            }
            return true;

        }
    </script>
    <div role="main">
        <div class=" post post-235 page type-page status-publish hentry">
            <div data-midnight="dark-title" class="row wpb_row row-fluid no-padding full-width-row row-o-content-middle row-flex">
                <div class="wpb_column columns medium-6 thb-dark-column small-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/9a893a79d4bdeaeda.png" style="margin-right:10px;height:672px;width:669px" />
                        </div>
                    </div>
                </div>
                <div class="wpb_column columns medium-6 thb-dark-column small-12">
                    <div class="vc_column-inner vc_custom_1503601094950">
                        <div class="wpb_wrapper">
                            <div class="vc_empty_space" style="height: 45px"><span class="vc_empty_space_inner"></span></div>

                            <div class="wpb_text_column wpb_content_element  ">
                                <div class="wpb_wrapper" style="margin-top: 100px">
                                    <h4>Drop Us an Email</h4>
                                    <p style="font-size: 18px;">If you&#8217;ve any problem or query related to our website,please fill following form.</p>

                                </div>
                            </div>
                            <div class="vc_empty_space" style="height: 40px"><span class="vc_empty_space_inner"></span></div>
                            <div role="form" class="wpcf7" id="wpcf7-f226-p235-o1" lang="en-US" dir="ltr">
                                <div class="row">
                                    <div class="small-12 medium-6 columns">
                                        <label>Your Name</label><br />
                                        <span class="wpcf7-form-control-wrap your-name">
                                            <asp:TextBox ID="txtname" runat="server" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required full"></asp:TextBox>
                                        </span>
                                    </div>
                                    <div class="small-12 medium-6 columns">
                                        <label>Your Email</label><br />
                                        <span class="wpcf7-form-control-wrap your-email">
                                            <asp:TextBox ID="txtemail" runat="server" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email full"></asp:TextBox>
                                        </span>
                                    </div>
                                    <div class="small-12 columns">
                                        <label>Your Message</label><br />
                                        <p>
                                            <span class="wpcf7-form-control-wrap your-message">

                                                <textarea id="txtmessage" runat="server" name="your-message" cols="40" rows="10" class="wpcf7-form-control wpcf7-textarea full"></textarea></span>
                                        </p>
                                        <p>
                                            <asp:Button ID="Button1" class="wpcf7-form-control wpcf7-submit btn" runat="server" Text="Send Message" OnClick="Button1_Click" OnClientClick="return validate()" />
                                        </p>
                                    </div>
                                </div>
                                <div class="wpcf7-response-output wpcf7-display-none"></div>
                            </div>
                            <div class="vc_empty_space" style="height: 45px"><span class="vc_empty_space_inner"></span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

