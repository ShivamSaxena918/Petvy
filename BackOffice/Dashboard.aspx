<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                <asp:Label ID="lblordertotal" runat="server" Text="Label"></asp:Label>
                            </p>
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
                                <asp:Label ID="lblusernew" runat="server"></asp:Label></h5>
                            <p class="no-margin">New</p>
                            <p>
                                <asp:Label ID="lblusertotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card gradient-45deg-amber-amber gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                        <div class="col s7 m7">
                            <i class="material-icons background-round mt-5">timeline</i>
                            <p>Posts</p>
                        </div>
                        <div class="col s5 m5 right-align">
                            <h5 class="mb-0">
                                <asp:Label ID="lblpostnew" runat="server" Text="Label"></asp:Label></h5>
                            <p class="no-margin">New</p>
                            <p>
                                <asp:Label ID="lblposttotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card gradient-45deg-green-teal gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                        <div class="col s7 m7">
                            <i class="material-icons background-round mt-5">attach_money</i>
                            <p>Events</p>
                        </div>
                        <div class="col s5 m5 right-align">
                            <h5 class="mb-0">
                                <asp:Label ID="lbleventnew" runat="server" Text="Label"></asp:Label></h5>
                            <p class="no-margin">Active</p>
                            <p>
                                <asp:Label ID="lbleventtotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s12 m6 l3">
                <div class="card #8d6e63 brown lighten-1 gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                        <div class="col s7 m7">
                            <i class="material-icons background-round mt-5">perm_identity</i>
                            <p>Sellers</p>
                        </div>
                        <div class="col s5 m5 right-align">
                            <h5 class="mb-0">
                                <asp:Label ID="lblsellernew" runat="server" Text="Label"></asp:Label></h5>
                            <p class="no-margin">New</p>
                            <p>
                                <asp:Label ID="lblsellertotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card gradient-45deg-purple-light-blue gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                        <div class="col s7 m7">
                            <i class="material-icons background-round mt-5">business_center</i>
                            <p>Products</p>
                        </div>
                        <div class="col s5 m5 right-align">
                            <h5 class="mb-0">
                                <asp:Label ID="lblproductactive" runat="server" Text="Label"></asp:Label></h5>
                            <p class="no-margin">Active</p>
                            <p>
                                <asp:Label ID="lblproducttotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card #c6ff00 lime accent-3 gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                        <div class="col s7 m7">
                            <i class="material-icons background-round mt-5">attach_money</i>
                            <p>Categories</p>
                        </div>
                        <div class="col s5 m5 right-align">
                            <h5 class="mb-0">
                                <asp:Label ID="lblcategoryactive" runat="server" Text="Label"></asp:Label></h5>
                            <p class="no-margin">Active</p>
                            <p>
                                <asp:Label ID="lblcategorytotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col s12 m6 l3">
                <div class="card gradient-45deg-blue-grey-blue gradient-shadow min-height-100 white-text">
                    <div class="padding-4">
                        <div class="col s7 m7">
                            <i class="material-icons background-round mt-5">attach_money</i>
                            <p>Inquiries</p>
                        </div>
                        <div class="col s5 m5 right-align">
                            <h5 class="mb-0">
                                <asp:Label ID="lblinquirynew" runat="server" Text="Label"></asp:Label></h5>
                            <p class="no-margin">Unattended</p>
                            <p>
                                <asp:Label ID="lblinquirytotal" runat="server" Text="Label"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
    </div>
    <!--card stats end-->
    <!--yearly & weekly revenue chart start-->
    <div id="sales-chart">
        <div class="row">
            <div class="col s12 m8 l8">
                <div id="revenue-chart" class="card">
                    <div class="card-content">
                        <h4 class="header mt-0">REVENUE FOR 2017
                        <span class="purple-text small text-darken-1 ml-1"></span>
                        </h4>
                        <div class="row">
                            <div class="col s12">
                                <asp:Chart ID="MyChart" runat="server" Height="300px" Width="400px">
                                    <Titles>
                                        <asp:Title ShadowOffset="3" Name="Skills" />
                                    </Titles>
                                    <Legends>
                                        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Row" />
                                    </Legends>
                                    <Series>
                                        <asp:Series Name="Default" />
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                    </ChartAreas>
                                </asp:Chart>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--yearly & weekly revenue chart end-->

</asp:Content>

