<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card-panel">
        <div class="row">

            <div class="col s6">
                <h4 class="header1">Products</h4>
            </div>
        </div>


        <div class="section">
            <div id="table-datatables">
                <div class="row">
                     <div class="divider"></div>
                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table " cellspacing="0">
                            <thead>
                                <tr>
                                    <th class="center">Image</th>
                                    <th class="center">Name</th>   
                                    <th class="center">CreatedOn</th>
                                    <th class="center">IsActive</th>
                                    <th class="center">View</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptpro" runat="server" OnItemCommand="rptview_ItemCommand">
                                    <ItemTemplate>
                                        <tr> <td class="center">
                                                <img src="../Gallery/<%# Eval("ImageName") %>" style="height: 60px; width: 60px;" class="circle responsive-img valign" />
                                            </td>

                                            <td class="center"><%# Eval("Name") %></td>
                                            <td class="center"><%# Eval("CreatedOn") %></td>
                                            <td class="icon-preview center">
                                                <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("ProductId")%>' />
                                                <asp:LinkButton ID="IsActive" runat="server" CommandName="Active" CommandArgument='<%# Eval("ProductId") %>'>
                                                    <b><i class="material-icons center" style="color: lawngreen; font-weight: bolder;">
                                                        <asp:Label ID="lblActive" runat="server"></asp:Label></i></b>
                                                </asp:LinkButton>
                                            <td class="icon-preview center">
                                                <asp:LinkButton ID="lbview" runat="server" CommandName="productview" CommandArgument='<%# Eval("ProductId") %>'>
                                                    <i class="material-icons " style="color:blue">visibility</i></asp:LinkButton>
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
    </div>
    <!-- END CONTENT -->

</asp:Content>

