<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="ChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script lang="javascript" type="text/javascript">
        function validate() 
        {
            var letters = /^[A-Za-z0-9]+$/;
            if (document.getElementById("<%=txtpass.ClientID%>").value.match(letters)) {

            }
            else {
                swal('Error', 'Password can only contain alphabets and digits', 'error')
                return false;
            }
            var password = document.getElementById("<%=txtpass.ClientID%>").value;
            var confirmPassword = document.getElementById("<%=txtconpass.ClientID%>").value;
            if (password != confirmPassword) {
                swal('Error', 'Password do not match', 'error')

                return false;
            }
            return true;
        }
        </script>
    <div role="main">
        <div class="page-padding post-6 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <h1 class="thb-shop-title">Change Password</h1>


                            <div class="row">
                                <div class="small-10 large-offset-3 large-6 xlarge-9 columns align-center">
                                    <div class="col2-set" id="customer_details">
                                        <div class="col-1">
                                            <div class="woocommerce-billing-fields">
                                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                    <label for="txtpname">New Password<span class="required">*</span></label>
                                                    <input type="password" class="woocommerce-Input woocommerce-Input--text input-text" id="txtpass" runat="server" title="Enter Password" placeholder="Enter New Password" />
                                                </p>
                                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                    <label for="txtpname">Confirm Password<span class="required">*</span></label>
                                                    <input type="password" class="woocommerce-Input woocommerce-Input--text input-text" id="txtconpass" runat="server" title="Confirm Password" placeholder="Confirm Password" />
                                                </p>
                                                <div class="form-row place-order" style="margin-top: 30px">
                                                    <asp:Button ID="btnchange" CssClass="woocommerce-Button button" runat="server" Text="CONFIRM" OnClick="btnchange_Click" OnClientClick="return validate()" />
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
    </div>
</asp:Content>

