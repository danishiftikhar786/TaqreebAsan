<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadfile.aspx.cs" Inherits="ServiceProvider_uploadfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="Stylesheet" type="text/css" href="../App_Themes/uploadify/CSS/uploadify.css" />
     <script type="text/javascript" src="../App_Themes/uploadify/scripts/jquery-1.3.2.min.js"></script>
     <script type="text/javascript" src="../App_Themes/uploadify/scripts/jquery.uploadify.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    
    <div style = "padding:40px">
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </div>
    
  
    </form>
    <script type = "text/javascript">
        $(window).load(
    function () {
       
        $("#<%=FileUpload1.ClientID %>").fileUpload({
            'uploader': '../App_Themes/uploadify/scripts/uploader.swf',
            'cancelImg': '../App_Themes/uploadify/images/cancel.png',
            'buttonText': 'Upload Images',
            'script': 'Upload.ashx',
            'folder': 'uploads',
            'fileDesc': 'Image Files',
            'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
            'multi': true,
            'auto': true
        });
    }
);
</script> 


</body>
</html>
