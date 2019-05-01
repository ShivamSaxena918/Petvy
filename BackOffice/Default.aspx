<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="card-stats">
              <div class="row">
                <div class="col s12 m6 l3">
                  <div class="card gradient-45deg-light-blue-cyan gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                      <div class="col s7 m7">
                        <i class="material-icons background-round mt-5">add_shopping_cart</i>
                        <p>Orders</p>
                      </div>
                      <div class="col s5 m5 right-align">
                        <h5 class="mb-0">
                            <asp:Label ID="lblordernew" runat="server"></asp:Label></h5>
                        <p class="no-margin">New</p>
                        <p>
                            <asp:Label ID="lblordertotal" runat="server" ></asp:Label></p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col s12 m6 l3">
                  <div class="card gradient-45deg-red-pink gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                      <div class="col s7 m7">
                        <i class="material-icons background-round mt-5">perm_identity</i>
                        <p>Users</p>
                      </div>
                      <div class="col s5 m5 right-align">
                        <h5 class="mb-0">
                            <asp:Label ID="lblusernew" runat="server" ></asp:Label></h5>
                        <p class="no-margin">New</p>
                        <p>
                            <asp:Label ID="lblusertotal" runat="server" ></asp:Label></p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col s12 m6 l3">
                  <div class="card gradient-45deg-amber-amber gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                      <div class="col s7 m7">
                        <i class="material-icons background-round mt-5">wallpaper</i>
                        <p>Posts</p>
                      </div>
                      <div class="col s5 m5 right-align">
                        <h5 class="mb-0">
                            <asp:Label ID="lblpostnew" runat="server" ></asp:Label></h5>
                        <p class="no-margin">New</p>
                        <p>
                            <asp:Label ID="lblposttotal" runat="server"></asp:Label></p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col s12 m6 l3">
                  <div class="card gradient-45deg-green-teal gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                      <div class="col s7 m7">
                        <i class="material-icons background-round mt-5">event_note</i>
                        <p>Events</p>
                      </div>
                      <div class="col s5 m5 right-align">
                        <h5 class="mb-0">
                            <asp:Label ID="lbleventsnew" runat="server" ></asp:Label></h5>
                        <p class="no-margin">Active</p>
                        <p>
                            <asp:Label ID="lbleventtotal" runat="server" ></asp:Label></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
</asp:Content>

