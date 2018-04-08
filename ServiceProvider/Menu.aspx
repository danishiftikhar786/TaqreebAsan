<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="ServiceProvider_Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script src="java script/menu.js" type="text/javascript"></script>
<div class=" panel-default">
<div class="panel-body">
<div align="right">
<input   id="add_menu" type="button" class="btn btn-primary" value="New Menu" title="Add New Menu" />
<%--blew script is to add Menu--%>
</div>
</div>
</div>

<div id="loading"></div>
<div id="error" class=" label-danger"></div>
<div id="success" class="label-success"></div>

<div id="add_new_menu" title="Add new dish" class="container" >
<div class="row" align="center"> <div class="col-lg-2></div><div class="col-lg-4><input placeholder="Enter Menu Name" class="form-control input-md" type="text" runat="server"  id="m_name"  /></div></div></br>
<div class="row" align="center"> <div class="col-lg-2></div><div class="col-lg-4><asp:CheckBoxList ID="c_dishes"  runat="server" ></asp:CheckBoxList></div></div></br>
<div class="row" align="center"> <div class="col-lg-2></div><div class="col-lg-4><input placeholder="Enter Menu Perhead Charges" class="form-control input-md" type="text" runat="server"  id="d_price"  /></div></div></br>
<br />
</div>
<script>

    $("#add_new_menu").dialog({
        autoOpen: false,
        width: 700,
        height: 400,
        draggable: false,
        resizable: false,
        show: { effect: 'bounce', duration: 1500 },
        modal: true,
        title: "Add New  Menu!",
        buttons: [
		{
		    text: "Save",
		    click: function () {
		        var n = $('#<%=m_name.ClientID %>').val();
		        var p = $('#<%=d_price.ClientID %>').val();
		        var selected = new Array();
		       // var p = 0;
		        $("[id*=c_dishes] input:checked").each(function () {
		            selected.push($(this).val());
		            
		        });
		        $(this).dialog("close");
		        $("#loading").html('<img src="../website_images/ajax-loader.gif" />');
		        save(n, p, selected);
		        $("#loading").delay(3000).hide(500);
		    }
		},
		{
		    text: "Cancel",
		    click: function () {
		        $("#d_name").text("");
		        $("#d_price").text("");
		        $("#loading").html("Cancled");

		        $("#loading").delay(3000).hide(500);
		        $(this).dialog("close");
		    }
		}
	]
    });


    // Link to open the dialog
$("#add_menu").click(function (event) {
        $("#add_new_menu").dialog("open");
        event.preventDefault();
    });

    // save function for add new dish
    function save(a, b, selected) {
        var x;
        if (selected != "") {
            var datatype = "{name:'" + a + "' ,price:'" + b + "',ids:'" + selected + "'}";
            $.ajax({
                type: "POST",
                url: "Menu.aspx/add_new_Menu",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //x = JSON.stringfy(datatype);
                success: function (response) {
                    //alert(response.d);
                    $("#success").html(response.d);
                },
                failure: function (response) {
                    //alert(response.d);
                    $("#error").html("Error!");
                }
            });
        }
        else {
            alert("Please select dishes  in Menu Must!");
        }
        location.reload();
    }

 </script>



<div class="table-responsive">
<table class=" table table-responsive table-hover">
   
      <tr style="background-color:#EBEBE0; color:#B04D58;">
         <th>Serial NO:</th>
         <th> Menu Name</th>
         <th> Per Head Charge</th>
         <th> Update</th>
         <th> Delete</th>
      </tr>
<asp:ListView ID="Menus" runat="server">
<ItemTemplate>
 <tr>
<td><h5><b><%#Container.DataItemIndex+1 %></b></h5></td>
<td><h5><b><%#Eval("name") %></b></h5></td>
<td><h5><b><div id="per_head_<%#Container.DataItemIndex+1 %>"><%#Eval("per_head") %></div></b></h5></td>
<td><input id="update-link"  type=button class="btn btn-primary" onclick="update_price(this,<%#Eval("menu_id") %>,<%#Container.DataItemIndex+1 %>)"  value="Update" title="<%#Eval("name") %>"/></td>
<td><input id="delete-link"  type=button class="btn btn-danger"  onclick="remove_menu(this,<%#Eval("menu_id") %>)"   value="Delete" title="<%#Eval("name") %>"/></td>
</tr>
</ItemTemplate>
</asp:ListView>
</table>
</div>
</asp:Content>

