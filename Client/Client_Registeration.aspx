<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Client_Registeration.aspx.cs" Inherits="Client_Client_Registeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TaqreebAsan</title>
    <link  href="../website_images/favico.ico" sizes="72x72" rel="icon" type="image/png"/>
    <link href="../App_Themes/Registeration/css/default.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server" style=" height:700px;" class="register">
    <h1>User Registration</h1>
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label>User Name*
                    </label>
                    <asp:TextBox ID="u_name" runat="server" required="true"></asp:TextBox>
                    <asp:Label ID="id_error" runat="server" Text=""></asp:Label>
                </p>
                <p>
                    <label>Password*
                    </label>
                    <asp:TextBox ID="apassword" runat="server" 
                        TextMode="Password" required="true"></asp:TextBox>
                    </p>
                    <p>
                    <label>Repeat Password*
                    </label>
                    <asp:TextBox ID="bpassword"  runat="server"  TextMode="Password" required="true"></asp:TextBox>
                    
                    <label class="obinfo">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="apassword" ControlToValidate="bpassword" 
                            ErrorMessage="Password not  matches!"></asp:CompareValidator>
                        *
                    </label>
                </p>
            </fieldset>
            <fieldset class="row2">
                <legend>Personal Details
                </legend>
                <p>
                
                    <label> First Name *
                    </label>
                    
                    <asp:TextBox ID="f_name" runat="server" required="true"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" ControlToValidate="f_name" runat="server"  ForeColor="Red" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>
                </p>
              
               <p>
                    <label> Last Name *
                    </label>
                    <asp:TextBox ID="l_name" runat="server" required="true"></asp:TextBox>
                </p>
                <p>
                    <label>City *
                    </label>
                    <asp:DropDownList ID="city" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tempConnectionString %>" 
                        SelectCommand="SELECT [name] FROM [cities]"></asp:SqlDataSource>
                </p>
               <p>
                    <label> Email Address*
                    </label>
                    <asp:TextBox ID="email_address" runat="server" required="true"></asp:TextBox>
                </p>
                 <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator3" runat="server" 
                         ErrorMessage="Please Enter correct Email address!" ControlToValidate="email_address" 
                         ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

               
                <p>
                    <label>CNIC *
                    </label>
                    <asp:TextBox ID="cnic" runat="server" required="true"></asp:TextBox>
                </p>
                 <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator2" runat="server" 
                         ErrorMessage="Please Enter correct CNIC number!" ControlToValidate="cnic" 
                         ForeColor="Red" ValidationExpression="^\d{13}$"></asp:RegularExpressionValidator>

                 <p>
                    <label>Mobile number *
                    </label>
                    <asp:TextBox ID="p_number" runat="server" required="true"></asp:TextBox>e.g 0304-5065329
                </p>
                <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" 
                         ErrorMessage="Please Enter correct Mobile Number!" ControlToValidate="p_number" 
                         ForeColor="Red" ValidationExpression="^03\d{2}-\d{7}$"></asp:RegularExpressionValidator>

                 
            </fieldset>
            <fieldset class="row3">
                <div class="infobox"><h4>Helpful Information</h4>
                    <p>Notes:<br />
                    1)All filed are required  and must to be fill.
                    <br />
                    2)Please Must provide correct mobile number.
                    <br />
                    3)CNIC number is compalsory to provider.
                    <br />
                    4)All coversion will be on email address provided and phone number.
                    </p>
                </div>
            </fieldset>
            <fieldset class="row4">
                <legend>Terms and Mailing
                </legend>
                <p class="agreement">
                    <input type="checkbox" value="" required="true" >
                    <label>*  I accept the <a href="../Clients_Term_Serices.aspx">Terms and Conditions</a></label>
                </p>
                <!--<p class="agreement">
                    <input type="checkbox" id="p_offers" value="" required="true"/>
                    <label>I want to receive personalized offers by your site</label>
                </p>-->
               
            </fieldset>
            <div>
                <asp:Button Text="Register" CssClass="button" runat="server" ID="register" onclick="register_Click" 
                   ></asp:Button></div>

    </form>
</body>
</html>
