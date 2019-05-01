<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Posts.aspx.cs" Inherits="Posts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- START CONTENT -->
    <div class="card-panel">
        <div class="row">
            <div class="col s12">
                <h4 class="header1">Posts</h4>
            </div>

        </div>

    <div class="section">
        <div class="divider"></div>
        <div id="table-datatables">
            <div class="row">

                <div class="col s12">
                    <table id="data-table-simple" class="responsive-table" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="center">Image</th>
                                <th class="center">Caption</th>
                                <th class="center">CreatedOn</th>
                                <th class="center">IsActive</th>
                                <th class="center">Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <asp:Repeater ID="rptpost" runat="server" OnItemCommand="rptpost_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="center">
                                            <img src="../Gallery/<%# Eval("ImageName") %>" style="height: 50px; width: 50px;" class="circle responsive-img valign" />
                                        </td>
                                        <td class="center"><%# Eval("Caption") %></td>
                                        <td class="center"><%# Eval("CreatedOn") %></td>

                                        <td class="icon-preview center">
                                            <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("PostId")%>' />
                                            <asp:LinkButton ID="Isactive" runat="server" CommandName="Active" CommandArgument='<%# Eval("PostId") %>'>
                                                <b><i class="material-icons center" style="color: lawngreen; font-weight: bolder;">
                                                    <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                            </asp:LinkButton>
                                        </td>
                                        <td class="icon-preview center">
                                            <asp:LinkButton ID="lblView" runat="server" CommandName="View" CommandArgument='<%# Eval("PostId") %>'><i class="material-icons " style="color:blue">visibility</i></asp:LinkButton>

                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>

        <!--DataTables example Row grouping-->
    </div>
    <!-- END CONTENT -->
        </div>
</asp:Content>

