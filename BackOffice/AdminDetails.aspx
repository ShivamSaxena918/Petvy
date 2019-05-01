<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="AdminDetails.aspx.cs" Inherits="AdminDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- START TABLE FORMAT -->
    <script>
        function EmailVerification() {
            alert("Email Already Exist");
            document.getElementById("txtemail").onfocus = true;
        }
    </script>
    <script lang="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtfName.ClientID%>").value == "") {

                Materialize.toast('First Name Feild cannot be blank', 4000)
                document.getElementById("<%=txtfName.ClientID%>").focus();
                return false;
            }
            var letters = /^[A-Za-z]+$/;
            if (document.getElementById("<%=txtfName.ClientID%>").value.match(letters)) {

            }
            else {
                Materialize.toast('First Name Feild cannot be Digit', 4000)
                return false;
            }
            if (document.getElementById("<%=txtlname.ClientID%>").value == "") {

                Materialize.toast('Last Name Feild cannot be blank', 4000)
                document.getElementById("<%=txtlname.ClientID%>").focus();
                return false;
            }
             if (document.getElementById("<%=txtlname.ClientID%>").value.match(letters)) {

            }
            else {
                Materialize.toast('Last Name Feild cannot be Digit', 4000)
                return false;
             }
              if (document.getElementById("<%=txtmname.ClientID%>").value.match(letters)) {

            }
            else {
                Materialize.toast('Middle Name Feild cannot be Digit', 4000)
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID %>").value == "") {
                Materialize.toast('Email id cannot be blank', 4000)
                document.getElementById("<%=txtemail.ClientID %>").focus();
                return false;
            }

            var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;

            var emailid = document.getElementById("<%=txtemail.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                Materialize.toast('Your email address seems incorrect. Please try again.', 4000)
                document.getElementById("<%=txtemail.ClientID %>").focus();
                return false;
            }
            var phoneno = /^\d{10}$/;
            if ((document.getElementById("<%=txtcno.ClientID%>").value.match(phoneno))) {

            }
            else {
                Materialize.toast('Insert Valid Contact Number.', 4000)
                return false;
            }


            var password = document.getElementById("<%=txtpass.ClientID%>").value;
            var confirmPassword = document.getElementById("<%=txtCpass.ClientID%>").value;
            if (password != confirmPassword) {
                Materialize.toast('Passwords do not match.', 4000)

                return false;
            }
            return true;
        }
    </script>
    <div class="card-panel">
        <div class="row">
            <div class="col s6">
                <h4 class="header1">Admin Details</h4>

            </div>
            <div class="col s6">
                <%--<button class="btn" data-toggle="collapse" data-target="#demo" type="button" style="margin-left: 390px; margin-top: 17px"><i class="material-icons" style="font-size: 42px;">person_add</i></button>--%>
                <!-- Modal Trigger -->
                <i class="material-icons right" style="font-size: 50px;">
                    <asp:LinkButton ID="lbinsert" runat="server" CssClass="modal-trigger" href="#modal1" Style="color: crimson">person_add</asp:LinkButton>
                    <%--<a class="modal-trigger" href="#modal1" style="color: crimson">person_add</a>--%>
                </i>
                <!-- Modal Trigger End-->
            </div>
        </div>

        <!-- Modal Structure 1 -->

        <div id="modal1" class="modal">
            <div class="modal-content ">
                <div class="row">
                    <div class="input-field col s12 center">
                        <img src="images/avatar/avatar-7.png" alt="" class="circle responsive-img valign profile-image-login cyan">
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s4">
                        <i class="material-icons prefix">account_circle</i>
                        <input id="txtfName" type="text" runat="server" />
                        <label for="txtfName">First Name</label>
                    </div>
                    <div class="input-field col s4">
                        <input id="txtmname" type="text" runat="server" />
                        <label for="txtmname">Middle Name</label>
                    </div>
                    <div class="input-field col s4">
                        <input id="txtlname" type="text" runat="server" />
                        <label for="txtlname">Last Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">mail</i>
                        <input id="txtemail" type="email" runat="server" />
                        <label for="txtemail" data-error="wrong" data-success="right">Email</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">fingerprint</i>
                        <input id="txtpass" type="password" runat="server" />
                        <label for="txtpass">Password</label>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">fingerprint</i>
                        <input id="txtCpass" type="password" runat="server" required />
                        <label for="txtCpass">Confirm Password</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <i class="material-icons prefix">call</i>
                        <input id="txtcno" type="text" runat="server" />
                        <label for="txtcno">Contact Number</label>
                    </div>
                </div>
                <div class="row">
                    <div class="file-field input-field">
                        <i class="material-icons prefix" style="margin-left: 15px">add_a_photo</i>
                        <asp:FileUpload ID="fileupload" runat="server" />
                        <div class="file-path-wrapper">
                            <input class="file-path validate" type="text" placeholder="Upload Image" style="margin-left: 45px;">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s6">
                        <asp:Button ID="Insert" class="waves-effect waves-light btn gradient-45deg-light-blue-cyan z-depth-4 mr-1" Style="margin-bottom: 10px" runat="server" Text="SUBMIT" OnClick="Insert_Click" OnClientClick="return validate()" />
                    </div>
                    <div class="input-field col s6">
                        <a class=" modal-action modal-close waves-effect waves-light btn gradient-45deg-red-pink z-depth-4 mr-1 right" style="margin-bottom: 15px">CANCEL</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Structure End 1 -->

        <div class="divider"></div>
        <div class="section">
            <div id="table-datatables">
                <div class="row">

                    <div class="col s12">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table id="data-table-simple" class="responsive-table hover" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="center">Image</th>
                                            <th class="center">Name</th>
                                            <th class="center">Email</th>
                                            <th class="center">Contact No.</th>
                                            <th class="center">Created By</th>
                                            <th class="center">IsActive</th>
                                            <th class="center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:Repeater ID="admin_grid" runat="server" OnItemCommand="admin_grid_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="center">
                                                        <img src="Admin_Images/<%# Eval("Image") %>" style="height: 50px; width: 50px;" class="circle responsive-img valign" />
                                                    </td>
                                                    <td class="center"><%# Eval("FName") %> <%# Eval("MName") %> <%# Eval("LName") %></td>
                                                    <td class="center"><%# Eval("Email") %></td>
                                                    <td class="center"><%# Eval("ContactNo") %></td>
                                                    <td class="center"><%# Eval("CreatedBy_Name") %></td>
                                                    <td class="icon-preview center">
                                                        <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("AdminId")%>' />
                                                        <asp:LinkButton ID="isactive" runat="server" CommandName="active" CommandArgument='<%# Eval("AdminId") %>'>
                                                            <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                                <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                                        </asp:LinkButton>
                                                    </td>

                                                    <td class="icon-preview center">
                                                        <%--<asp:LinkButton ID="lbedit" runat="server" CommandName="edit" CommandArgument='<%# Eval("AdminId") %>'><i class="material-icons" style="margin-left: 5px;"><asp:LinkButton ID="LinkButton1" runat="server"  CssClass="modal-trigger" style="color: dodgerblue;">create</asp:LinkButton></i></asp:LinkButton>--%>
                                                        <asp:LinkButton ID="lbview" runat="server" CommandName="view" CommandArgument='<%# Eval("AdminId") %>'><i class="material-icons" style="color:darkorange">visibility</i></asp:LinkButton>
                                                        <%--<i class="material-icons right" style="font-size: 50px;"><a class="modal-trigger" href="#modal1" style="color: crimson">person_add</a></i>--%>
                                                        <asp:LinkButton ID="lbedit" runat="server" CommandName="edit" CommandArgument='<%# Eval("AdminId") %>'><i class="material-icons" style="color:dodgerblue">create</i></asp:LinkButton>
                                                        <%--<button type="button" style="display: none;" id="btnShowPopup" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"></button>--%>
                                                        <asp:LinkButton ID="lbdelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("AdminId") %>'><i class="material-icons" style="color:red">delete_forever</i></asp:LinkButton>
                                                    </td>
                                                    <%--                                            <td class="icon-preview">
                                                <i class="material-icons" style="margin-left: 5px;"><a class="modal-trigger" href="#modal2" style="color: dodgerblue;">create</a></i>
                                                <i class="material-icons"><a href="#" style="color: red">delete_forever</a></i>
                                            </td>--%>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <br>

            <!--DataTables example Row grouping-->
        </div>
    </div>
    <!-- END TABLE FORMAT -->
</asp:Content>

