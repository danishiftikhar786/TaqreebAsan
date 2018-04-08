<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admins_logins.aspx.cs" Inherits="Admins_logins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style =" padding-top:5%;  padding-bottom:20%; padding-left:8%;  ">
<div class="row">
<div  class=" col-lg-12" style="background-color:#F4F6F9; " >

<h3 class="list_heading">Welcome!</h3>

<h4><b class="gray">For  Service Provide Access please <a  class="btn btn-primary" href="ServiceProvider/Login.aspx">click here</a></b></h4></br>
<h4><b class="gray">To register New Service Provider Please<a  class="btn btn-primary" href="ServiceProvider/Registeration.aspx"> click here</a></b></h4>
</br>
<h4><b class="gray">To make booking please</b> <a class="btn btn-primary" href="Client/user_Login.aspx">click here</a></h4>
<br />
<a href="Admin/Login.aspx"><h4><b class="gray">Admin login!</b></h4></a>
<hr>
</div>
</div>
</div>
</asp:Content>

