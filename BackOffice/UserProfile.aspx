<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="profile-page-header" class="card">
        <div class="card-image waves-effect waves-block waves-light">
            <img class="activator" src="images/gallary/5.jpg" alt="user background">
        </div>
        <figure class="card-profile-image">
            <%--<img src="../../images/avatar/avatar-7.png" alt="profile image" class="circle z-depth-2 responsive-img activator gradient-45deg-light-blue-cyan gradient-shadow">--%>
            <asp:Image ID="imgLogo" runat="server" alt="profile image" CssClass="circle z-depth-2 responsive-img activator gradient-45deg-light-blue-cyan gradient-shadow" />
        </figure>
        <div class="card-content">
            <div class="row pt-2">
                <div class="col s12 m3 offset-m2">
                    <h4 class="card-title grey-text text-darken-4">
                        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></h4>
                    <p class="medium-small grey-text">Registered User</p>
                </div>

                <div class="col s12 m7 right-align">
                    <a class="btn-floating activator waves-effect waves-light rec accent-2 right">
                        <i class="material-icons">perm_identity</i>
                    </a>
                </div>
            </div>
            <div class="row center">
                <div class="col s12 m12">
                    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server"> <i class="material-icons" style="font-size:60px;">keyboard_arrow_left</i></asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="card-reveal">
            <p>
                
                <span class="card-title grey-text text-darken-4">
                    <asp:Label ID="lblfullname" runat="server" Text="Label"></asp:Label>
                      <i class="material-icons right">close</i>
                </span>
                
                <span>
                    <i class="material-icons cyan-text text-darken-2">perm_identity</i><asp:Label ID="lblactivity" runat="server" Text="Registered User"></asp:Label>

                </span>
            </p>
            <p>This Card Shows The Profile of Registered User.</p>
            <p>
                <i class="material-icons cyan-text text-darken-2">perm_phone_msg</i><asp:Label ID="lblcno" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                <i class="material-icons cyan-text text-darken-2">cake</i><asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                <i class="material-icons cyan-text text-darken-2">person_add</i> <asp:Label ID="lblCreatedOn" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                <i class="material-icons cyan-text text-darken-2">store_mall_directory</i> INDIA
            </p>
            <p>
                <i class="material-icons cyan-text text-darken-2">face</i> <asp:Label ID="LblGender" runat="server" Text="Label"></asp:Label>
            </p>
        </div>
    </div>
</asp:Content>

