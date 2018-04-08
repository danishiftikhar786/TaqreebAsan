<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Menus.aspx.cs" Inherits="Profile_Menus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="page-header"><h1 align="center"><strong>Offered Menus By[<%=Page.RouteData.Values["name"].ToString() %>]s</strong></h1> </div>

</br>

 <script src='<%=ResolveUrl("../App_Themes/jquery-ui-1.11.2.custom/external/jquery/jquery.js")%>'></script>
 <script src='<%=ResolveUrl("../App_Themes/jquery-ui-1.11.2.custom/jquery-ui.js")%>'></script>


 
<asp:ListView runat="server" ID="menu">
        <ItemTemplate>
        

        
        <div class="col-lg-4" style="cursor:pointer;">
		<div class="list-group">
        <span class="list-group-item white green" >
        <table ><tr ><td><h4 align="center"><%#Eval("name")%></h4></td><td><h5 align="center">Per head=<%#Eval("per_head")%>RS</h5></td></tr></table></span>
        <div id="<%#Eval("menu_id")%>" class="list-group-item">
        <script type="text/javascript">
            $("#<%#Eval("menu_id")%>").html("<img src='<%=ResolveUrl("../website_images/ajax-loader.gif")%>'> loading...");
            $("#<%#Eval("menu_id")%>").load("<%=ResolveUrl("Menu_dishes.aspx?id=")%><%#Eval("menu_id")%>");
            
            
        </script>
        </div>
        
        </div>
	    </div>
        


	    
        
        </ItemTemplate>
        </asp:ListView>
        
</asp:Content>

