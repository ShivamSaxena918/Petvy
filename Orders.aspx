<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        <div class="page-padding post-6 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">
                            <h1 class="thb-shop-title">Your Orders</h1>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                            <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents" cellspacing="0" style="margin-top:30px">
                                <thead>
                                    <tr class="text-left">
                                        <td>ORDER PLACED
                                            <br />
                                            <asp:Label ID="lbldate" runat="server" Text='<%# Eval("CreatedOn") %>'></asp:Label></td>
                                        <td>TRANSACTION NUMBER<br />
                                            <asp:Label ID="lbltransno" runat="server" Text='<%# Eval("TransNo") %>'></asp:Label></td>
                                        <td>Total
                                            <br />
                                            <span>&#8377<asp:Label ID="lbltotal" runat="server" Text='<%# Eval("Price") %>'></asp:Label></span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="row" style="margin-left:20px">
                                        <td >
                                            <asp:HiddenField ID="Hid" runat="server"  Value='<%# Eval("ProductId") %>'/>
                                            <asp:Image ID="imgproduct" runat="server" Height="180" Width="180" />
                                        </td>
                                        <td style="margin-left:20px" class="text-center">
                                            <span>Product: <asp:Label ID="lblpname" runat="server" Text='<%# Eval("Name") %>'></asp:Label></span><br />
                                            <span>Sold By: <asp:Label ID="lblsname" runat="server" Text='<%# Eval("seller_fname") %>'></asp:Label></span><br />
                                           <span>&#8377<asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label></span><br />
                                            <asp:Button ID="btnbuyagain" runat="server" Text="Buy it Again" style="margin-top:50px" CommandName="again" CommandArgument='<%# Eval("ProductId") %>' />
                                        </td>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                </tbody>

                            </table>
                            </ItemTemplate>

                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

