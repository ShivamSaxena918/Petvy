<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="CMS.aspx.cs" Inherits="CMS" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="ckeditor/ckeditor.js"></script>
    <script>
        function validate()
        {
            var pat = /[A-Za-z0-9 ]/;
           var name = document.getElementById("<%=txtAddCms.ClientID%>").value.trim();
            if ((name == "")) {

            }
            else {
                Materialize.toast('Insert Valid CMS Name', 4000)
                document.getElementById("<%=txtAddCms.ClientID%>").focus();
                return false;
            }
            if ((document.getElementById("<%=txtAddCms.ClientID%>").value.match(spacepat))) {

            }
            else {
                Materialize.toast('Insert Valid CMS Name', 4000)
                document.getElementById("<%=txtAddCms.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
    <div class="card-panel">
        <div class="row">
            <div class="col s12">
                <h4 class="header1">CMS Managment</h4>
                <div class="divider"></div>
            </div>
        </div>


        <div class="row">
            <asp:Panel ID="Panel1" runat="server">
                <div class="input-field col s10 l10">
                    <i class="material-icons prefix">add_box</i>
                    <input id="txtAddCms" type="text" runat="server">
                    <label for="txtAddCms">Add New CMS Page</label>
                </div>
            </asp:Panel>
            <div class="input-field col s2 l2">
                <asp:Button Class="btn waves-effect waves-light" ID="btnCmsAdd" runat="server" Text="Add" Visible="false" OnClick="btnCmsAdd_Click" OnClientClick="return validate()" />



            </div>
            </div>
        <div class="row">

            <div class="input-field col s10 l10">
                <i class="material-icons prefix">view_list</i>
                <asp:DropDownList ID="ddCMSPage" AutoPostBack="true" OnSelectedIndexChanged="ddCMSPage_SelectedIndexChanged" runat="server"></asp:DropDownList>
            </div>

            <div class="input-field col s12">
                <asp:TextBox ID="txtDec" TextMode="MultiLine" Class="ckeditor" runat="server"></asp:TextBox>

            </div>
            <div class="input-field col s3">
                <asp:Button CssClass="btn waves-effect waves-light" ID="btnSaveCms" runat="server" Text="Save CMS" OnClick="btnSaveCms_Click" Visible="false" />


            </div>
        </div>


    </div>
</asp:Content>

