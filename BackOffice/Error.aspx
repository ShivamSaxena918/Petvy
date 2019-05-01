<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="BackOffice_Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="error-page">
      <div class="row">
        <div class="col s12">
          <div class="browser-window">
            <div class="top-bar">
              <div class="circles">
                <div id="close-circle" class="circle"></div>
                <div id="minimize-circle" class="circle"></div>
                <div id="maximize-circle" class="circle"></div>
              </div>
            </div>
            <div class="content">
              <div class="row">
                <div id="site-layout-example-top" class="col s12">
                  <p class="flat-text-logo center white-text caption-uppercase"> Server is busy</p>
                </div>
                <div id="site-layout-example-right" class="col s12 m12 l12">
                  <div class="row center">
                    <h1><i class="material-icons" style="font-size:100px">sentiment_dissatisfied</i></h1>
                    <p class="center white-text">Something has gone seriously wrong. Please try later.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>

