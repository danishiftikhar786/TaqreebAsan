/*
Author=Danish iftikhar
date =03/02/2015
*/

//call function on default page load///////////used for to check missing data
/*$(window).load(function () {
    //getting value from page
    var username = $("#ContentPlaceHolder1_name_sp").html();
    if (check_hall_charges(username)) {
        alert("data missing");
    }
    else {
        //alert("data not issing");
    }


});

*/

//function to check for data of hall charges
function check_hall_charges(sp_id) {

    var datatype = "{sp_email:'" + sp_id + "'}";
    var message = false;
    $.ajax({
        type: "POST",
        url: "Default.aspx/check_charges",
        data: datatype,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //x = JSON.stringfy(datatype);
        success: function (response) {
            message = response.d;
            // hall information is missing promt to enter hall information
            if (message == "no") {
              //generate run time link
        var divHtml = $("#message").html();
        // create a dynamic textarea
        var editableText = $("<a  href='#' class='warning h1'>Profile Incomplete Some Information missing!</a>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the  input type 
        $("#message").replaceWith(editableText);
                           }
            else {


                
            }

        },
        failure: function (response) {

        }
    });

    

}
//function to check for  location in provided or not
function check_location(sp_id) {


}
//function to check weather dishes are provided or not
function check_dishes(sp_id) {


}