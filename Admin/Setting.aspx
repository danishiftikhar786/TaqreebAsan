<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="Admin_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div  class="container">
<asp:Label ClientIDMode="Static" Visible="false" runat="server" ID="id"></asp:Label>

<div><h2 class="h3" align="center">Settings</h2></div>
<hr  />
    <div class="row" >
    <div class="col-lg-2"><h5>Password:</h5></div>
     <div class="col-lg-2">
   

<asp:Label ID="pass" ClientIDMode="Static" CssClass="bg-info h4"  runat="server"></asp:Label><a href="#change_info" id="a1" onclick="change_password()">Change</a>
</div>

    </div>
</div>
<script src="javascript/setting_admin.js"></script>

</asp:Content>

