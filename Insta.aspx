<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Insta.aspx.cs" Inherits="Insta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        var slideIndex = 1;
        showDivs(slideIndex);

        function plusDivs(n) {
            showDivs(slideIndex += n);
        }

        function showDivs(n) {
            var i;
            var x = document.getElementsByClassName("mySlides");
            if (n > x.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = x.length }
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            x[slideIndex - 1].style.display = "block";
        }
    </script>
    <script>
        function validate() {
            var name = document.getElementById("<%=xyz.ClientID%>").value.trim();
            if (name == "") {

                swal("Warning", "Invalid Caption", "warning");
                document.getElementById("<%=xyz.ClientID%>").focus();
                return false;
            }
            var letters = /^[A-Za-z 0-9]+$/;
            if (document.getElementById("<%=xyz.ClientID%>").value.match(letters)) {

            }
            else {
                swal("Warning", "Invalid Caption", "warning");
                return false;
            }
            return true;

        }
    </script>
    <div role="main" style="margin-left: 210px;">
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
                                                    <span>SELECT IMAGES</span>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" class="upload" AllowMultiple="true" />
                                                </div>

                                                <asp:Button ID="btnPost" runat="server" Text="POST" Style="margin-left: 160px; border: 0" CssClass="w3-btn w3-blue " OnClick="btnPost_Click" OnClientClick="return validate()" />
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
                                                <asp:Button ID="btnpost" runat="server" Text="POST" Style="border-radius: 15px;" CssClass="w3-button w3-white w3-border w3-border-blue w3-hover-blue" />--%>
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
                                        <div class="row" style="margin-left: 90px">
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
                                        <%--<div class="w3-content w3-display-container">
                                                <img src="User_Images/<%# Eval("Post_Image") %>" style="height: 380px; width: 600px; border-radius: 4px">
                                            </div>--%>
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
                                        </div>--%>
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

                                            <%--<asp:LinkButton ID="lbcomment" runat="server">
                                                                <img src="maxcdn.bootstrapcdn.com/font-awesome/5.0.8/css/chat.png" />
                                                            </asp:LinkButton>--%>

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
                                            <%--<input type="text" id="txtcomment" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required full" runat="server" style="width: 83%;border-radius:12px" placeholder="Write Your Comments Here..." />--%>
                                            <%--<input type="submit" name="register" value="Register" style="border:0px;height:37px;width:15px;"/>--%>
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
    </div>
</asp:Content>

