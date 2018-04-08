<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Web_pages_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
<link  href="../website_images/favico.ico" sizes="72x72" rel="icon" type="image/png"/>
<link rel="stylesheet" type="text/css" href="../App_Themes/Registeration/css/Logincss/css/reset.css">
<link rel="stylesheet" type="text/css" href="../App_Themes/Registeration/css/Logincss/css/structure.css">
</head>

<body>

<h2 align="center"><a href="../Default.aspx"><img  src="../website_images/logo-00cf9f7ce65e78525dfa239deb62bfbd.png"/></a></h2>
<form class="box login" runat="server" >
<h2 align="center">Service Provider Portal</h2>
	    <fieldset class="boxBody">
	  <label>Username</label><asp:TextBox ID="u_name" required placeholder="User Name" runat="server"></asp:TextBox>
	  <label>Password</label>
      <asp:TextBox ID="pass" required  TextMode=Password placeholder="Password" runat="server"></asp:TextBox><label runat="server" id="error" style="color:Red;" ></label>
	  
	    </fieldset>
	    <footer>
	 
	  <asp:Button ID="login" runat="server" CssClass="btnLogin" Text="Login" 
            onclick="login_Click"></asp:Button>
	<label><a href="../ServiceProvider/Registeration.aspx" class="btnLogin" tabindex="5">Not a Member</a></label>
	</footer>
</form>
</body>
</html>
