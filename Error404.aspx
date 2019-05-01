<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Error404.aspx.cs" Inherits="Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div role="main" style="margin-top: 70px">
        <div class="page-padding post-8 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">

                            <div class="row align-center">
                                <div class="small-12 medium-6 large-4 columns">

                                    <div class="thb-overflow-container">
                                        <ul class="login-page-form">
                                            <li>
                                            <h1 style="color:red">ERROR 404
                                            </h1>
                                                </li>

                                            <li>
                                                <h4>Email Already Exist!!!!!</h4>
                                            </li>   
                                            
                                            </ul>
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Back</asp:LinkButton>

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

