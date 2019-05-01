<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card-panel">
        <div class="row">
            <div class="col s12 m12 l12">
                <h4 class="header1">Product Details</h4>

            </div>
        </div>
        <div class="divider"></div>
        <div class="row">

            <asp:DataList ID="ddproduct" runat="server" RepeatColumns="3">
                <ItemTemplate>
                    <div class="row center">
                        <div class="popup-gallery">
                            <div class="gallary-sizer"></div>
                            <a>
                                <img src="../Gallery/<%# Eval("URL") %>" style="height: 200px; width: 200px;" />
                            </a>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:DataList>


        </div>
        <div class="row-center">
            <u>Product Name:</u>
            <p>

                <b>
                <asp:Label ID="lblproName" runat="server"></asp:Label></b>
            </p>
            <u>Price:</u>
            <p>

                <b>
                    <asp:Label ID="lblPrice" runat="server"></asp:Label></b>
            </p>
           <u> Manufacture Date:</u>
            <p>

                <b>
                    <asp:Label ID="lblmfgDate" runat="server"></asp:Label></b>
            </p>
            <u>Expiry Date:</u>
            <p>

                <b>
                    <asp:Label ID="lblExpDate" runat="server"></asp:Label></b>
            </p>
            <u>CreatedOn:</u>
            <p>

                <b>
                    <asp:Label ID="lblCreatedOn" runat="server"></asp:Label></b>
            </p>

        </div>

    </div>


</asp:Content>

