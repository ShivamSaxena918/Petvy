<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="ShowQuery.aspx.cs" Inherits="ShowQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script lang="javascript" type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtreply.ClientID%>").value == "") {

                Materialize.toast('First Name Feild cannot be blank', 4000)
                document.getElementById("<%=txtreply.ClientID%>").focus();
                return false;
            }
        }
        </script>
    <div class="row">
      <div class="card-panel">
          <div class="row">
              <h4>Query</h4>
               <asp:Label ID="lblQuary" runat="server" ></asp:Label>
                <asp:Panel ID="pnlreply" runat="server">
                    <br/>
              <div class="input-field"> 
              <asp:TextBox ID="txtreply" runat="server" required=""></asp:TextBox>
                   <label for="first_name">Reply</label>
                </div>
              <div class="input-field">
                  <asp:Button ID="Button1" CssClass="btn" runat="server" OnClick="btnSubmit_Click" Text="Submit" OnClientClick="retrun validate()"/> 
                  
                  
                </div>  
          </asp:Panel>

            </div>
          <br />
          
          
       
        <%--  <asp:Panel ID="pnlreply" runat="server">
              <div class="input-field"> 
              <asp:TextBox ID="txtreply" runat="server"></asp:TextBox>
                   <label for="first_name">Reply</label>
                </div>
              <div class="input-field">
                  <asp:Button ID="btnSubmit" CssClass="btn" runat="server" OnClick="btnSubmit_Click" Text="Submit" /> 
                  
                  
                </div>  
          </asp:Panel>--%>


          </div>
        </div>
</asp:Content>

