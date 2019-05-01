<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="PostDetail.aspx.cs" Inherits="PostDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- START CONTENT -->
    <div class="card-panel">
        <div class="row">
            <div class="col s12">
                <h4 class="header1">Posts Details</h4>
            </div>

        </div>
        <div class="row">
            <asp:Repeater ID="rptpost" runat="server" OnItemCommand="rptpost_ItemCommand">
                <ItemTemplate>
                    <div class="col s6">

                        <div class="row center">
                            <div class="popup-gallery">
                                <div class="gallary-sizer"></div>
                                <a>
                                    <img src="../Gallery/<%# Eval("ImageName") %>" style="height: 200px; width: 200px;" />
                                </a>
                            </div>
                        </div>


                    </div>
                    <div class=" col s6">
                        <h5><u>Caption</u></h5>
                        <asp:Label ID="lblcaption" runat="server"></asp:Label>
                        <h5><u>Active</u></h5>
                        <asp:LinkButton ID="Isactive" runat="server" CommandName="Active" CommandArgument='<%# Eval("PostId") %>' Style="margin-left: 25px">
                            <b><i class="material-icons center" style="color: lawngreen; font-weight: bolder;">
                                <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
