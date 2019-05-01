<%@ Page Title="" Language="C#" MasterPageFile="~/BackOffice/MainMasterPage.master" AutoEventWireup="true" CodeFile="valid.aspx.cs" Inherits="BackOffice_valid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    $(document).ready(function () {

            // setTimeout(function(){
            // $("div.tab-content").find('div.tab-pane').removeClass('active');
            // $("div.tab-content").find('div.step-2').addClass('active');
            // },100);

            $("#day").bind("input propertychange", function () {
                var namepata = /^[0-9]+$/;
                $days = $("#day").prop("value");

                if (!$days.match(namepata)) {
                    $.growl.error({message: "Only digit !"});
                    $("#day").focus();
                    $("#day").val("");
                    return false;
                }
            });
            $("#night").bind("input propertychange", function () {

                var namepata = /^[0-9]+$/;
                $nights = $("#night").prop("value");

                if (!$nights.match(namepata)) {
                    $.growl.error({message: "Only digit !"});
                    $("#night").focus();
                    $("#night").val("");
                    return false;
                }
            });
            $("#pn").bind("input propertychange", function () {

                var namepat = /^[A-za-z\s]+$/;
                $pname = $("#pn").prop("value");

                if (!$pname.match(namepat)) {
                    $.growl.error({message: "Only Alphabates !"});
                    $("#pn").focus();
                    $("#pn").val("");
                    return false;
                }
            });
            $("#pd").bind("input propertychange", function () {

                var namepat = /^[A-za-z\s]+$/;
                $pdesc = $("#pd").prop("value");

                if (!$pdesc.match(namepat)) {
                    $.growl.error({message: "Only Alphabates !"});
                    $("#pd").focus();
                    $("#pd").val("");
                    return false;
                }
            });
            $("#nol").bind("input propertychange", function () {

                var namepata = /^[0-9]+$/;
                $nol = $("#nol").prop("value");

                if (!$nol.match(namepata)) {
                    $.growl.error({message: "Only Digit !"});
                    $("#nol").focus();
                    $("#nol").val("");
                    return false;
                }
            });
            $("#cmper").bind("input propertychange", function () {

                var namepata = /^[0-9]+$/;
                $commission = $("#cmper").prop("value");

                if (!$commission.match(namepata)) {
                    $.growl.error({message: "Only digit !"});
                    $("#cmper").focus();
                    $("#cmper").val("");
                    return false;
                }
            });

</asp:Content>

