<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="verification.aspx.cs" Inherits="verification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main" style="margin-top: 100px">
        <div class="page-padding post-8 page type-page status-publish hentry">
            <div class="row">
                <div class="small-6 medium-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">

                            <div class="row align-center">
                                <div class="small-12 medium-12 large-12 columns">
                                    <div class="thb-form-container">
                                        <div class="thb-login-form">

                                            <div class="woocommerce-form woocommerce-form-login login">
                                                <u><h1>Please Enter Verification Code</h1></u>
                                                </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            <div class="row">
                                <div class="small-12 medium-12 large-12  medium-offset-1 columns">

                                          <h5>An verification code is sent to your email <asp:Label ID="Label1" runat="server" Text=""></asp:Label>.Please Enter code in textbox below  </h5>
                                    </div>
                                </div>
                            <div class="row">
                                <div class="small-12 medium-12 large-12 columns text-center">
                                                <br />
                                                <br />
                                                
                                                    
                                                <asp:TextBox ID="txtCode" CssClass="form-control" placeholder="Enter verification code" runat="server" Width="50%" Height="30%"></asp:TextBox>

                                                <div class="form-row place-order large-offset-5">
                                                    <asp:Button ID="btndone" runat="server" Text="SUBMIT" CssClass="woocommerce" OnClick="btndone_Click" />
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

