<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Profile1.aspx.cs" Inherits="Profile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div class="page-padding post-7 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <h1 class="thb-shop-title">My Profile</h1>
                        <div class="row  animation fade-in">
                            <div class="small-5 large-3 xlarge-2 columns">
                                <div class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields align-center">

                                            <div class="woocommerce-billing-fields__field-wrapper">
                                                <p class="form-row form-row-first validate-required text-center" data-priority="10">
                                                    <asp:Image ID="imgprofile" runat="server" Style="height: 200px; width: 200px; border: dashed; border-width: 2px" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="small-5 large-3 xlarge-2 columns">
                                <div class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">

                                            <div class="woocommerce-billing-fields__field-wrapper">
                                                <p class="form-row form-row-first validate-required" data-priority="10">
                                                    <h3>
                                                        <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
                                                    </h3>
                                                </p>
                                                <p class="form-row form-row-first validate-required" data-priority="10">
                                                    <h3>
                                                        <asp:Label ID="lbladdress" runat="server" Text="Label"></asp:Label>
                                                    </h3>
                                                </p>
                                                <p class="form-row form-row-first validate-required" data-priority="10">
                                                    <h3>
                                                        <asp:Label ID="lblcno" runat="server" Text="Label"></asp:Label>
                                                    </h3>
                                                </p>
                                                <p class="form-row form-row-first validate-required" data-priority="10">
                                                    <h3>
                                                        <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label>
                                                    </h3>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="small-5 large-3 xlarge-2 columns">
                                <div class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields align-center">

                                            <div class="woocommerce-billing-fields__field-wrapper">
                                                <p class="form-row form-row-first validate-required" data-priority="10">
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="small-5 large-3 xlarge-2 columns">
                                <div class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields align-center">

                                            <div class="woocommerce-billing-fields__field-wrapper">
                                                <p class="form-row form-row-first validate-required" data-priority="10">
                                                    <div class="vc_empty_space" style="height: 55px"><span class="vc_empty_space_inner"></span></div>
                                                    <asp:Button ID="Button1" runat="server" Text="EDIT PROFILE" CssClass="w3-btn w3-blue" OnClick="Button1_Click" />
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="vc_empty_space" style="height: 55px"><span class="vc_empty_space_inner"></span></div>
                        <div class="row animation fade-in">
                            <div class="small-5 large-8 xlarge-2 columns">
                                <h1><u>
                                    <asp:Label ID="lblproducts" runat="server" Text="Label" Visible="false">Your Products</asp:Label>
                                </u></h1>
                                <div class="row">
                                    <asp:Repeater ID="rptproducts" runat="server" OnItemCommand="rptproducts_ItemCommand">
                                        <ItemTemplate>
                                            <div class="small-12 large-12 xlarge-12 columns">
                                                <div class="small-5 large-4 xlarge-4 columns">
                                                    <asp:HiddenField ID="hfproduct" runat="server" Value='<%# Eval("ProductId") %>' />
                                                    <asp:Image ID="Image1" runat="server" Style="height: 90px; width: 90px;" />
                                                </div>
                                                <div class="small-5 large-3 xlarge-5 columns">
                                                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("Name") %>'></asp:Label><br />
                                                    <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                </div>
                                                <div class="small-2 large-2 xlarge-3 columns">
                                                    <asp:Button ID="btnview" runat="server" CssClass="w3-blue" style="height:40px;width:40px;font-size:14px;margin-top:10px" Text="EDIT" CommandName="submit" CommandArgument='<%# Eval("ProductId") %>' />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:Label ID="lblnoproduct" runat="server" Text="No Product Added Yet" Visible="true" style="margin-left:580px" ></asp:Label>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="row animation fade-in">
        <div class="small-5 large-3 xlarge-2 columns">
            <h1><u>
                <asp:Label ID="lblpost" runat="server" Text="Label">Your Posts</asp:Label>
            </u></h1>
        </div>
    </div>
    <div role="main">
        <div data-midnight="dark-title" class="row wpb_row row-fluid row-has-fill row-o-columns-middle row-o-content-middle">
            <div class="inner-wrap row max_width">
                <div class="text-center wpb_column columns medium-12 small-12">
                    <asp:DataList ID="post_repeater" runat="server" RepeatColumns="4">
                        <ItemTemplate>
                            <div class="wpb_text_column wpb_content_element animation fade-in ">
                                <div class="wpb_wrapper" style="color: black;">
                                    <div class="row">
                                        <div class="vc_empty_space" style="width: 50px;"><span class="vc_empty_space_inner"></span></div>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("PostId") %>' />
                                        </di>
                                    </div>


                                    <div class="vc_empty_space" style="height: 5px"><span class="vc_empty_space_inner"></span></div>
                                    <div class="row">
                                        <div class="w3-content w3-display-container">
                                            <a href ='postdetail.aspx?POID=<%# Eval("PostId") %>'><img src="Gallery/<%# Eval("Post_Image") %>" style="height: 200px; width: 200px; border-radius: 4px; margin-left: 40px"></a>
                                        </div>
                                        <%--<img src="User_Images/<%# Eval("Post_Image") %>" style="height: 380px; width: 600px; border-radius: 4px" />--%>
                                    </div>
                                    <div class="vc_empty_space" style="height: 5px"><span class="vc_empty_space_inner"></span></div>
                                    <div class="vc_empty_space" style="height: 10px;"><span class="vc_empty_space_inner"></span></div>
                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                    <asp:Label ID="lblviewpost" runat="server" Text="No Post Yet" Visible="false"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

