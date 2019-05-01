<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div role="main">
        
            <div class="page-padding shop-header-style2">
                <h1 class="thb-shop-title">Shop</h1>
            </div>

            <div class="row">
                <div class="large-12 text-center">
                    <h3>Your purchase of products is SUCCESSFUL</h3>
                    <h5>Your Transaction ID for this transaction is
                    <asp:Label ID="lbltran" runat="server" Text="Label"></asp:Label>.</h5>
                    <h5>We have received a payment of &#8377;<asp:Label ID="lblprice" runat="server" Text="Label"></asp:Label>. Your Receipt will be send on your E-Mail. </h5>
                </div>
            </div>
            <div class="row">
                <div class="large-offset-3 large-6 large-offset-3" style="border-color: black">
                    <asp:Panel ID="Panel1" runat="server">
                    <div class="w3-card-4">

                        <div class="row">
                            <div class="large-3">
                                <asp:Image ID="imglogo" runat="server" ImageUrl="LOGO/dark5.png" />
                            </div>
                            <div class="large-offset-5 large-4 text-center" style="margin-top: 60px">
                                <u>Date</u>
                                <br />
                                <asp:Label ID="lbldate" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-3" style="margin-left: 30px">
                                <u>User Details</u>
                                <br />
                                <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                <br />
                                <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label>
                                <br />
                                <asp:Label ID="lblcno" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="large-offset-3  large-5 text-center">
                                <u>Address</u><br />
                                <asp:Label ID="lbladdress1" runat="server" Text="Label"></asp:Label>
                                <br />
                                <asp:Label ID="lbladdress2" runat="server" Text="Label"></asp:Label>
                                <br />
                                <asp:Label ID="lbladdress3" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <hr />
                        <div class="row" style="margin-top: 10px; margin-left: 30px">

                            <div class="large-4">
                                Product Name
                            </div>
                            <div class="large-4">
                                Quantity
                            </div>
                            <div class="large-3 text-right">
                                Price
                            </div>
                        </div>
                        <hr />

                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="row" style="margin-left: 30px">
                                    <div class="large-4">
                                        <%--<asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ProductId") %>' />--%>
                                        <asp:Label ID="lblhdd" runat="server" Text='<%# Eval("ProductId") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblproname" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </div>
                                    <div class="large-4">
                                        <asp:Label ID="lblqty" Style="margin-left: 20px" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                                    </div>
                                    <div class="large-3 text-right">
                                        &#8377;<asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    </div>
                                </div>
                                <hr />
                            </ItemTemplate>
                        </asp:Repeater>
                        <hr />
                        <div class="row">
                            <div class="large-4" style="margin-left: 30px">
                                <asp:Label ID="lbl1" runat="server" Text="Total(Including CGST & SGST)"></asp:Label>
                            </div>
                            <div class=" large-offset-4 large-3 text-right" style="margin-bottom: 40px">
                                &#8377;<asp:Label ID="lbltotal" runat="server"></asp:Label>
                            </div>
                        </div>

                    </div>
                        </asp:Panel>
                </div>
            </div>

        
        
            <div class="row" style="margin-top: 40px">
                <div class="large-3 text-right">
                    <asp:Button ID="btngenerate" runat="server" Text="Generate PDF" OnClick="btngenerate_Click" />
                </div>
                <div class="large-offset-6 large-3">
                    <asp:Button ID="btnback" runat="server" Text="Continue Shopping" OnClick="btnback_Click" />
                </div>
            </div>
    </div>
</asp:Content>

