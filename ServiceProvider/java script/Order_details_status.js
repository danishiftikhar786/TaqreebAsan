/*
Author Danish Iftikhar
Date 29-04-2015
*/


//function used to change status of order from
function change_status() {



    var text = document.getElementById("status").innerHTML;

    //alert(text);
    if (text == "new") {
        //alert(text);
        var divHtml = $("#status").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<Select id='status' onchange='getval(this);'  ><option>new</option><option>Cancle</option><option>Confirm</option><Select>");
        // fill the textarea with the div's text
        editableText.val(divHtml);
        // replace the div with the textarea
        $("#status ").replaceWith(editableText);
        //change button text
        document.getElementById("change").innerHTML = "Change";
    }
    else {

        alert("Only new Booking Request Can be Changed");
    
    }

}

//function to get value of change event
function getval(val) {

    var s_value = val.value;
    var b_id = $("#booking_pin").html();
    //alert(val.value);
    //make ajax call for status update change
    var datatype = "{s:'" + s_value + "' ,b_id:'" + b_id + "'}";
    $.ajax({
        type: "POST",
        url: "Detail.aspx/update_status",
        data: datatype,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //alert(response.d);
            $("#success").html(response.d);
            //document.getElementById("na").innerHTML = "updated";
            location.reload();
        },
        failure: function (response) {
            //alert(response.d);

            $("#error").html("Error!");
            location.reload();
        }
    });


}

var p_count;
//function to change guest count  from order details
function change_count() {
    //alert("count_change");

    var text = document.getElementById("count_c").innerHTML;

   // alert(text);
    //alert(text);
    if (text == "Change") {
        //alert(text);
        var divHtml = $("#guest").html();
        //alert(divHtml);
        // create a dynamic textarea
        var editableText = $("<input type='text' id='g_count'  />");
        // fill the textarea with the div's text
        editableText.val(divHtml);

        document.getElementById("count_c").innerHTML = "Save";
        // replace the div with the textarea
        $("#guest ").replaceWith(editableText);
        //change button text
        document.getElementById("change").innerHTML = "Change";
        p_count = divHtml;
        }
        else {
        //if person decreases in invoice
       // alert(p_count);
        var u_count =$("#g_count").val();
        //alert(u_count);
        if (u_count>p_count ) {


        //if new guest entered are greater than previuos count
            //p_count = p_count - u_count;
            var g_total = $("#charges").html();
          //  alert(g_total);
            //checking for previous grand total

            //excluding hall charges from  grand total
            var hall_charges = $("#hall_rent").html();

            //again calculating grand total
            g_total = (g_total-hall_charges);
            //alert(g_total);
            //alert(u_count);

            //calculating grand total
            g_total =( (g_total/p_count)*u_count);

            var order_id = $("#booking_pin").html();

            update_guest_count(order_id, g_total, u_count);

            //alert("grand _ total=" +g_total);

        }
        else {

            //if new guest entered are greater than previuos count
           // p_count = p_count - u_count;
            var g_total = $("#charges").html();
            //alert(g_total);
            //checking for previous grand total

            //excluding hall charges from  grand total
            var hall_charges = $("#hall_rent").html();

            //again calculating grand total
            g_total = (g_total - hall_charges);
            //alert(g_total);
            //alert(u_count);

            //calculating grand total
            g_total = ((g_total / p_count) * u_count);


            var order_id = $("#booking_pin").html();

            update_guest_count(order_id, g_total, u_count);
         

          }
       

         }
}



//issue ajax call for to update guest count

 function update_guest_count(order_id, g_t, new_count) {

    


     var datatype = "{id:'" +order_id + "' ,g_total:'" + g_t + "',g_count:'" + new_count + "'}";
     $.ajax({
         type: "POST",
         url: "Detail.aspx/update_guest_count",
         data: datatype,
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         success: function (response) {
             //alert(response.d);
             $("#success").html(response.d);
             //document.getElementById("na").innerHTML = "updated";
             location.reload();
         },
         failure: function (response) {
             //alert(response.d);

             $("#error").html("Error!");
             location.reload();
         }
     });



 }


 /////////function to change hall rent/////////////////////////////////

 function update_hall_rent() {
     //alert("hall_rent");

     var text = document.getElementById("a5").innerHTML; 

     //alert(text);
     
     if (text == "Change") {

         //generate run time textfield
         var divHtml = $("#hall_rent").html();
         // create a dynamic textarea
         var editableText = $("<input type='text' class='input-md' id='change_rent'/>");
         // fill the textarea with the div's text
         editableText.val(divHtml);
         // replace the div with the  input type 
         $("#hall_rent").replaceWith(editableText);

         document.getElementById("a5").innerHTML = "Save";


     }
     else {

         var rent = $("#change_rent").val();
         var order_id = $("#booking_pin").html();
     if (rent != "") {

         var datatype = "{id:'" + order_id + "' ,charges:'" + rent+ "'}";
         $.ajax({
             type: "POST",
             url: "Detail.aspx/update_hall_charges",
             data: datatype,
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (response) {
                 //alert(response.d);
                 //$("#success").html(response.d);
                 //document.getElementById("na").innerHTML = "updated";
                 location.reload();
             },
             failure: function (response) {
                 alert(response.d);

                 //$("#error").html("Error!");
                 location.reload();
             }
         });




     }
     else {
         alert("please enter valid hall rent");
     }
     }

 }
