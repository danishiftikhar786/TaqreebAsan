<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style =" padding-top:5%;  padding-bottom:15%; padding-left:8%; ">

<div class="row">
<div class="col-lg-7">

<!--tags for email-->




<p>
       <b> Please Fill the Following Fields.</b></p>
        
    <p>
        Your name:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
            ControlToValidate="YourName" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourName" runat="server" Width="250px" /><br />
        Your email address:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
            ControlToValidate="YourEmail" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourEmail" runat="server" Width="250px" />
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
            SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
            ValidationGroup="save" /><br />
        Subject:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
            ControlToValidate="YourSubject" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourSubject" runat="server" Width="400px" /><br />
        Your Question:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate="Comments" ValidationGroup="save" /><br />
        <asp:TextBox ID="Comments" runat="server" 
                TextMode="MultiLine" Rows="10" Width="400px" />
    </p>

    <p>
        <asp:Button ID="btnSubmit" CssClass=" btn btn-lg" runat="server" Text="Send" 
                    OnClick="Button1_Click" ValidationGroup="save" />
    </p>
    


<p>
    <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
</p>  
</div>

</div>
</div>
<div class="row">

<div class="col-lg-4"><h3>Email Address:</h3>feedback@taqreebasan.com</div>
<div class="col-lg-4"><h3>Mobile Number:</h3>0304-9074957(Danish Iftikhar)</div>
<div class="col-lg-4"><h3>Mobile Number:</h3>0334-5326048(Sajid Malik)</div>
</div>

</asp:Content>

