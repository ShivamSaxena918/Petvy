<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Seller.aspx.cs" Inherits="BackOffice_Seller" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- START CONTENT -->
    <div class="card-panel">
        <h4 class="header1">Registered Seller</h4>
        <div class="divider"></div>
        <div class="section">
            <div id="table-datatables">
                <div class="row">

                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table hover" cellspacing="0">
                            <thead>
                                <tr>
                                    <th class="center">Image</th>
                                    <th class="center">Name</th>
                                    <th class="center">Email</th>
                                    <th class="center">Contact No.</th>
                                    <th class="center">IsActive</th>
                                    <th class="center">Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="sellar_grid" runat="server" OnItemCommand="sellar_grid_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img src="../User_Images/<%# Eval("Image") %>" style="height: 50px; width: 50px;" class="circle responsive-img valign" />
                                            </td>
                                            <td class="center"><%# Eval("FName") %> <%# Eval("MName") %> <%# Eval("LName") %></td>
                                            <td class="center"><%# Eval("Email") %></td>
                                            <td class="center"><%# Eval("ContactNo") %></td>
                                            <td class="icon-preview center">
                                                <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("UserId")%>' />
                                                <asp:LinkButton ID="isactive" runat="server" CommandName="active" CommandArgument='<%# Eval("UserId") %>'>
                                                    <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                        <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                                </asp:LinkButton>
                                            </td>

                                            <td class="icon-preview center">
                                                <asp:LinkButton ID="lbview" runat="server" CommandName="view" CommandArgument='<%# Eval("UserId") %>'><i class="material-icons" style="color:darkorange">visibility</i></asp:LinkButton>

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

