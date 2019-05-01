<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="SellerDetails.aspx.cs" Inherits="BackOffice_SellerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">

        <asp:Repeater ID="rptseller" runat="server" >
            <ItemTemplate>
                <a>
                    <img src="../Gallery/<%# Eval("URL") %>" style="height: 200px; width: 200px;" />
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="row-center">
        <u>Title:</u>
        <p>

            <b>
                <asp:Label ID="lblTitle" runat="server"></asp:Label></b>
        </p>
        <u>GST No:</u>
        <p>
            <b>
                <asp:Label ID="lblGSTno" runat="server"></asp:Label></b>
        </p>
        <u>Contact No:</u>
        <p>
            <b>
                <asp:Label ID="lblContactno" runat="server"></asp:Label></b>
        </p>
        <u>Email:</u>
        <p>
            <b>
                <asp:Label ID="lblEmail" runat="server"></asp:Label></b>
        </p>
        <u>Web URL</u>
        <p>
            <b>
                <asp:Label ID="lblWebURL" runat="server"></asp:Label></b>
        </p>
    </div>

</asp:Content>

