// js for marriage hall booking
var selected = new Array();
var d_perheads = new Array();
var client_data = new Array();
function show_date_picker() {

    var divHtml = $("#date_panel").html();
    //show infoation form  filling
    $("#info_form").css('visibility', 'visible');
    // create a dynamic textarea
    var editableText = $("<b>Function Date:</b> <input   class='input-sm' type='text' id='datepicker'><script>    var dateToday = new Date();    $(function () {        $('#datepicker').datepicker( { minDate: dateToday });});</script>");
    // fill the textarea with the div's text
    editableText.val(divHtml);
    // replace the div with the textarea
    $("#date_panel").replaceWith(editableText);
    document.getElementById("b_text").innerHTML = "Confirm Booking";

    var text = document.getElementById("b_text").innerHTML;
    if (text == "Confirm Booking") {

    //check for button text and  call booking function
        make_call_booking();

    }

}

//fucntion for form validation
function validate_for_data() {
    var temp = false;

    var user_name = $("#user_name").val();
    var f_time = jQuery("#e_timing option:selected").val(); 
    var f_type = jQuery("#e_type option:selected").val(); 
    var name = $("#c_name").val();
    var email_address = $("#email").val();
    var cnic = $("#cnic").val();
    var phone_number = $("#phone").val();
    //checking for event type is not equal to zero
    if (f_time !== null && f_time !== "0") {

        temp = true;
        //client_data.push(user_name);
    }
    else {
        alert("Mention Event Type");
        temp = false;

    }
    //checking for event time is not equal to zero
    if (f_type !== null && f_type !== "0") {

        temp = true;
        //client_data.push(user_name);
    }
    else {
        alert("Mention Event Time");
        temp = false;

    }

    //checking for username field is not empty
    if (user_name !== null && user_name !== "") {

        temp = true;
        //client_data.push(user_name);
    }
    else {
        alert("Enter User Name");
        temp = false;
    }

    //checking for name field is not empty
    if (name !== null && name !== "") {

        temp = true;
        //client_data.push(name);
    }
    else {
        alert("Enter Your Name");
    }
    //checking for email_address field is not empty
    if (email_address !== null && email_address !== "") {

        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (regex.test(email_address)) {
            temp = true;
            //client_data.push(email_address);
        }
        else {
            alert("email address invalid");
            //$("#email").attr('class', 'input input-sm');
            temp = false;
        }

    }
    else {
    }
    //checking for email_address field is not empty
    if (cnic !== null && cnic !== "") {

        temp = true;
        //client_data.push(cnic);
    }
    else {
        //error message for cnic
        temp = false;
        alert("Cnic is compulsary");

    }
    //checking for phone number validating
    if (phone_number !== null && phone_number !== "") {

        temp = true;
        //client_data.push(phone_number);
    }
    else {
        temp = false;
        alert("Phone Number is compulsary");
    }

    return temp;
}



//function to make ajax call for booking
/*function make_call_booking()
{

    var persons = $("#tp").val();
    var menu_id;
    alert("asdas");
    var menu_perhead;
    //checking for weather persons are in numbers
    if ($.isNumeric($("#tp").val())) {

        //alert("true");
        //alert(selected);

        //get  selected menu and selected dishes
        menu_id = jQuery("#menu option:selected").val();

        if (menu_id == 0) {
            alert(menu_id);
        }
        else {

            menu_perhead = $("#menu").find("option:selected").attr("perhead");
            //alert(menu_perhead);
        }

        var dt = $("#datepicker").val();
        var people = $("#tp").val();
      // alert($("#amount").html());
        if (dt != "") {

            //var c_id = $("#ContentPlaceHolder1_c_id").html();
            if (validate_for_data()) {
                //pushing client data in array

                alert("data valid");       
                //pushing client email address
                client_data.push($("#email").val());
                //pushing client phone number
                client_data.push($("#phone").val());
                //pushing client cnic
                client_data.push($("#cnic").val());
                //pushing client name
                client_data.push($("#c_name").val());
                //pushing total persons in object
                client_data.push($("#tp").val());
                //alert($("#c_name").val());
                // client_data.push($("#ContentPlaceHolder1_s_id").html());
                
                //var datatype = "{menu_id:'" + menu_id + "',menu_price:'" + menu_perhead + "',dish_ids:'" + selected + "',dish_prices:'" + d_perheads + "',function_date:'" + $("#datepicker").val(); +"',client_id:'" + $("#datepicker").val(); +"',grandtotal:'" + $("#datepicker").val(); +"'}";
                var datatype = "{sp_id:'" + $("#s_id").html() + "',client_info:'" + client_data + "',menu_id:'" + menu_id + "',menu_price:'" + menu_perhead + "',dish_ids:'" + selected + "',dish_prices:'" + d_perheads + "',function_date:'" + dt + "',client_id:'" + $("#user_name").val() + "',grandtotal:'" + ($("#amount").html() - $("#hall_charges").html()) + "',totalpersons:'" + people + "',hall_rent:'" + $("#hall_charges").html() + "'}";
                $.ajax({
                    type: "POST",
                    url: "Cost_Calculator.aspx/make_booking",
                    data: datatype,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {

                        //document.getElementById("web").innerHTML = "Updated";

                        if (response.d == "0") {
                            document.getElementById("s").innerHTML = "<div id='success'  class='alert alert-success alert-dismissable'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Alert!</strong>Your Booking Request has been send please visit you mail to get  further Information.</div>";
                            
                        }
                        if (response.d == "1")
                            document.getElementById("s").innerHTML = "<div id='error1'  class='alert alert-dismissable alert-warning'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Error!</strong>User Name not Registerd Please register first.</div>";
                        if (response.d == "2")
                            document.getElementById("s").innerHTML = "<div id='error2'  class='alert alert-dismissable alert-warning'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Error!</strong>Please fill all Fields.</div>";
                    },
                    failure: function (response) {
                        alert(response.d);
                        //location.reload();
                        document.getElementById("s").innerHTML = "<div id='error2'  class='alert alert-danger alert-dismissable'><button type='button' class='close' data-dismiss='alert'  aria-hidden='true'> &times;</button><strong>Error!</strong>Error in  booking.please provide  valid data .</div>";
                    }
                });

        }
        else 
        {
            //ask for user login

            alert("Please Fill All fields ");
        }

                           }   
                                      }
    else {
        alert("Please enter total persons in number!");

    }
    
   // alert($("#ContentPlaceHolder1_s_id").html());
}*/

//function to get id of selected dishes
function slected_dishes(id) {
    var d_id = ($(id).attr('id'));
    var d_perhead = $(id).attr('title');
  //    alert(d_perhead);
    d_perheads.push(d_perhead);
  //  alert(d_perheads);
    selected.push(d_id);
   // alert(selected);


}

