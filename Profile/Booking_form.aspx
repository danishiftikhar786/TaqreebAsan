<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Booking_form.aspx.cs" Inherits="Profile_Booking_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-3">
<fieldset>

<!-- Form Name -->
<legend>Enter Yor Detail</legend>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="user_name" name="textinput" type="text" placeholder="User Name" class="form-control input-md" required="">
    <p class="help-block">get user name</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="c_name" name="textinput" type="text" placeholder="Your Name" class="form-control input-md">
    <p class="help-block">e.g Ali Aslam </p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="email" name="textinput" type="text" placeholder="email address" class="form-control input-md" required="">
    <p class="help-block">e.gbooking@gmail.com</p>
  </div>
</div>

<!-- Password input-->
<div class="control-group">
  <label class="control-label" for=""></label>
  <div class="controls">
    <input id="cnic" name="textinput" type="password" placeholder="CNIC number" class="form-control input-md" required="">
    <p class="help-block">37402-8465698-6</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="textinput"></label>
  <div class="controls">
    <input id="tp" onchange="persons();" name="textinput" type="text" placeholder="Guest Count" class="form-control input-md" required="">
    <p class="help-block">e.g 350/400/700/100</p>
  </div>
</div>

<!-- Text input-->

<div class="control-group">
  <label class="control-label" for="number"></label>
  <div class="controls">
    <input id="number" name="number" type="text" placeholder="Phone Number/Mobile Number" class="form-control input-md" required="">
    <p class="help-block">0305-2569236/051-569823</p>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
    <button id="Button1" name="" onclick="make_call_booking()"class="btn btn-primary">Contine Booking</button>
  </div>


</fieldset>
</div>
</asp:Content>

