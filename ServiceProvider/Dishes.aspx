<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Dishes.aspx.cs" Inherits="ServiceProvider_Dishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class=" panel-default">
<script src="java script/dish.js" type="text/javascript"></script>
<div  id="mydiv"class="panel-body" >
<div align="right">
<input   id="add_dish" type="button" class="btn btn-primary " value="New Dish" title="Add New Dish" />
<%--blew script is to add dish--%>
</div>
<%--loading--%> 
<div id="loading"></div>
<div id="error" class=" label-danger"></div>
<div id="success" class=" label-warning"></div>



</div>
<div id="add_new" title="Add new dish" class="container" >
<div>
<div class="row" align="center"> <div class="col-lg-2"></div><div class="col-lg-4"><select id="dp_name" runat=server class="dropdown"></select></div></div></br>
<div class="row" align="center"> <div class="col-lg-2"></div><div class="col-lg-4"><input placeholder="Enter Dish Charges" type="text" runat="server"  id="d_price" class="input-sm" /></div></div></br>

</div>
<br />
<div></div>
</div>
<script>
    // function to show dialog to add new dish
    $("#add_new").dialog({
        autoOpen: false,
        width: 400,
        height: "auto",
        draggable: false,
        resizable: false,
        modal: true,
        title: "Add New Dish Data Of perhead!",
        buttons: [
		{
		    text: "Save",
		    click: function () {
		        var n = $("#<%= dp_name.ClientID %>").val();
		        var p = $("#<%= d_price.ClientID %>").val();
		        $(this).dialog("close");
		        $("#loading").html('<img src="../website_images/ajax-loader.gif" />');
		       // alert("name= "+n);
		       // alert("prcie= "+p);
		        save(n, p);
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
    $("#add_dish").click(function (event) {
        $("#add_new").dialog("open");
        event.preventDefault();
    });
    //fucntion for ajax call to call web service
    function save(a, b) {
        var datatype = "{name:'" + a + "' ,price:'" + b + "'}";
        $.ajax({
            type: "POST",
            url: "Dishes.aspx/New_dish",
            data: datatype,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
                $("#success").html(response.d);
                location.reload();
            },
            failure: function (response) {
                //alert(response.d);
                $("#error").html("Error!");
                location.reload();
            }
        });
    }



    //function to update dish price
    function update_dish(temp, b) {
        //alert(b);

        var text = ($(temp).attr('value'));
        var d_id = ($(temp).attr('title'));
        var id = ($(temp).attr('id'));
        var div_id = "per_head" + b;
        if (text == "Update") {
            //alert("success");

            var divHtml = $("#" + div_id + "").html();
            // create a dynamic textarea
            var editableText = $("<input type='text' id='price_change'/>");
            // fill the textarea with the div's text
            editableText.val(divHtml);
            // replace the div with the textarea
            $("#" + div_id + "").replaceWith(editableText);
            //change button text
            $(temp).attr('value', 'Save');
        }
        else if (text == "Save") {

            var divHtml = $("#" + div_id + "").html();
            var price = $("#price_change").val();
            // ajax call to update dish price
            // set data in jason formate
            var datatype = "{d_id:'" + d_id + "',d_price:'" + price + "'}";
            //alert(datatype);
            $.ajax({
                type: "POST",
                url: "Dishes.aspx/update_price",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    $("#success").html(response.d);
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);
                    $("#error").html(response.d);
                    location.reload();
                }
            });
            $(temp).attr('value', 'Updated');
        }


    }

    // function to delete dish 
    function delete_dish(el) {
        //alert("hello");
        var id = ($(el).attr('title'));
        //$("#delete").dialog("open",[el]);
        var datatype = "{id:'" + id + "'}";
        $.ajax({
            type: "POST",
            url: "Dishes.aspx/remove_dish",
            data: datatype,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            //success response
            success: function (response) {
                //alert(response.d);
                $("#success").html(response.d);
                location.reload();
            },
            //faliure response
            failure: function (response) {
                //alert(response.d);
                $("#error").html(response.d);
                location.reload();
            }
        });
    }


    
</script>


<div class="table-responsive">

<table class="table table-responsive table-hover">
      <tr style="background-color:#EBEBE0; color:#B04D58;">
         <th>Serial NO:</th>
         
         <th>Dish Name</th>
         <th>Per Head Charge</th>
         <th><div>Update</div></th>
         <th>Delete</th>
      </tr>
     
      <asp:ListView ID="adds" runat="server" >
       <ItemTemplate>
        <% int i = 1;{ %>
      <tr>
        
         <td><h5><b><%#Container.DataItemIndex+1%></b></h5></td>
         <td><h5 id="dish_<%Response.Write(i); %>"> <b><%#Eval("dish_name")%></b></h5></td>
         <td><h5 id="price_<%Response.Write(i); %>"> <b><div id="per_head<%Response.Write(i); %>"><%#Eval("perhead_price")%></div></b></h5></td>
         <td>
        
           <input id="update<%Response.Write(i); %>"  onclick="update_dish(this,<%Response.Write(i);%>);" type=button class="btn btn-primary"  value="Update" title="<%#Eval("offered_d_id")%>"/>
         </td>
         <td>     
         <input id="delete-link<%Response.Write(i); %>"   onclick="delete_dish(this);"  type=button class="btn btn-danger"  value="Delete" title="<%#Eval("offered_d_id")%>"/>
 
 </td>
  </tr>
  <%i++; %>
  <%} %>
 </ItemTemplate>
        
        </asp:ListView>
      
        </table>
</div>

</div>

</asp:Content>

