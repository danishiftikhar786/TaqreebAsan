<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu_dishes.aspx.cs" Inherits="Profile_Menu_dishes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<table>
    <asp:ListView runat="server" ID="menu_dishes">
        <ItemTemplate>
        <tr>
        <td colspan="2"></td>
        <td>
        <h5><b><%#Container.DataItemIndex+1 %>)<%#Eval("dish_name") %></b></h5>
        </td>
        </tr>
        </ItemTemplate>

    </asp:ListView>
    </table>
</body>
</html>
