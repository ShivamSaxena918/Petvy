<%@ Page Title="" Language="C#" MasterPageFile="~/Instamaster.master" AutoEventWireup="true" CodeFile="Userlogin.aspx.cs" Inherits="login" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script lang="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtfname.ClientID%>").value == "") {

                swal("Warning", "First Name Cant Be Blank", "warning");
                document.getElementById("<%=txtfname.ClientID%>").focus();
                return false;
            }
            var letters = /^[A-Za-z]+$/;
            if (document.getElementById("<%=txtfname.ClientID%>").value.match(letters)) {

            }
            else {
                swal("Warning", "First Name Cant Be Digit", "warning");
                return false;
            }


            if (document.getElementById("<%=txtlname.ClientID%>").value == "") {

                swal("Warning", "Last Name Cant Be Blank", "warning");
                document.getElementById("<%=txtlname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtlname.ClientID%>").value.match(letters)) {

            }
            else {
                swal("Warning", "Last Name Cant Be Digit", "warning");
                return false;
            }
            var phoneno = /^\d{10}$/;
            if ((document.getElementById("<%=txtcno.ClientID%>").value.match(phoneno))) {

            }
            else {
                swal("Warning", "Insert Valid Contact Number", "warning");
                return false;
            }
            nextPrev(1);
            return true;
        }
    </script>
    <script lang="javascript" type="text/javascript">
        function validate2() {
            var e = document.getElementById("<%=ddgender.ClientID%>");
            var strUser = e.options[e.selectedIndex].value;

            var strUser1 = e.options[e.selectedIndex].text;
            if (strUser == 0) {
                swal("Warning", "Please Select Gender", "warning");
                return false;
            }
            
            nextPrev(1);
            return true;
        }
    </script>
    <script lang="javascript" type="text/javascript">
        function validation3() {
            if (document.getElementById("<%=txtregemail.ClientID %>").value == "") {
                swal("Warning", "Email Cannot Be Blank", "warning");
                document.getElementById("<%=txtregemail.ClientID %>").focus();
                return false;
            }

            var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;

            var emailid = document.getElementById("<%=txtregemail.ClientID %>").value;
            var matchArray = emailid.match(emailPat);
            if (matchArray == null) {
                swal("Warning", "Incorrect Email", "warning");

                document.getElementById("<%=txtregemail.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtregpass.ClientID %>").value == "") {
                swal("Warning", "Password Cannot Be Blank", "warning");
                document.getElementById("<%=txtregemail.ClientID %>").focus();
                return false;
            }

            var pass = document.getElementById("<%=txtregpass.ClientID%>").value;
            var Cpass = document.getElementById("<%=txtregcpass.ClientID%>").value;
            if (pass != Cpass) {
                swal("Warning", "Password Dont Match", "warning");
                return false;
            }
            return true;
        }

    </script>
    <script>
        var input = document.getElementById("<%=txtpass.ClientID %>");
        input.addEventListener("keyup", function (event) {
            event.preventDefault();
            if (event.keyCode === 13) {
                document.getElementById("<%=btnLogin.ClientID %>").click();
            }
        });
    </script>
    <script type="text/javascript">
        var input = document.querySelector('input[name="date"]');

        var picker = datepicker(input);
    </script>
    <div role="main" style="margin-top: 70px">
        <div class="page-padding post-8 page type-page status-publish hentry">
            <div class="row">
                <div class="small-12 columns">
                    <div class="post-content no-vc">
                        <div class="woocommerce">

                            <div class="row align-center">
                                <div class="small-12 medium-6 large-4 columns">

                                    <div class="thb-overflow-container">
                                        <ul class="login-page-form">
                                            <li>
                                                <asp:LinkButton ID="lblogin" runat="server" CssClass="active">Login</asp:LinkButton></li>
                                            <%--<a href="#" >Login</a>--%>
                                            <li>
                                                <asp:LinkButton ID="lbregister" runat="server">Register</asp:LinkButton>
                                                <%--<a href="#">Register</a>--%>
                                            </li>

                                        </ul>
                                        <div class="thb-form-container">
                                            <div class="thb-login-form">

                                                <div class="woocommerce-form woocommerce-form-login login">


                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <label for="username">Username or email address <span class="required">*</span></label>
                                                        <input id="txtemail" type="text" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" runat="server" />
                                                    </p>
                                                    <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                        <label for="password">Password <span class="required">*</span></label>
                                                        <input id="txtpass" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" type="password" runat="server" />
                                                    </p>


                                                    <p class="form-row">
                                                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="woocommerce-Button button" OnClick="btnLogin_Click" />
                                                        
                                                    </p>
                                                    <p class="woocommerce-LostPassword lost_password">
                                                        <a href="ForgetPassword.aspx">Lost your password?</a>
                                                    </p>


                                                </div>

                                            </div>

                                            <div class="thb-register-form">

                                                <div class="register">
                                                    <!-- One "tab" for each step in the form: -->
                                                    <div class="tab">
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtfname">FIRST NAME<span class="required">*</span></label>
                                                            <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" id="txtfname" runat="server" title="Enter First Name" />
                                                        </p>
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtmname">MIDDLE NAME<span class="required">*</span></label>
                                                            <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" id="txtmname" runat="server" />
                                                        </p>
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtlname">LAST NAME<span class="required">*</span></label>
                                                            <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" id="txtlname" runat="server" title="Enter Last Name" />
                                                        </p>

                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtcno">CONTACT NO.<span class="required">*</span></label>
                                                            <input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="email" id="txtcno" runat="server" />
                                                        </p>
                                                        <div style="overflow: auto;">
                                                            <div style="float: right;">
                                                                <div class="w3-col s5 m5 l5">
                                                                    <button type="button" style="width: 80px; padding: 0" id="btnnext1" onclick="return validate()" class="woocommerce-Button button">Next</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="tab">
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="ddgender">GENDER<span class="required">*</span></label>
                                                            <asp:DropDownList ID="ddgender" runat="server" class="woocommerce-Input woocommerce-Input--text input-text">
                                                                <asp:ListItem Text="Select" Value="" />
                                                                <asp:ListItem Text="Male" Value="Male" />
                                                                <asp:ListItem Text="Female" Value="Female" />
                                                                <asp:ListItem Text="Others" Value="Others" />
                                                            </asp:DropDownList>
                                                        </p>
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtcno">DATE OF BIRTH<span class="required">*</span></label>
                                                            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
                                                        </p>
                                                        <div style="overflow: auto;">
                                                            <div style="float: right;">
                                                                <div class="w3-col s5 m5 l5">
                                                                    <button type="button" style="width: 80px; padding: 0" id="btnprev2" onclick="nextPrev(-1)" class="woocommerce-Button button">Previous</button>
                                                                </div>
                                                                <div class="w3-col s5 m5 l5">
                                                                    <button type="button" id="btnnext2" style="margin-left: 12px; width: 80px" onclick="return validate2()" class="woocommerce-Button button">Next</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab">
                                                        <p class="w3-col s6 m6 l6 " style="margin-left: 155px">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/User_Images/avatar-7.png" Height="95" Width="95" />
                                                        </p>
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <div class="fileUpload w3-btn w3-blue " style="margin-left: 50px; width: 290px">
                                                                <span>CHOOSE YOUR PROFILE IMAGE</span>
                                                                <asp:FileUpload ID="FileUpload1" runat="server" class="upload" />
                                                            </div>
                                                        </p>
                                                        <div style="overflow: auto;">
                                                            <div style="float: right;">
                                                                <div class="w3-col s5 m5 l5">
                                                                    <button type="button" style="width: 80px; padding: 0" id="btnprev3" onclick="nextPrev(-1)" class="woocommerce-Button button">Previous</button>
                                                                </div>
                                                                <div class="w3-col s5 m5 l5">
                                                                    <button type="button" id="btnnext3" style="margin-left: 12px; width: 80px" onclick="nextPrev(1)" class="woocommerce-Button button">Next</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab">
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtregemail">Email address <span class="required">*</span></label>
                                                            <input id="txtregemail" type="text" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" runat="server" />
                                                        </p>
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtregpass">Password <span class="required">*</span></label>
                                                            <input id="txtregpass" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" type="password" runat="server" />
                                                        </p>
                                                        <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                            <label for="txtregcpass">Confirm Password <span class="required">*</span></label>
                                                            <input id="txtregcpass" class="woocommerce-Input woocommerce-Input--text input-text" style="margin: 0" type="password" runat="server" />
                                                        </p>

                                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                            <ContentTemplate>
                                                                <p class="row">

                                                                    <p class="w3-col s6 m6 l6 " style="margin-left: 155px">
                                                                        <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Extreme" CaptchaLength="5"
                                                                            CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                                                                            FontColor="#D20B0C" NoiseColor="#B1B1B1" />
                                                                    </p>
                                                                    <p class="w3-col s6 m6 l6" style="margin-left: 150px">

                                                                        <asp:ImageButton ImageUrl="wp-content/uploads/sites/4/2017/09/refresh.png" runat="server" CausesValidation="false" />
                                                                    </p>
                                                                </p>


                                                                </p>
                                                            <p class="row">
                                                                <p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
                                                                    <label for="txtcno">ENTER CAPTCHA CODE<span class="required">*</span></label>
                                                                    <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                                                                    <asp:CustomValidator ErrorMessage="Invalid. Please try again." OnServerValidate="ValidateCaptcha" runat="server" />
                                                                </p>
                                                            </p>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>

                                                        <p class="w3-col s12 m12 l12">
                                                            <asp:Button ID="btninsert" runat="server" Text="SUBMIT" Style="margin: 0; border-right-color: white" CssClass="woocommerce-Button button" OnClientClick="return validation3()" OnClick="btninsert_Click1" />
                                                        </p>
                                                    </div>
                                                    
                                                    <!-- Circles which indicates the steps of the form: -->

                                                    <script>
                                                        var currentTab = 0; // Current tab is set to be the first tab (0)
                                                        showTab(currentTab); // Display the crurrent tab

                                                        function showTab(n) {
                                                            // This function will display the specified tab of the form...
                                                            var x = document.getElementsByClassName("tab");
                                                            x[n].style.display = "block";
                                                            //... and fix the Previous/Next buttons:
                                                            if (n == 0) {
                                                                document.getElementById("prevBtn").style.display = "none";
                                                            } else {
                                                                document.getElementById("prevBtn").style.display = "inline";
                                                            }
                                                            if (n == (x.length - 1)) {
                                                                document.getElementById("nextBtn").innerHTML = "Submit";
                                                            } else {
                                                                document.getElementById("nextBtn").innerHTML = "Next";
                                                            }
                                                            //... and run a function that will display the correct step indicator:
                                                            fixStepIndicator(n)
                                                        }

                                                        function nextPrev(n) {
                                                            // This function will figure out which tab to display
                                                            var x = document.getElementsByClassName("tab");
                                                            // Exit the function if any field in the current tab is invalid:
                                                            // Hide the current tab:
                                                            x[currentTab].style.display = "none";
                                                            // Increase or decrease the current tab by 1:
                                                            currentTab = currentTab + n;
                                                            // if you have reached the end of the form...
                                                            if (currentTab >= x.length) {
                                                                // ... the form gets submitted:
                                                                document.getElementById("regForm").submit();
                                                                return false;
                                                            }
                                                            // Otherwise, display the correct tab:
                                                            showTab(currentTab);
                                                        }



                                                        function fixStepIndicator(n) {
                                                            // This function removes the "active" class of all steps...
                                                            var i, x = document.getElementsByClassName("step");
                                                            for (i = 0; i < x.length; i++) {
                                                                x[i].className = x[i].className.replace(" active", "");
                                                            }
                                                            //... and adds the "active" class on the current step:
                                                            x[n].className += " active";
                                                        }
                                                    </script>
                                                    
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

