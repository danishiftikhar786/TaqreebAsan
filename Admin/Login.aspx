<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Login</title>
<link  href="../website_images/favico.ico" sizes="72x72" rel="icon" type="image/png"/>
<link rel="stylesheet" type="text/css" href="../App_Themes/Registeration/css/Logincss/css/reset.css">
<link rel="stylesheet" type="text/css" href="../App_Themes/Registeration/css/Logincss/css/structure.css">
</head>

<body>
    <h2 align="center"><a  href="../Default.aspx"><img src="../website_images/logo-00cf9f7ce65e78525dfa239deb62bfbd.png" /></a></h2>
    <br><br><br><br><br>
    <br>
    <h2 align="center" style="color:White; font-size:xx-large; font-family:Arial;"><b>Admin Portal</b></h2>
<form id="Form1" class="box login" runat="server" >
	
        <fieldset class="boxBody">
	  <label>Username</label><asp:TextBox ID="u_name" required="true"  placeholder="User Name" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1"
          runat="server" ErrorMessage="Not valid email address" ControlToValidate="u_name" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
	  <label>Password</label>
      <asp:TextBox ID="pass" required="true"  TextMode=Password placeholder="Password" runat="server"></asp:TextBox><label runat="server" id="error" style="color:Red;" ></label>
	  
	    </fieldset>
	    <footer>
	  <!--<label><input type="checkbox" tabindex="3">Keep me logged in</label>-->
	  <asp:Button ID="login" runat="server" CssClass="btnLogin" Text="Login" onclick="login_Click" 
            ></asp:Button>
	
	</footer>
</form>
</body>
</html>
