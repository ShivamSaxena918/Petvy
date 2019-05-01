<%@ Page Title="" Language="C#" MasterPageFile="~/BackOffice/MainMasterPage.master" AutoEventWireup="true" CodeFile="AdminEdit.aspx.cs" Inherits="BackOffice_AdminEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function EmailVerification() {
            alert("Email Already Exist");
            document.getElementById("txtemail").onfocus = true;
        }
    </script>
    <script lang="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtefname.ClientID%>").value == "") {

                Materialize.toast('First Name Feild cannot be blank', 4000)
                document.getElementById("<%=txtefname.ClientID%>").focus();
                return false;
            }
            var letters = /^[A-Za-z]+$/;
            if (document.getElementById("<%=txtefname.ClientID%>").value.match(letters)) {

            }
            else {
                Materialize.toast('First Name Feild cannot be Digit', 4000)
                return false;
            }
             if (document.getElementById("<%=txtemname.ClientID%>").value.match(letters)) {

            }
            else {
                Materialize.toast('Middle Name Feild cannot be Digit', 4000)
                return false;
             }
             if (document.getElementById("<%=txtelname.ClientID%>").value.match(letters)) {

            }
            else {
                Materialize.toast('Last Name Feild cannot be Digit', 4000)
                return false;
            }
            if (document.getElementById("<%=txtelname.ClientID%>").value == "") {

                Materialize.toast('Last Name Feild cannot be blank', 4000)
                document.getElementById("<%=txtelname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txteemail.ClientID %>").value == "") {
                Materialize.toast('Email id cannot be blank', 4000)
                document.getElementById("<%=txteemail.ClientID %>").focus();
                return false;
            }
            var phoneno = /^\d{10}$/;
            if ((document.getElementById("<%=txtecno.ClientID%>").value.match(phoneno))) {

            }
            else {
                Materialize.toast('Insert Valid Contact Number.', 4000)
                return false;
            }

            var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;

            var emailid = document.getElementById("<%=txteemail.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                Materialize.toast('Your email address seems incorrect. Please try again.', 4000)
                document.getElementById("<%=txteemail.ClientID %>").focus();
                return false;
            }
        }
    </script>



    <div class="card-panel">
        <div class="row">
            <div class="col s12 m12 l12">
                <h4 class="header1">Edit Admin Details</h4>

            </div>
        </div>
        <div class="divider"></div>
        <div class="row" style="margin-top: 25px">
            <div class="col s12 m12 l12 center">
                <asp:Image ID="Image1" runat="server" alt="" class="circle responsive-img valign profile-image-login" />
            </div>
        </div>
        <div class="row" style="margin-top: 25px">
            <div class="input-field col s4">
                <i class="material-icons prefix">account_circle</i>
                <input id="txtefname" type="text" runat="server">
                <label for="ffirst_name">First Name</label>
            </div>
            <div class="input-field col s4">
                <input id="txtemname" type="text" runat="server">
                <label for="Middle_name">Middle Name</label>
            </div>
            <div class="input-field col s4">
                <input id="txtelname" type="text" runat="server">
                <label for="last_name">Last Name</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">mail</i>
                <input id="txteemail" type="email" runat="server">
                <label for="email" data-error="wrong">Email</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="material-icons prefix">call</i>
                <input id="txtecno" type="text" runat="server" maxlength="10">
                <label for="cno">Contact Number</label>
            </div>
        </div>
        <div class="row">
            <div class="col s12" style="margin-left: 55px;">
                <div class="col s4">
                    <p>
                        <asp:CheckBox ID="chkInsert" runat="server" Text="Allow Insert" />
                    </p>
                </div>

                <div class="col s4">
                    <p>
                        <asp:CheckBox ID="chkUpdate" runat="server" Text="Allow Update" />
                    </p>
                </div>

                <div class="col s4">
                    <p>
                        <asp:CheckBox ID="chkDelete" runat="server" Text="Allow Delete" />
                    </p>
                </div>
            </div>
        </div>


        <div class="row" style="margin-top: 20px">
            <div class="input-field col s6 m6 l6">
                <asp:Button ID="Insert" class="waves-effect waves-light btn gradient-45deg-light-blue-cyan z-depth-4 mr-1" Style="margin-bottom: 10px" runat="server" Text="SUBMIT" OnClick="Insert_Click" OnClientClick="return validate()" />
            </div>
            <div class="input-field col s6 m6 l6">
                <a class=" waves-effect waves-light btn gradient-45deg-red-pink z-depth-4 mr-1 right" style="margin-bottom: 15px" href="AdminDetails.aspx">CANCEL</a>
            </div>
        </div>
    </div>
</asp:Content>

