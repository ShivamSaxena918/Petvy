<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="NewPassword.aspx.cs" Inherits="NewPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main" style="margin-top: 70px">
        <div class="page-padding post-8 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 medium-9 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">

                            <div class="row align-center" style="margin-top:80px">
                                <div class="small-12 medium-12 large-4 columns">

                                    <div class="thb-form-container">
                                        <div class="thb-login-form">
                                            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                <label for="username">Password <span class="required">*</span></label>
                                                <asp:TextBox ID="txtpass" runat="server" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" TextMode="Password"></asp:TextBox>
                                            </p>
                                            <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                <label for="password">Confirm Password <span class="required">*</span></label>
                                                <asp:TextBox ID="txtcpass" runat="server" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" TextMode="Password"></asp:TextBox>
                                            </p>
                                            <p class="form-row">
                                                <asp:Button ID="btndone" runat="server" Text="DONE" CssClass="woocommerce-Button button" />
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
</asp:Content>

