<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="NewsLetter.aspx.cs" Inherits="NewsLetter" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="ckeditor/ckeditor.js"></script>

    <div class="row">
        <div class="card-panel">
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">view_list</i>
                    <asp:DropDownList ID="ddnews" AutoPostBack="true" OnSelectedIndexChanged="ddnews_SelectedIndexChanged" runat="server"></asp:DropDownList>
                </div>
                <div class="input-field col s12">

                    <asp:TextBox ID="txtdescription" TextMode="MultiLine" class="ckeditor" runat="server"></asp:TextBox>

                </div>
            </div>

            <div class="row">
                <div class="input-field col s12">
                    <asp:Button ID="btnsend" runat="server" Text="Send Newsletter" CssClass="btn" OnClick="btnsend_Click" />

                </div>
            </div>

        </div>
    </div>

</asp:Content>

