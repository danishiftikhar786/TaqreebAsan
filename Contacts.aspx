<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Profile_Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--contact number-->
</br>
</br>
<div class="row">
<div class="container well">
<h3 align="center">[ Informations]</h3>
<div class="col-lg-4">
<h4>Phone Numbers</h4>
<h5><asp:Label ID="phone_number" runat="server" >Not specified</asp:Label></h5>
</div>

<div class="col-lg-4">
<h4>other Contacts</h4>
<h5>Website:<a id="site" runat="server"><P runat="server" id="web">Not specified</P></a></h5>
<h5>Email address:<a href="#"><P  runat="server" id="email">Not specified</P></a></h5>

</div>
<div class="col-lg-4">
<h4>Address:</h4>
<p runat="server" id="address">Not specified</p>
<h4>Main City:</h4>
<p runat="server" id="m_city">Not specified</p>
<h4>Area:</h4>
<p runat="server" id="s_city">Not specified</p>
<h4>Gusets Capicity:</h4>
<p runat="server" id="capacity">Not specified</p>


</div>
</div>


</div>

</asp:Content>

