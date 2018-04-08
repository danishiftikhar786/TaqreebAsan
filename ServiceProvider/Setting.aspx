<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="ServiceProvider_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style=" padding-top:5%;">
<script src="java script/settings.js" type="text/javascript"></script>
<div style="padding-right:5%;">
<div align="left"><h2 class="h3">Profile</h2></div>
<hr  />
<!--basic info-->
<div>
<div align="left"> <p class="h4"><b>Basic info</b></p></div>
<div style=" padding:5%;">
Marriage Hall Name:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label  ClientIDMode="Static"   ID="Name" CssClass="bg-info h4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#change_info" id="na" onclick="change_name();">Edit</a></br></br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Guest capcity:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label  ClientIDMode="Static"  ID="capacity" CssClass="bg-info h4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#change_info" id="cap" onclick="change_capacity();">Edit</a></br></br>
Single Hall Charges:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label   ID="hall_charges" ClientIDMode="Static" CssClass="bg-info h4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#charge_info" id="A2" onclick="charge_change();">Edit</a></br></br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label   ID="address" ClientIDMode="Static" CssClass="bg-info h4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#change_info" id="add" onclick="change_address();">Edit</a>

 
<br>About us:&nbsp;&nbsp;&nbsp;<p id="about_us" ClientIDMode="Static" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hello kay hal hai&nbsp;&nbsp;</p><a href="#charge_info" id="A3" onclick=" about_us();">Edit</a></br></br> 

</div>
<hr  />
</div>
<!-- contact info address-->    
<div>
<div align="left"> <p class="h4">Contact Info</p></div>
<div style=" padding:5%;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Website:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ClientIDMode="Static"   ID="website" CssClass="bg-info h4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#change_info" id="web" onclick="web_url();">Edit</a></br></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Address:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ClientIDMode="Static"   ID="email"  CssClass="bg-info h4" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#change_info" id="mail" onclick="change_mail_address();">Edit</a></br></br>
</div>
<hr  />
</div>
<!--change  password-->
<div>
<div align="left"> <p class="h4">Change password</p></div>
<asp:Label ID="bd" CssClass="invisible" ClientIDMode="Static"  runat="server"></asp:Label>
<div style=" padding:5%;">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="pass" ClientIDMode="Static" CssClass="bg-info h4"  runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<a href="#change_info" id="a1" onclick="change_password()">Change</a>
</div>

<hr  />
</div>



</asp:Content>

