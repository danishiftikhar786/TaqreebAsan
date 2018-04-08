/*
Author :Danish Iftikhar
Date 20/06/2015
Day Saturday
*/

function subscribe() {

    var email = $("#newsletters").val();
    //alert(email);
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (regex.test(email)) {

        alert("call1");
        //ajax call to save emaill address
        var datatype = "{email:'" + email + "' }";
        $.ajax({
            type: "POST",
            url: "MasterPage.master/subscribe",
            data: datatype,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
                // $("#success").html(response.d);
                //document.getElementById("na").innerHTML = "updated";
                //location.reload();
            },
            failure: function (response) {
                //alert(response.d);
                //location.reload();
                //$("#error").html("Error!");
            }
        });
        
    }
    else {

        document.getElementById("mes1").innerHTML = "Invalid Email Address!";
    }

}