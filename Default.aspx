<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div id="thb_fullscreen_rows" data-disable-scroll="">
            <div id="fws_5a9279e54062a" data-midnight="light-title" class="row wpb_row row-fluid vc_custom_1506160468201 row-has-fill row-o-full-height row-o-columns-middle row-o-content-middle row-flex">
                <div class="inner-wrap row max_width">
                    <div class="text-center wpb_column columns medium-12 thb-light-column small-12">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <div class="wpb_text_column wpb_content_element animation fade-in ">
                                    <div class="wpb_wrapper">
                                        <h6>CERTIFIED PRODUCTS</h6>

                                    </div>
                                </div>
                                <div class="vc_empty_space" style="height: 35px"><span class="vc_empty_space_inner"></span></div>

                                <div class="wpb_text_column wpb_content_element animation fade-in ">
                                    <div class="wpb_wrapper">
                                        <h1>New Summer<br />
                                            Collection For Pets &#8217;18
                                        </h1>

                                    </div>
                                </div>
                                <div class="vc_empty_space" style="height: 45px"><span class="vc_empty_space_inner"></span></div>
                                <a class="btn   white animation fade-in" href="Product.aspx" target="_blank" role="button" title="Shop Today">Shop Today</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="fws_5a9279e541696" data-midnight="dark-title" class="row wpb_row row-fluid vc_custom_1506160210036 row-has-fill row-o-full-height row-o-columns-middle row-o-content-middle row-flex">
                <div class="inner-wrap row max_width">
                    <div class="text-center wpb_column columns medium-12 thb-dark-column small-12">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <div class="wpb_text_column wpb_content_element animation fade-in ">
                                    <div class="wpb_wrapper">
                                        <h1>New Arrivals</h1>

                                    </div>
                                </div>
                                <div class="vc_empty_space" style="height: 35px"><span class="vc_empty_space_inner"></span></div>
                                <a class="btn    animation fade-in" href="Product.aspx" target="_blank" role="button" title="Check out the Look Book">Check out Before U Miss It</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="fws_5a9279e542591" data-midnight="dark-title" class="row wpb_row row-fluid vc_custom_1505898659845 row-has-fill row-o-full-height row-o-columns-middle row-o-content-middle row-flex">
                <div class="inner-wrap row max_width">
                    <div class="wpb_column columns medium-12 thb-dark-column small-12">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <div class="row wpb_row vc_inner row-fluid align-center">
                                    <div class="text-center wpb_column columns medium-12 large-6 medium-9 thb-dark-column small-12">
                                        <div class="vc_column-inner ">
                                            <div class="wpb_wrapper">
                                                <div class="wpb_text_column wpb_content_element animation bottom-to-top ">
                                                    <div class="wpb_wrapper">
                                                        <h6>LATEST EVENTS</h6>

                                                    </div>
                                                </div>
                                                <div class="vc_empty_space" style="height: 25px"><span class="vc_empty_space_inner"></span></div>

                                                <div class="vc_empty_space" style="height: 40px"><span class="vc_empty_space_inner"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row wpb_row vc_inner row-fluid">
                                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>


                                    <asp:Repeater ID="rptevent" runat="server" OnItemCommand="rptevent_ItemCommand">
                                        <ItemTemplate>

                                            <div class="wpb_column columns animation bottom-to-top medium-3 thb-dark-column small-12">
                                                <div class="vc_column-inner ">
                                                    <div class="wpb_wrapper">
                                                        <div class="thb-team-member">
                                                            <img width="320" height="340" src='Gallery/<%# Eval("URL") %>' sizes="(max-width: 320px) 100vw, 320px" />
                                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("EventName") %>'></asp:Label>
                                                            <asp:Button ID="Button1" runat="server" Text="I AM INTERESTED" Style="margin-left: 40px; margin-top: 20px" CommandName="intrust" CommandArgument='<%# Eval("EventId") %>' />
                                                        </div>
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
            </div>
            <div id="fws_5a9279e54544c" data-midnight="dark-title" class="row wpb_row vc_custom_1505895896149">
                <div class="inner-wrap row max_width">
                    <div class="wpb_column columns medium-12 thb-dark-column small-12">
                        <div class="row" style="margin-top:170px;margin-left:400px">
                            <h3 >Some Major Information About Your Pets</h3>
                        </div>
                        <div class="row" style="margin-top:80px">
                            <div class="large-3 text-center">
                                <asp:Image ID="img1" runat="server" style="height:200px;width:250px;border-radius:4px" ImageUrl="LOGO/Collage_of_Nine_Dogs.jpg" /><br />
                                <h5><asp:Label ID="Label1" runat="server" Text="All Dog Information" style="margin-top:20px;color:deepskyblue"></asp:Label></h5>
                                <asp:Button ID="btndoginfo" runat="server" OnClick="btndoginfo_Click" Text="View More."  />
                            </div>
                            <div class=" large-offset-6 large-3 text-center">
                                <asp:Image ID="img2" runat="server" style="height:200px;width:250px;border-radius:4px" ImageUrl="LOGO/Collage_of_Six_Cats-02.jpg" /><br />
                                <h5><asp:Label ID="Label2" runat="server" Text="All Cat Information" style="margin-top:20px;color:deepskyblue"></asp:Label></h5>
                                <asp:Button ID="btncatinfo" runat="server" Text="View More." OnClick="btncatinfo_Click"  />
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="fws_5a9279e5458df" data-midnight="light-title" class="row wpb_row row-fluid vc_custom_1505895888717 row-has-fill row-o-full-height row-o-columns-middle row-o-content-middle row-flex">
                <div class="inner-wrap row max_width">
                    <div class="text-center wpb_column columns medium-12 thb-light-column small-12">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <div class="caption-style1 animation fade-in aligncenter  thb_image_link wp-caption">
                                    <img width="148" height="180" src="wp-content/uploads/sites/4/2017/09/snap_scroll_logo_2x.png" class="thb_image retina_size attachment-full" alt="" />
                                </div>
                                <div class="vc_empty_space" style="height: 35px"><span class="vc_empty_space_inner"></span></div>

                                <div class="wpb_text_column wpb_content_element animation bottom-to-top ">
                                    <div class="wpb_wrapper">
                                        <h3>Contact us to find out more or<br />
                                            how we can help you better.
                                        </h3>

                                    </div>
                                </div>
                                <div class="vc_empty_space" style="height: 35px"><span class="vc_empty_space_inner"></span></div>

                                <div class="wpb_text_column wpb_content_element animation bottom-to-top ">
                                    <div class="wpb_wrapper">
                                        <h6>GENERAL STORE</h6>
                                        <p>
                                            Soon To Open Own Stores<br />
                                            Delhi , Surat , Ahemdabad<br />
                                            +91 9978378278
                                        </p>
                                        <h6>CUSTOMER SUPPORT AND GENERAL INQURIES</h6>
                                        <p><a href="Inquiry.aspx">customers@petvy.com</a></p>

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

