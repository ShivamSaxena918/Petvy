<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script lang="javascript" type="text/javascript">
        function validate() {
               var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;

            var emailid = document.getElementById("<%=txteemail.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                swal("Warning", "Incorrect Email", "warning");
                document.getElementById("<%=txteemail.ClientID %>").focus();
                return false;
            }
            return true;
         
        }
    </script>
    <div role="main" style="margin-top: 100px">
        <div class="page-padding post-8 page type-page status-publish hentry">
            <div class="row">
                <div class="small-6 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">

                            <div class="row align-center">
                                <div class="small-12 medium-6 large-4 columns">
                                    <div class="thb-form-container">
                                        <div class="thb-login-form">

                                            <div class="woocommerce-form woocommerce-form-login login">


                                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                    <label>Email address <span class="required">*</span></label>
                                                    <asp:TextBox ID="txteemail" CssClass="woocommerce-Input woocommerce-Input--text input-text" runat="server"></asp:TextBox>
                                                    <%--<label for="Email">Email address <span class="required">*</span></label>
                                                    <input id="txteemail" type="text" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" runat="server" />--%>
                                                </p>


                                                <p class="form-row">
                                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="woocommerce-Button button" OnClick="btnsubmit_Click" OnClientClick="return validate()" />
                                                </p>
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

</asp:Content>

