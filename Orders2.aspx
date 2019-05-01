<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Orders2.aspx.cs" Inherits="Orders2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div class="page-padding post-6 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <h1 class="thb-shop-title">Orders</h1>
                            <asp:Repeater ID="rpthead" runat="server">
                                <ItemTemplate>
                                    <hr />
                                    <div class="row">
                                        <div class="large-4">
                                            <h5 style="margin: 0;">Order Placed on</h5>
                                            <h5 style="margin: 0;">
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("CreatedOn") %>'></asp:Label></h5>
                                        </div>
                                        <div class="large-5 text-center">
                                            <h5 style="margin: 0;">Address To Ship</h5>
                                        </div>
                                        <div class="large-1 text-center">
                                            <h5 style="margin: 0; margin-top: 10px">Shipped</h5>
                                        </div>
                                        <div class="large-1 text-right">
                                            <h5 style="margin: 0; margin-right: 20px; margin-top: 10px;margin-left:40px">Quantity</h5>
                                        </div>
                                        <div class="large-1 text-right">
                                            <h5 style="margin: 0; margin-right: 20px; margin-top: 10px">Total</h5>
                                        </div>
                                    </div>
                                    <hr />

                                    <div class="row">
                                        <div class="large-2">
                                            <asp:HiddenField ID="Hid" runat="server" Value='<%# Eval("OrderDetailId") %>' />
                                            <asp:Image ID="imgproduct" runat="server" Height="180" Width="180" />
                                        </div>
                                        <div class="large-2 text-left">
                                            <h6>
                                                <asp:Label ID="Label1" runat="server" Text="Product Name :"></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                            </h6>
                                            <h6>
                                                <asp:Label ID="Label3" runat="server" Text="Product Price :"></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                            </h6>
                                            <h6>
                                                <asp:Label ID="Label5" runat="server" Text="Buyer Name :"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                            </h6>

                                        </div>
                                        <div class="large-offset-2 large-2 text-left">
                                            <h6>
                                                <asp:Label ID="lbladdress1" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                <asp:Label ID="lbladdress2" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                <asp:Label ID="lbladdress3" runat="server" Text="Label"></asp:Label>
                                            </h6>
                                        </div>
                                        <div class=" large-offset-1 large-1 text-center">
                                            <asp:Label ID="lblshipped" runat="server" style="color:deepskyblue" Text="ON HOLD"></asp:Label>
                                        </div>
                                        <div class="large-1 text-right">
                                            <asp:Label ID="lblqty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                                        </div>
                                        <div class="large-1 text-right">
                                            <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Amt") %>'></asp:Label>
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
</asp:Content>

