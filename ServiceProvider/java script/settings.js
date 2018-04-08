/*
Author=Danish iftikhar
date =03/02/2015
*/


// function to chnage name//////////////////////////////////////////
function change_name() {
    //alert("called");
    var text = document.getElementById("na").innerHTML;
   // alert(text);
    if (text == "Edit") {
      //  alert(text);
        var divHtml = $("#Name").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='name_change'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#Name").replaceWith(editableText);
        //change button text
        document.getElementById("na").innerHTML = "Save";
    }
    else {

        //alert("hello ");
        var a = $("#bd").html();
       // alert(a);
        var ab = $("#name_change").val();
        //alert(ab);
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,name:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_name",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    // $("#success").html(response.d);
                    document.getElementById("na").innerHTML = "updated";
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }


    }

}
//////////////////////////////////////////// function to change address ////////////////////////////////////
function change_mail_address() {
    var text = document.getElementById("mail").innerHTML;

    if (text == "Edit") {
        //alert(text);
        var divHtml = $("#email").html();
       // alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='mail_change'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#email").replaceWith(editableText);
        //change button text
        document.getElementById("mail").innerHTML = "Save";
    }
    else {

        //alert("hello ");
        var a = $("#bd").html();
        var ab = $("#mail_change").val();
        //alert(ab);
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,email:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_mail_Address",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    document.getElementById("mail").innerHTML = "updated";
                    location.reload();
                    //alert(response.d);
                    // $("#success").html(response.d);
                },
                failure: function (response) {
                    location.reload();
                    //alert(response.d);
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }
    }
}


//////////////////////////////funciton to chnage hall capacity///////////////////////////////////
function change_capacity() {
    var text = document.getElementById("cap").innerHTML;

    if (text == "Edit") {
        //alert(text);
        var divHtml = $("#capacity").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='capcityie'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#capacity").replaceWith(editableText);
        //change button text
        document.getElementById("cap").innerHTML = "Save";
    }
    else {

        // alert("hello ");
        var a = $("#bd").html();
        var ab = $("#capcityie").val();
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,capcity:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_capacity",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    document.getElementById("cap").innerHTML = "Updated";
                    location.reload();
                    // $("#success").html(response.d);
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }
    }
}


////////////////////////////////////////function to change web url////////////////////////////////////////////////////
function web_url() {
    var text = document.getElementById("web").innerHTML;

    if (text == "Edit") {
        //alert(text);
        var divHtml = $("#website").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='url_web'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#website").replaceWith(editableText);
        //change button text
        document.getElementById("web").innerHTML = "Save";
    }
    else {

        //alert("hello ");
        var a = $("#bd").html();
        var ab = $("#url_web").val();
        //alert(ab);
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,url:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_web_url",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    document.getElementById("web").innerHTML = "Updated";
                    location.reload();
                   
                    // $("#success").html(response.d);
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }
    }
}


///////////////////////////////////////////fucntion to change password///////////////////////////////S
function change_address() {
    var text = document.getElementById("add").innerHTML;

    if (text == "Edit") {
        //alert(text);
        var divHtml = $("#address").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='change_address'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#address").replaceWith(editableText);
        //change button text
        document.getElementById("add").innerHTML = "Save";
    }
    else {
        //alert("hello ");
        var a = $("#bd").html();
        var ab = $("#change_address").val();
        //alert(ab);
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,address:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_address",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                   // $("#success").html(response.d);
                    document.getElementById("add").innerHTML = "Updated";
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }
    }

}



///////////////////////////////////////////////////function to change password//////////////////////////////////
function change_password() {

    var text = document.getElementById("a1").innerHTML;

    if (text == "Change") {
        //alert(text);
        var divHtml = $("#pass").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='password' class='form-control input-sm' placeholder='old password' id='old'/></br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;New Password :<input type='password' id='new1'/></br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;Confirm Password<input type='password' id='new2'/>");
        // fill the textarea with the div's text
        editableText.val("");
        // replace the div with the textarea
        $("#pass").replaceWith(editableText);
        //change button text
        document.getElementById("a1").innerHTML = "Save";
    }
    else {
        var a=$("#old").val();
        var a1 = $("#new1").val();
        var a2 = $("#new2").val();
        if ($("#new1").val().length == 0 || $("#old").val().length == 0 || $("#new2").val().length == 0) {
            alert("Please fill all password fields");
        }
        else {
            var ab = $("#bd").html();
            var datatype = "{id:'" + ab + "' ,p1:'" + a + "',p2:'" + a1 + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_Password",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    document.getElementById("a1").innerHTML = "Changed";
                    location.reload();
                   // $("#success").html(response.d);
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
           

        
        }
       
    }
}

//function to change single hall charges/////////////////////////////////////////
function charge_change() {

    //alert("change");
    var text = document.getElementById("A2").innerHTML;

    if (text == "Edit") {
        //alert(text);
        var divHtml = $("#hall_charges").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='change_charges'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#hall_charges").replaceWith(editableText);
        //change button text
        document.getElementById("A2").innerHTML = "Save";
    }
    else {

        // alert("hello ");
        var a = $("#bd").html();
        var ab = $("#change_charges").val();

        alert(ab);
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,charges:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_single_hallcharges",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    // $("#success").html(response.d);
                    document.getElementById("A2").innerHTML = "Updated";
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }
    }


}

//function to change text about us//////////////////////
function about_us() {
    //alert("about_us");
    var text = document.getElementById("A3").innerHTML;

    if (text == "Edit") {
        //alert(text);
        var divHtml = $("#about_us").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' class='form-control input-sm' id='change_about_us'/>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#about_us").replaceWith(editableText);
        //change button text
        document.getElementById("A3").innerHTML = "Save";
    }
    else {

        // alert("hello ");
        var a = $("#bd").html();
        var ab = $("#change_about_us").val();

       // alert(ab);
        if (ab.length > 0) {
            var datatype = "{id:'" + a + "' ,data:'" + ab + "'}";
            $.ajax({
                type: "POST",
                url: "Setting.aspx/update_about_us",
                data: datatype,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    // $("#success").html(response.d);
                    document.getElementById("A3").innerHTML = "Updated";
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);
                    location.reload();
                    //$("#error").html("Error!");
                }
            });
        }
        else {
            alert("please  fill field");
        }
    }



}