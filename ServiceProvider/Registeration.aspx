<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registeration.aspx.cs" Inherits="ServiceProvider_Registeration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Service provider Registeration</title>
<link  href="../website_images/favico.ico" sizes="72x72" rel="icon" type="image/png"/>
<link href="../App_Themes/Registeration/css/default.css" type="text/css" rel="Stylesheet" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <style type="text/css">
        .style1
        {
            width: 250px;
        }
    </style>
</head>
<body>
    <form id="ff" runat="server" class="register">
    <h1>Service Provider Registration</h1>
            <fieldset class="row1">
                <legend>Account Details
                </legend>
                <p>
                    <label><strong>User Name</strong>*
                    </label>
                    <asp:TextBox ID="email"  runat="server" Width="150px" TextMode="SingleLine" required="true"  validType="email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="email" runat="server" ErrorMessage="special characters are  not allowed not allowes and 15 char log only" ValidationExpression="^[a-z0-9_-]{0,15}$"></asp:RegularExpressionValidator>
                    <label  class="obinfo">*e.g(ali_60,kaleem_70)<asp:Label ID="id_message_1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </label>
                    
                    
                </p>
                <p>
                    <label><strong>Password</strong>*
                    </label>
                    <asp:TextBox ID="password" runat="server" Width="150px" TextMode="Password" required="true"></asp:TextBox>
                    
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="password" ErrorMessage="Please enter password!" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    
                    
                </p>
                <p>
                <label><strong>Repeat Password</strong>*
                    </label>
                    <asp:TextBox ID="password1" runat="server" Width="150px" TextMode="Password" required="true"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="password" ErrorMessage="Password not match!" 
                        ForeColor="Red" ControlToValidate="password1"></asp:CompareValidator>
                </p>
            </fieldset>
            <fieldset class="row2">
                <legend>Service Provider Details
                </legend>
                <p>
                    <label><b><strong>Profile Image </strong></b>*
                    </label>
                    <input type="file" runat="server" id="upload"  class="btn btn-success"  accept="jpg|png" multiple="true" data-buttonText="Your label here."  />
                    
                </p>
                <p>
                    <label><strong>Service Provider Name</strong> *
                    </label>
                    <asp:TextBox class="long" id="sp_name" required="true" runat="server"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Please enter name!" ForeColor="Red" 
                        ControlToValidate="sp_name"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <label>
                    <a href="http://regsys.fbr.gov.pk/Registration/onlinesearchTaxpayer.aspx">
                    <strong>NTN</strong></a><strong>(If any)</strong>*
                    </label>
                    <asp:TextBox class="long" id="ntn"  runat="server"  ></asp:TextBox>
                    <br />
                    &nbsp;</p>
                <p>
                    <label><b><strong>Manager Name </strong></b>*
                    </label>
                    <asp:TextBox class="long" id="admin_name" required="true" runat="server"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        ErrorMessage="Please enter Admin name! " runat="server" ForeColor="Red" 
                        ControlToValidate="admin_name"></asp:RequiredFieldValidator>
                </p>
                 <p>
                    <label class="optional">Website(if any)*
                    </label>

                    <asp:TextBox class="long" type="text" value="http://" runat="server" ID="web_url" ></asp:TextBox>
                    
                </p>
                <!--email address-->
                <p>
                    <label class="optional">Emailaddress(if any)*
                    </label>
                  <asp:TextBox class="long" type="text"  runat="server" ID="email_address" ></asp:TextBox>
                </p>
                <!--total capacity-->
                <p>
                    <label ><strong>Total Guest Capacity*</strong> </label>
                    <asp:TextBox class="long" type="text" required="true"  runat="server" 
                        ID="capacity" TextMode="Number" BorderColor="#6699FF" ></asp:TextBox>
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="capacity" ErrorMessage="Guest Capacity less than  5000 only" 
                        ValidationExpression="\b0*([0-9]{1,3}|[1-4][0-9]{3}|5000)\b"></asp:RegularExpressionValidator>
                    
                </p>
                 <!--total halls-->
                <p>
                    <label ><strong>Total Halls*</strong>
                    </label>
                  <asp:TextBox class="long" type="text"  required="true" TextMode="Number"   runat="server" ID="T_hall" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="T_hall" ErrorMessage="Maximum value is 50" 
                        ValidationExpression="\b0*([0-9]|[1-4][0-9]|50)\b"></asp:RegularExpressionValidator>
                </p>
                <!--Hall charges-->
                <p>
                    <label ><strong>Single Hall Charges*</strong>
                    </label>
                  <asp:TextBox class="long" type="text"  required="true" TextMode="Number"   runat="server" ID="T_h_charges" ></asp:TextBox>
                </p>
                <!--operational Timing-->
                <p>
                    <label ><strong>Operational Timing*</strong>
                    </label>
                    <table>
                    <tr>
                    <td><asp:CheckBox ID="day" runat="server" />Day(12pm to 5pm )</td>
                    <td><asp:CheckBox ID="night" runat="server" />Evening(5pm to  10pm)</td>
                    </tr>
                    </table>
                </p>
                 <!--car parking-->
                <p>

                    <label ><strong>Car Parking*</strong>
                    <table>
                    <tr>
                    <td colspan="2">
                        <asp:DropDownList  ID="parking" runat="server">
                            <asp:ListItem Selected="True">yes</asp:ListItem>
                            <asp:ListItem>no</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    </tr>
                    </table>
                    </label>
                </p>
               



            </fieldset>
            <fieldset class="row3">
                <legend>Contact  Information
                </legend>
                <table>
                <tr>
                <td><label><strong>Phone Number</strong> *
                    </label></td>
                <td class="style1">
                    <asp:TextBox ID="number" runat="server" Width="96%"  placeholder="Enter Number" 
                        required="true"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="number" ErrorMessage="Must Enter Number!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td><label><strong>Main City </strong>*
                    </label></td>
                <td class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tempConnectionString %>" 
                        SelectCommand="SELECT [name] FROM [cities]"></asp:SqlDataSource>
                  <!--  <asp:TextBox ID="sub_city" runat="server" Width="96%"  required="true" 
                        placeholder=" Enter Sub City(etc Rawalpindi KrungRoad..)" ></asp:TextBox>--></td>
                <td></td>
                </tr>
                <tr>
                <td><label><strong>Full Address</strong> *</label></td>
                <td class="style1">
                    <asp:TextBox ID="address" runat="server" Width="100%" 
                        TextMode="MultiLine" required="true" BorderColor="#A54853" 
                        CssClass="infobox" Height="89px"></asp:TextBox>
                    </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Address Required!" ForeColor="Red" 
                        ControlToValidate="address"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                   <tr> <td><label><strong> About yourself.</strong> *</label></td>
                   
                <td class="style1">
                    <asp:TextBox ID="about" runat="server" Width="100%" 
                        TextMode="MultiLine" required="true" BorderColor="#A54853" 
                        CssClass="infobox" Height="89px" ></asp:TextBox>
                    </td><td>Sample :Taqreebasan is pakistan first event organizer  ..etc<asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "about" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{0,150}$" runat="server" ErrorMessage="Maximum 150 characters required."></asp:RegularExpressionValidator></td>
                    </tr>
                
                <tr>
                <td colspan="3">
                </br><fieldset class="row4">
                <legend>Terms and Mailing
                </legend>
                <p class="agreement">
                    <input type="checkbox" required="true" value=""/>
                    <label>*  I accept the <a href="../Terms_Serices.aspx" target="_blank" >Terms and Conditions</a></label>
                </p>
                
                
            </fieldset></td>
                </tr>
                <tr>
                <td colspan="3">  <div> <asp:Button Text="Register" CssClass="button" runat="server" ID="register" 
                    onclick="register_Click"></asp:Button></div></td>
                </tr>
                
                </table>
                
               
                
            </fieldset>
            
          

    </form>
</body>
</html>
