
/*
Author=Danish iftikhar
date =03/02/2015
*/

// function to show dialog to add new dish
$("#add_new").dialog({
    autoOpen: false,
    width: 400,
    height: "auto",
    draggable: false,
    resizable: false,
    show: { effect: 'slide', duration: 1500 },
    modal: true,
    title: "Add New Dish Data!",
    buttons: [
		{
		    text: "Save",
		    click: function () {
		        var n = $("#ContentPlaceHolder1_dp_name").val();
		        var p = $("#ContentPlaceHolder1_d_price").val();
		        $(this).dialog("close");
		        $("#loading").html('<img src="../website_images/ajax-loader.gif" />');
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
        },
        failure: function (response) {
            //alert(response.d);
            $("#error").html("Error!");
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
        var editableText = $("<input type='text' class='input-md' id='price_change'/>");
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

