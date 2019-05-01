<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="temp.aspx.cs" Inherits="temp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p>
    <input type="checkbox" id="test5" />
    <label for="test5">Red</label>
    </p>


                    <form class="col s12">
                    <div class="row">
                        <div class="input-field col s12 center">
                            <img src="../../images/avatar/avatar-7.png" alt="" class="circle responsive-img valign profile-image-login cyan">
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-field col s4">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="first_name" type="text">
                            <label for="first_name">First Name</label>
                        </div>
                        <div class="input-field col s4">
                            <input id="Middle_name" type="text">
                            <label for="Middle_name">Middle Name</label>
                        </div>
                        <div class="input-field col s4">
                            <input id="last_name" type="text">
                            <label for="last_name">Last Name</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">mail</i>
                            <input id="email" type="email" class="validate">
                            <label for="email" data-error="wrong" data-success="right">Email</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">fingerprint</i>
                            <input id="password6" type="password">
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix">call</i>
                            <input id="cno" type="email">
                            <label for="cno">Contact Number</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field">
                            <i class="material-icons prefix" style="margin-left: 15px">add_a_photo</i>
                            <input type="file">
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Upload Image" style="margin-left: 45px;">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <a class="waves-effect waves-light btn gradient-45deg-light-blue-cyan z-depth-4 mr-1" style="margin-bottom: 10px">SUBMIT</a>
                        </div>
                        <div class="input-field col s6">
                            <a class=" modal-action modal-close waves-effect waves-light btn gradient-45deg-red-pink z-depth-4 mr-1" style="margin-left: 250px; margin-bottom: 10px">CANCLE</a>
                        </div>
                    </div>
                </form>


</asp:Content>

