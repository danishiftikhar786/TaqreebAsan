/*
Author:Danish Iftikhar
Date :7/21/2015
*/

///////////////////////////////////////////////////function to change password//////////////////////////////////
function change_password() {

    var text = document.getElementById("a1").innerHTML;

    if (text == "Change") {
        //alert(text);
        var divHtml = $("#pass").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='password' class='form-control input-sm' placeholder='old password' id='old'/></br>New Password :<input type='password' id='new1'/></br>Confirm Password<input type='password' id='new2'/>");
        // fill the textarea with the div's text
        editableText.val("");
        // replace the div with the textarea
        $("#pass").replaceWith(editableText);
        //change button text
        document.getElementById("a1").innerHTML = "Save";
    }
    else {
        var a = $("#old").val();
        var a1 = $("#new1").val();
       // var a2 = $("#new2").val();
        if ($("#new1").val().length == 0 || $("#old").val().length == 0 || $("#new2").val().length == 0) {
            alert("Please fill all password fields");
        }
        else {
            var ab = $("#id").html();
            alert(ab);
            var datatype = "{id:'" + ab + "' ,p1:'" + a + "'}";
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