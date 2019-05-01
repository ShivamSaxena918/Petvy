<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Permission.aspx.cs" Inherits="Permission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="card-panel">
        <div class="row">
            <div class="col s6">
                <h4 class="header1">Permission Details</h4>

            </div>
            </div>
    <!-- START CONTENT -->
    <div class="section">
        <div class="divider"></div>
        <div id="table-datatables">
            <div class="row">

                <div class="col s12">
                    <table id="data-table-simple" class="responsive-table hover" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="center">Image</th>
                                <th class="center">Name</th>
                                <th class="center">Insert</th>
                                <th class="center">Update</th>
                                <th class="center">Delete</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptpremission" runat="server" OnItemCommand="rptpremission_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="center">
                                            <img src="Admin_Images/<%# Eval("Image") %>" style="height: 50px; width: 50px;" class="circle responsive-img valign" />
                                        </td>
                                        <td class="center"><%# Eval("fName") %> </td>

                                        <td class="icon-preview center">
                                            <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("PermissionId")%>' />
                                            <asp:LinkButton ID="active" runat="server" CommandName="insert" CommandArgument='<%# Eval("PermissionId") %>'>
                                                <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                    <asp:Label ID="lblinsert" runat="server"></asp:Label></i></b>
                                            </asp:LinkButton>
                                        </td>
                                        <td class="icon-preview center">
                                            
                                            <asp:LinkButton ID="active1" runat="server" CommandName="update" CommandArgument='<%# Eval("PermissionId") %>'>
                                                <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                    <asp:Label ID="lblupdate" runat="server"></asp:Label></i></b>
                                            </asp:LinkButton>
                                        </td>
                                        <td class="icon-preview center">
                                           
                                            <asp:LinkButton ID="active2" runat="server" CommandName="delete" CommandArgument='<%# Eval("PermissionId") %>'>
                                                <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                    <asp:Label ID="lbldelete" runat="server"></asp:Label></i></b>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                                            <%--<td class="icon-preview">
                                                <i class="material-icons" style="margin-left: 5px;"><a class="modal-trigger" href="#modal2" style="color: dodgerblue;">create</a></i>
                                                <i class="material-icons"><a href="#" style="color: red">delete_forever</a></i>
                                            </td>--%>


                            <%--<asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("") %></td>
                                        <td>Accountant</td>
                                        <td>New Delhi</td>
                                        <td class="icon-preview">
                                            <asp:LinkButton ID="isactive" runat="server" CommandName="active" CommandArgument='<%# Eval("") %>'>
                                                <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                    <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                            </asp:LinkButton>
                                            <%--<i class="material-icons" style="margin-left: 10px"><a style="color: blue" href="">check</a></i>--%>
                            <%--  </td>
                                        <td>
                                            <i class="material-icons" style="margin-left: 20px"><a style="color: blue" href="">check</a></i>
                                        </td>
                                        <td>
                                            <i class="material-icons" style="margin-left: 20px"><a style="color: blue" href="">check</a></i>
                                        </td>
                                    </tr>


                                </ItemTemplate>
                            </asp:Repeater>--%>
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

