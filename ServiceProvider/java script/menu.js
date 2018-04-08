/*
Author=Danish iftikhar
date =03/02/2015
*/

$("#add_new_menu").dialog({
    autoOpen: false,
    width: 700,
    height: 400,
    draggable: false,
    resizable: false,
    show: { effect: 'slide', duration: 1500 },
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


// save function for add new dish/////////////////////////////////////////////////////
function save(a, b, selected) {
    var x;
    
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
            location.reload();
        },
        failure: function (response) {
            //alert(response.d);
            $("#error").html("Error!");
            location.reload();
        }
    });
}



//function to delete menu//////////////////////////////////////////////////////////////////////
function remove_menu(data, id) {
return $("<div class='dialog' title='Remove Menu?'><p>Please Confirm to Remove Menu!</p></div>")
    .dialog({
        resizable: false,
        height: 170,
        modal: true,
        buttons: {
            "Confirm": function () {
                //make ajax call to delete function
                var datatype = "{id:'" + id + "'}";
                $.ajax({
                    type: "POST",
                    url: "Menu.aspx/remove_menu",
                    data: datatype,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    //x = JSON.stringfy(datatype);
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

                $(this).dialog("close");
            },
            Cancel: function () {
                $(this).dialog("close");
            }
        }
    });
    //alert(id);    
}

//function to update menu price/////////////////////////////////////////////////////

function update_price(data,id,num) {

    var text = ($(data).attr('value'));
    var div_id = "per_head_" + num;
    //alert(div_id);
    if (text == "Update") {

        //generate run time textfield
        var divHtml = $("#" + div_id + "").html();
        // create a dynamic textarea
        var editableText = $("<input type='text' class='input-md' id='price_change'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the  input type 
        $("#" + div_id + "").replaceWith(editableText);
        $(data).attr('value', 'Save');



    }
    else if (text == "Save") {

        var price = $("#price_change").val();
        //alert("save");
        var datatype = "{menu_id:'" + id + "',m_price:'" + price + "'}";
        //ajax call to update  menu price
        $.ajax({
            type: "POST",
            url: "Menu.aspx/update_price",
            data: datatype,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            //x = JSON.stringfy(datatype);
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

       

        

    }
   

}


