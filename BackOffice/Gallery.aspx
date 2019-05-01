<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card-panel">
        <div class="row">
            <div class="col s12">
                <h4 class="header1">Gallery</h4>
                <div class="divider"></div>
            </div>

        </div>

        <div class="row">
            <div class="input-field col s9">
                <i class="material-icons prefix">collections</i>
                <asp:DropDownList ID="ddAlbumNames" runat="server" placeholder="Album Name" AutoPostBack="true" OnSelectedIndexChanged="ddAlbumNames_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="input-field col s1">
                <asp:Button Class="btn waves-effect waves-light" ID="btndeletealbum" runat="server" Text="Delete Album" OnClick="btndeletealbum_Click" />
            </div>

        </div>

        <asp:Panel ID="Panel1" runat="server">
            <asp:DataList ID="Datalist1" runat="server" RepeatColumns="3" OnItemCommand="Datalist1_ItemCommand">
                <ItemTemplate>
                    <div class="row center">
                        <div class="popup-gallery">
                            <div class="gallary-sizer"></div>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ImageId") %>' />
                            <a href="../Gallery/<%# Eval("URL") %>" title="<%# Eval("Name") %>">
                                <img src="../Gallery/<%# Eval("URL") %>" style="height: 200px; width: 200px;" />
                            </a>
                        </div>
                    </div>
                    <div class="caption center">
                        <asp:LinkButton ID="lbdelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("ImageId") %>' ><b><i class="material-icons" style="color:red;font-size:35px">clear</i></b></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </asp:Panel>
    </div>
</asp:Content>

