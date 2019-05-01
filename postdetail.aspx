<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="postdetail.aspx.cs" Inherits="postdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div class="page-padding post-7 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <h1 class="thb-shop-title">Post Details</h1>
                            <div class="row">
                                <div class="large-offset-1 large-4">
                                    <figure id="product-images" class="carousel slick" data-navigation="true" data-columns="1" style="margin-left: 0px;">
                                        <div class="first woocommerce-product-gallery__image">
                                            <a href="#">
                                                <asp:Image ID="imgfirst" runat="server" Style="height: 380px; width: 600px; border-radius: 4px;" CssClass="attachment-shop_single size-shop_single wp-post-image" alt="" />
                                            </a>
                                        </div>

                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <div class="woocommerce-product-gallery__image">
                                                        <img style="height: 380px; width: 600px; border-radius: 4px" src='Gallery/<%# Eval("URL") %>' class="attachment-shop_single size-shop_single wp-post-image" alt="" title="z-1" data-caption="" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </figure>

                                </div>
                                <div class="large-offset-1 large-6 text-center">
                                    <u>
                                        <h3>
                                            <asp:Label ID="lbl" runat="server" Text="UPLOADED BY"></asp:Label></h3>
                                    </u>
                                    <asp:Image ID="imguser" Style="height: 80px; width: 80px; border: 2px; border-radius: 4px" runat="server" /><br />
                                    <h4>
                                        <asp:Label ID="lblname" runat="server"></asp:Label></h4>
                                    <h4>
                                        <asp:Label ID="lblemail" runat="server"></asp:Label></h4>
                                    <h4>
                                        <asp:Label ID="Label1" runat="server" Text="Likes :"></asp:Label>
                                        <asp:Label ID="lbllikecounter" runat="server"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Style="margin-left: 50px" Text="Comments :"></asp:Label>
                                        <asp:Label ID="lblcommentcounter" runat="server"></asp:Label>
                                    </h4>
                                    <h4 style="margin-top:40px">
                                        <asp:LinkButton ID="lbdelete" runat="server" OnClick="lbdelete_Click" Visible="false"><i style="font-size:44px;color:red" class="fa fa-trash"><h4>DELETE POST</h4></i></asp:LinkButton>
                                    </h4>
                                </div>
                            </div>
                            <div class="row">
                                <u>
                                    <h3>
                                        <asp:Label ID="Label3" runat="server" Text="COMMENTS ON POST"></asp:Label></h3>
                                </u>
                            </div>

                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class=" large-offset-1 large-11 small-12">
                                            <%--<asp:Image ID="imgcommentphoto"  runat="server" ImageUrl="<%# Eval("Image") %>" />--%>
                                            <asp:Label ID="lblname" style="font-size:20px;" runat="server" Text='<%# Eval("Fname")%>'></asp:Label>
                                            <asp:Label ID="Label4" style="font-size:20px;" runat="server" Text='<%# Eval("Mname")%>'></asp:Label>
                                            <asp:Label ID="Label5" style="font-size:20px;" runat="server" Text='<%# Eval("Lname")%>'></asp:Label>
                                            <asp:Label ID="Label6" style="font-size:20px;" runat="server" Text=':'></asp:Label>
                                            <asp:Label ID="lblcomment" style="font-size:16px;" runat="server" Text='<%# Eval("comment") %>'></asp:Label>
                                            
                                        </div>

                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Label ID="lblnocomment" runat="server" Text="No Comments on your post yet.." Visible="false" style="margin-left:500px"></asp:Label>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div role="main" style="margin-left: 210px;">
        <div id="fws_5a9279e54062a" data-midnight="dark-title" class="row wpb_row row-fluid row-has-fill row-o-full-height row-o-columns-middle row-o-content-middle row-flex">
            <div class="inner-wrap row max_width">
                <div class="text-center wpb_column columns medium-6 small-12 large-7">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div style="margin-top: 120px">
                                <div class="wpb_text_column wpb_content_element animation fade-in ">
                                    <div class="wpb_wrapper" style="color: black;">
                                        <div class="vc_empty_space" style="height: 50px"><span class="vc_empty_space_inner"></span></div>
                                        <div class="row" style="margin-left: 70px">
                                            <asp:Image ID="imgproo" runat="server" Style="height: 50px; width: 50px; border-radius: 2px; margin-top: 33px;" />
                                            <div class="vc_empty_space" style="width: 10px;"><span class="vc_empty_space_inner"></span></div>
                                            <textarea id="xyz" runat="server" rows="2" cols="2" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required full" style="width: 77%; resize: none; border-color: #808080" placeholder="Write Something Here ......."></textarea>
                                            <div class="row" style="margin-top: 12px; margin-left: 30px;">
                                                <div class="vc_empty_space" style="width: 60px;"><span class="vc_empty_space_inner"></span></div>
                                                <div class="fileUpload w3-btn w3-blue " style="margin-left: 20px">
                                                    <span>IMAGE/VIDEO</span>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" class="upload" AllowMultiple="true" />
                                                </div>

                                                <asp:Button ID="btnPost" runat="server" Text="POST" Style="margin-left: 160px; border: 0" CssClass="w3-btn w3-blue " OnClick="btnPost_Click" />
                                            </div>


                                            <%--<div class="vc_empty_space" style="width: 90px;"><span class="vc_empty_space_inner"></span></div>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                
                                                <script>
                                                    
                                                    function change()
                                                    {
                                                        //0alert("hauhfa");
                                                        document.getElementById("btnfile").type = 'file';
                                                    }
                                                </script>
                                                
                                                <asp:Button ID="btnfile" runat="server" Text="POST"  style="border-radius:10px"  CssClass="w3-button w3-white w3-border w3-border-blue w3-hover-blue" OnClick="change()" />
                                                <input id="btnfile" type="button" runat="server" value="IMAGES/VIDEOS" style="border-radius: 15px;" class="w3-button w3-white w3-border w3-border-blue w3-hover-blue" onclick="change()"/>
                                                <div class="vc_empty_space" style="width: 120px;"><span class="vc_empty_space_inner"></span></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <asp:Repeater ID="post_repeater" runat="server" OnItemCommand="post_repeater_ItemCommand">
                            <ItemTemplate>
                                <div class="wpb_text_column wpb_content_element animation fade-in ">
                                    <div class="wpb_wrapper" style="color: black;">
                                        <div class="vc_empty_space" style="height: 50px"><span class="vc_empty_space_inner"></span></div>
                                        <div class="row" style="margin-left: 70px">
                                            <div class="col-2">
                                                <img src="User_Images/<%# Eval("Image") %>" style="height: 50px; width: 50px; border-radius: 2px" />
                                            </div>
                                            <div class="">
                                                <asp:Label ID="lblname" runat="server" CssClass="align-justify"></asp:Label><br />
                                                <asp:Label ID="lbldatetime" runat="server" CssClass=""></asp:Label>
                                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("PostId") %>' />
                                            </div>
                                        </div>


                                        <div class="vc_empty_space" style="height: 5px"><span class="vc_empty_space_inner"></span></div>
                                        
                                        <div class="row">
                                            <div class="medium-12 large-12 text-center">
                                                <div data-columns="5">
                                                    <figure id="product-images" class="carousel slick" data-navigation="true" data-columns="1" style="margin-left: 0px;">
                                                        <div class="first woocommerce-product-gallery__image">
                                                            <a href="#">
                                                                <asp:Image ID="imgfirst" runat="server" Style="height: 380px; width: 600px; border-radius: 4px;" CssClass="attachment-shop_single size-shop_single wp-post-image" alt="" />
                                                            </a>
                                                        </div>
                                                        
                                                            <asp:Repeater ID="Repeater2" runat="server">
                                                                <ItemTemplate>
                                                                    <div class="woocommerce-product-gallery__image">
                                                                    <a href="#">
                                                                        <img style="height: 380px; width: 600px; border-radius: 4px" src='Gallery/<%# Eval("URL") %>' class="attachment-shop_single size-shop_single wp-post-image" alt="" title="z-1" data-caption="" /></a>

                                                                    <%-- <div data-thumb="Gallery/z20-3.jpg" class="first woocommerce-product-gallery__image">
                                            <a href="Gallery/z20-3.jpg">
                                                <img width="1000" height="1250" src="Gallery/z20-3.jpg" class="attachment-shop_single size-shop_single wp-post-image" alt="" title="z-1" data-caption="" sizes="(max-width: 1000px) 100vw, 1000px" /></a>
                                        </div>            
                                        </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        
                                                    </figure>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="vc_empty_space" style="height: 5px"><span class="vc_empty_space_inner"></span></div>

                                        <div class="row" style="margin-left: 85px">
                                            <asp:Label ID="lblcaption" runat="server"></asp:Label>
                                            <div class="vc_empty_space" style="height: 20px;"><span class="vc_empty_space_inner"></span></div>
                                        </div>


                                        <div class="row" style="margin-left: 88px">
                                            <div class="vc_empty_space" style="height: 0px;"><span class="vc_empty_space_inner"></span></div>
                                            <asp:ImageButton ID="lblike" runat="server" CommandName="btnlike" CommandArgument='<%# Eval("PostId") %>' />
                                            <div class="vc_empty_space" style="width: 10px;"><span class="vc_empty_space_inner"></span></div>
                                            <a id="" href="#" title="Likes"><span class="float_count">
                                                <asp:Label ID="lbllikecounter" runat="server"></asp:Label></span></a>
                                            <div class="vc_empty_space" style="width: 500px;"><span class="vc_empty_space_inner"></span></div>

                                            <asp:ImageButton ID="lbcomment" runat="server" CommandName="btncomment" CommandArgument='<%# Eval("PostId") %>' ImageUrl="maxcdn.bootstrapcdn.com/font-awesome/5.0.8/css/chat.png" />


                                            <div class="vc_empty_space" style="width: 10px;"><span class="vc_empty_space_inner"></span></div>
                                            <a id="" href="#" title="Comments"><span class="float_count">
                                                <asp:Label ID="lblcommentcounter" runat="server"></asp:Label></span>
                                            </a>
                                        </div>

                                        <div class="row" style="background-color: #ded4d4; width: 598px; margin-left: 85px">
                                            <div style="margin-left: 10px;">
                                                <asp:Image ID="CommentImage" runat="server" Height="25px" Width="25px" />
                                                <asp:Label ID="lblshowcomment" runat="server" Font-Size="Small" Font-Italic="true" Font-Bold="false"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="vc_empty_space" style="height: 10px;"><span class="vc_empty_space_inner"></span></div>
                                        <div class="row" style="margin-left: 83px">
                                            <img src="User_Images/<%# Eval("User_Image") %>" style="height: 38px; width: 38px; border-radius: 2px" />
                                            <div class="vc_empty_space" style="width: 10px;"><span class="vc_empty_space_inner"></span></div>

                                            <asp:TextBox ID="txtcomment" runat="server" CssClass="wpcf7-form-control wpcf7-text wpcf7-validates-as-required full" Style="width: 73%; border-radius: 12px" placeholder="Write Your Comments Here..."></asp:TextBox>
                                            <div class="vc_empty_space" style="width: 8px;"><span class="vc_empty_space_inner"></span></div>
                                            <asp:ImageButton ID="IbComment" runat="server" ImageUrl="maxcdn.bootstrapcdn.com/font-awesome/5.0.8/css/comment.png" Height="38px" Width="38px" CommandArgument='<%# Eval("PostId") %>' CommandName="AddComment" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>

