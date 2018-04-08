/*
Author:Danish Iftikhar
Date:7/22/2015
*/

function new_dish() {

    //alert("hello");

    var name = $("#dish_name").val()
    //alert(name);
    var datatype = "{name:'" + name + "' }";
    if (name != "") {
        $.ajax({
        type: "POST",
        url: "New_Dish.aspx/dish_name",
        data: datatype,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
        alert(response.d);
            
        location.reload();
        },
        failure: function (response) {
        alert(response.d);

            
        location.reload();
        }
        });
    }
    else {
        alert("please enter  dish name");
    }
}

function update_dish_name(val) {

    var id = $(val).attr("title");
    //alert(id);

    var text = document.getElementById(id).innerHTML;
    

    //alert(text)
    if (text == "Update") {
        var divHtml = $("#dish_" + id).html();
        //alert(text);
        
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm'  id='dish_update'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#dish_" + id).replaceWith(editableText);
        //change button text
        document.getElementById(id).innerHTML = "Save";
    }
    else {

        //alert(id);
        var name = $("#dish_update").val();
        //alert(name);
        if (name != "") {
            var datatype = "{id:'" + id + "' ,name:'" + name + "' }";
            $.ajax({
                type: "POST",
                url: "New_Dish.aspx/update_dish_name",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);

                    location.reload();
                },
                failure: function (response) {
                    alert(response.d);


                    location.reload();
                }
            });
        }
        else {
            alert("Please enter dish name !");
        }
    
    }
}