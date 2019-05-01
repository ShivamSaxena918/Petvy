<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Pets.aspx.cs" Inherits="Pets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function PetNameVerification() {
            alert("Pet Name Already Use");
            document.getElementById("txtpettype").onfocus = true;
        }
    </script>
    <script lang="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtpettype.ClientID%>").value == "") {

                Materialize.toast('Pet Type Feild cannot be blank', 4000)
                document.getElementById("<%=txtpettype.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
    <!-- START TABLE FORMAT -->
    <div class="card-panel">
        <div class="row">
            <div class="col s6">
                <h4 class="header1">Pets Info</h4>
            </div>
            <div class="col s6">
                <%--<button class="btn" data-toggle="collapse" data-target="#demo" type="button" style="margin-left: 390px; margin-top: 17px"><i class="material-icons" style="font-size: 42px;">person_add</i></button>--%>
                <%--<!-- Modal Trigger -->
                <a class="modal-trigger" href="#modal1" style="color: crimson">
                    <i class="material-icons right" style="font-size: 50px; margin-top: 15px; margin-left: 0px;">pets</i>
                    <i class="material-icons right" style="font-size: 50px; margin-top: 15px; margin-right: 0px">add</i>
                </a>
                <!-- Modal Trigger End-->--%>
            </div>
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <div class="row">
                <div class="col offset-l3 l6">
                    <input id="txtpettype" type="text" style="width: 100%" runat="server" placeholder="PetType">
                </div>
            </div>
            <div class="row">
                <div class="col offset-l3 l6">
                    <asp:DropDownList ID="ddbreedtype" runat="server" AutoPostBack="false"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button ID="btnadd" CssClass="waves-effect waves-light btn gradient-45deg-light-blue-cyan z-depth-4 mr-1 right" runat="server" Text="ADD" OnClientClick="return validate()" OnClick="btnadd_Click" />
                </div>
            </div>
        </asp:Panel>
        <!-- START CONTENT -->
        <div class="section">
            <div class="divider"></div>
            <div id="table-datatables">
                <div class="row">
                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table display" cellspacing="0">
                            <thead>
                                <tr>
                                    <th class="center">TypeName</th>
                                    <th class="center">ParentType</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptpet" runat="server" OnItemCommand="rptpet_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="center"><%# Eval("TypeName") %></td>
                                            <td class="center"><%# Eval("pettypeName") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--DataTables example Row grouping-->
        </div>
        <!-- END CONTENT -->
    </div>
</asp:Content>

