<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="EventUpdate.aspx.cs" Inherits="BackOffice_EventUpdate_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <script lang="javascript" type="text/javascript">
         function validate() {
             if (document.getElementById("<%=txtename.ClientID%>").value == "") {

                 Materialize.toast('First Name Feild cannot be blank', 4000)
                 document.getElementById("<%=txtename.ClientID%>").focus();
                 return false;
             }
         }
         </script>
    <div class="card-panel">
        <div class="row">
            <div class="col s12 m12 l12">
                <h4 class="header1">Edit Event Update</h4>

            </div>
        </div>
        <div class="divider"></div>
        <div class="row">
            <div class="col s12 m12 l12">
                <asp:DataList ID="ddevent" runat="server" RepeatColumns="3">
                    <ItemTemplate>
                        <div class="row center">
                            <a>
                                <img src="../Gallery/<%# Eval("URL") %>" style="height: 200px; width: 200px;" />
                            </a>
                        </div>

                    </ItemTemplate>
                </asp:DataList>

                <div class="row" style="margin-top: 30px">
                    <div class="input-field col s12">
                        <i class="material-icons prefix" style="font-size: 36px">input</i>
                        <input type="text" id="txtename" runat="server" />
                        <label for="txtename">EventName</label>
                    </div>

                </div>
                <div class="row">

                    <div class="input-field col s6">
                        <i class="material-icons prefix" style="font-size: 36px">schedule</i>
                        <input type="text" id="txtstime" class="timepicker" placeholder="Start Time" runat="server" />

                    </div>
                    <div class="input-field col s6">
                        <input type="text" id="txtetime" class="timepicker" placeholder="End Time" runat="server" />

                    </div>
                </div>
                <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix" style="font-size: 36px">date_range</i>
                                <input type="date" id="txtstartdate" class="datepicker" placeholder="Start Date" runat="server" />

                            </div>
                            <div class="input-field col s6">
                                <input type="date" id="txtenddate" class="datepicker" placeholder="End Date" runat="server"/>

                            </div>


                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix" style="font-size: 36px">create</i>
                        <textarea id="txtarea2" class="materialize-textarea" runat="server" minlength="5" maxlength="50"></textarea>
                        <label for="txtarea2">Details</label>
                    </div>
                </div>
                <%--<div class="row">
                    <div class="file-field input-field">
                        <i class="material-icons prefix" style="margin-left: 15px">add_a_photo</i>
                        <asp:FileUpload ID="imgupload" AllowMultiple="true" runat="server" />
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text" placeholder="Upload Image" style="margin-left: 45px;">
                        </div>
                    </div>
                </div>--%>

                <div class="row" style="margin-top: 20px">
                    <div class="input-field col s6 m6 l6">
                        <asp:Button ID="btnupdate" class="waves-effect waves-light btn gradient-45deg-light-blue-cyan z-depth-4 mr-1" Style="margin-bottom: 10px" runat="server" Text="UPDATE" OnClick="btnupdate_Click" OnClientClick="return validate()" />
                    </div>
                    <div class="input-field col s6 m6 l6">
                        <a class=" waves-effect waves-light btn gradient-45deg-red-pink z-depth-4 mr-1 right" style="margin-bottom: 15px" href="Events.aspx">CANCEL</a>
                    </div>
                </div>


            </div>
        </div>

    </div>


</asp:Content>

