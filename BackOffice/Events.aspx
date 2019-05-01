<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function Eventnamevarification() {
            alert("Event Name Already Exist");
            document.getElementById("<%=txteventname.ClientID%>").onfocus = true;
        }
    </script>
    <script lang="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txteventname.ClientID%>").value == "") {

                Materialize.toast('Event Name Feild cannot be blank', 4000)
                document.getElementById("<%=txteventname.ClientID%>").focus();
                return false;
            }


            var startDate = document.getElementById("<%=txtstartdate.ClientID%>").value;
            var endDate = document.getElementById("<%=txtenddate.ClientID%>").value;
            if (Date.parse("<%=txtstartdate.ClientID%>") >= Date.parse("<%=txtenddate.ClientID%>")) {
                Materialize.toast('End date should be greater than Start date', 4000)
                document.getElementById("<%=txtenddate.ClientID%>").focus();
                return false;
            }
            var startStime = document.getElementById("<%=txtstarttime.ClientID%>").value;
            var endEtime = document.getElementById("<%=txtendtime.ClientID%>").value;

            var startTime = new Date().setHours(GetHours(startStime), GetMinutes(startStime), 0);
            var endTime = new Date(startTime)
            endTime = endTime.setHours(GetHours(endEtime), GetMinutes(endEtime), 0);
            if (startTime > endTime) {
                Materialize.toast('Start Time is greater than end Time', 4000)
                return false;
            }
            if (startTime == endTime) {
                Materialize.toast('Start Time is equals end time', 4000)
                return false;
            }
            if (document.getElementById("<%=textarea1.ClientID %>").value == "") {
                Materialize.toast('Details Feild cannot be blank', 4000)
                document.getElementById("<%=textarea1.ClientID %>").focus();
                return false;
            }
            var Details = document.getElementById("<%=textarea1.ClientID%>");
            if (Details.value.length <= 10 && Details.value.length >= 5);
            {

                Materialize.toast('Cannot be  more then 10 Characters', 4000)

                return false;
            }
            var userdate = new Date(document.getElementById("<%=txtstartdate.ClientID%>").value).toJSON().slice(0, 10);
            var today = new Date().toJSON().slice(0, 10);
            if (userdate < today) {

                alert('plz select date proper');
                return false;
            }

            return true;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtstartdate.ClientID%>").datepicker({
                minDate: -0,
            });
        });
    </script>

    <%--    var emailPat = /^([1,50])$/;

            var emailid = document.getElementById("<%=textarea1.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                Materialize.toast('Details Cannot be More Than 50', 4000)
                document.getElementById("<%=textarea1.ClientID %>").focus();
                 return false;
            }--%>
    <div class="card-panel">
        <div class="row">
            <div class="col s6">
                <h4 class="header1">Event Details</h4>
            </div>
            <div class="col s6">
                <%--<button class="btn" data-toggle="collapse" data-target="#demo" type="button" style="margin-left: 390px; margin-top: 17px"><i class="material-icons" style="font-size: 42px;">person_add</i></button>--%>
                <!-- Modal Trigger -->
                <i class="material-icons right" style="font-size: 50px;">
                    <asp:LinkButton ID="lbinsert" runat="server" CssClass="modal-trigger" href="#modal1" Style="color: crimson">add</asp:LinkButton>
                </i>
                <!-- Modal Trigger End-->
            </div>
        </div>
        <div id="modal1" class="modal">
            <div class="modal-content">
                <div class="row">
                    <div class="col s12 m12 l12">

                        <div class="row" style="margin-top: 30px">
                            <div class="input-field col s12">
                                <i class="material-icons prefix" style="font-size: 36px">input</i>
                                <input type="text" id="txteventname" runat="server" required="" />
                                <%--<input id="txt" name="txteventname" type="text" runat="server">--%>
                                <label for="txteventname">EventName</label>
                            </div>

                        </div>
                        <div class="row">

                            <div class="input-field col s6">
                                <i class="material-icons prefix" style="font-size: 36px">schedule</i>
                                <input type="text" id="txtstarttime" class="timepicker" placeholder="Start Time" runat="server" required="" />

                            </div>
                            <div class="input-field col s6">
                                <input type="text" id="txtendtime" class="timepicker" placeholder="End Time" runat="server" required="" />

                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s6">
                                <i class="material-icons prefix" style="font-size: 36px">date_range</i>
                                <input type="date" id="txtstartdate" class="datepicker" placeholder="Start Date" runat="server" required="" />

                            </div>
                            <div class="input-field col s6">
                                <input type="date" id="txtenddate" class="datepicker" placeholder="End Date" runat="server" required="" />

                            </div>

                        </div>

                        <div class="row">
                            <div class="input-field col s12">
                                <i class="material-icons prefix" style="font-size: 36px">create</i>
                                <textarea id="textarea1" class="materialize-textarea" runat="server" required=""></textarea>
                                <label for="textarea1">Details</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="file-field input-field">
                                <i class="material-icons prefix" style="margin-left: 15px">add_a_photo</i>
                                <asp:FileUpload ID="imgupload" AllowMultiple="true" runat="server" />
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text" placeholder="Upload Image" style="margin-left: 45px;">
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="input-field col s12">
                                <%--<button class="btn cyan waves-effect waves-light right" type="submit" name="action">
                                        Submit
                              <i class="material-icons right">send</i>
                                    </button>--%>
                                <asp:Button ID="btnsubmit" class="btn cyan waves-effect waves-light right" runat="server" Text="Submit" OnClientClick="return validate()" OnClick="btnsubmit_Click" />
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!-- START CONTENT -->
        <div class="section">
            <div class="divider"></div>
            <div id="table-datatables">
                <div class="row">

                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table" cellspacing="0">
                            <thead>

                                <tr>
                                    <th class="center">Image</th>
                                    <th class="center">EventName</th>
                                    <th class="center">StartTime</th>
                                    <th class="center">EndTime</th>
                                    <th class="center">Details</th>
                                    <th class="center">IsActive</th>
                                    <th class="center">Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptevent" runat="server" OnItemCommand="rptevent_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img src='../Gallery/<%# Eval("ImageName") %> ' style="height: 100px;" /></td>
                                            <td><%# Eval("EventName") %></td>
                                            <td><%# Eval("StartTime") %></td>
                                            <td><%# Eval("EndTime") %></td>
                                            <td><%# Eval("Details") %></td>
                                            <td class="icon-preview">
                                                <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("EventId")%>' />
                                                <asp:LinkButton ID="isactive" runat="server" CommandName="active" CommandArgument='<%# Eval("EventId") %>'>
                                                    <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                        <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                                </asp:LinkButton>
                                            <td class="icon-preview">
                                                <a style="color: black" href=" ">
                                                    <asp:LinkButton ID="lbedit" runat="server" CommandName="EventEdit" CommandArgument='<%# Eval("EventId") %>'><i class="material-icons" style="color:dodgerblue">create</i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbdelete" runat="server" CommandName="EventDelete" CommandArgument='<%# Eval("EventId") %>'><i class="material-icons" style="color: red">delete_forever</i></asp:LinkButton>
                                                </a>
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

