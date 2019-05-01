<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Ratings.aspx.cs" Inherits="Ratings" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- START CONTENT -->
    <div class="card-panel">
        <h4 class="header1">Ratings</h4>
        <div class="divider"></div>
        <div class="section">
            <div id="table-datatables">
                <div class="row">

                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table hover" cellspacing="0">
                            <thead>
                                <tr>
                                    <th class="center">Image</th>
                                    <th class="center">ProductName</th>
                                    <th class="center">UserName</th>
                                    <th class="center">Ratings</th>
                                   
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="rptrating" runat="server" OnItemCommand="rptrating_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="center">
                                                <img src="../Gallery/<%# Eval("URL") %>" style="height: 50px; width: 50px;" class="circle responsive-img valign" />
                                            </td>
                                             <td class="center"><%# Eval("Name") %> </td>
                                            <td class="center"><%# Eval("FName") %></td>
                                            <td class="center"><%# Eval("Rating") %></td>
                                          
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

