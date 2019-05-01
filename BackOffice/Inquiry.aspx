<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Inquiry.aspx.cs" Inherits="Inquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- START CONTENT -->
    <div class="card-panel">
        <h4 class="header1">Inquiry</h4>
        <div class="divider"></div>
        <div class="section">
            <div id="table-datatables">
                <div class="row">

                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table hover" cellspacing="0">
                            <thead>
                                <tr>
                                    <td class="center"><b>Name</b></td>
                                    <td class="center"><b>Email</b></td>
                                    <td class="center"><b>ContactNo</b></td>
                                    <td class="center"><b>Query</b></td>
                                    <td class="center"><b>CreatedOn</b></td>
                                    <td class="center"><b>IsReply</b></td>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="rptinquiry" runat="server" OnItemCommand="rptinquiry_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="center"><%# Eval("Name") %></td>

                                            <td class="center"><%# Eval("Email") %></td>

                                            <td class="center"><%# Eval("ContactNo") %></td>
                                            <td class="center">
                                                <asp:HiddenField ID="hdninquiryId" runat="server" Value='<%# Eval("InquiryId") %>' />
                                                <asp:Button ID="btnshowQuery" Style="background-color: white; border: none; color: blue" runat="server" Text="Show Query" CommandArgument='<%# Eval("InquiryId") %>' CommandName="showQuery" />

                                            </td>

                                            <td class="center"><%# Eval("CreatedOn") %></td>
                                            <td class="icon-preview center">
                                                <asp:LinkButton ID="isactive" runat="server" CommandName="Reply" CommandArgument='<%# Eval("InquiryId") %>'>
                                                    <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                        <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                                </asp:LinkButton>
                                                <%--<asp:ImageButton ID="imgReplied" style="height:20px; width:20px" runat="server" CommandArgument='<%# Eval("InquiryId") %>' CommandName="Reply" />--%>
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

