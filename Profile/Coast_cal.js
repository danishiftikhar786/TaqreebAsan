var total_coast = 0;
var menu_coast = 0;
var min_person = 1;
var hall_charge = 0;
var service_charge = 0;
var dishes_coast = 0;

function show_total() {

    //alert(total_cost);
    //alert(min_person);
    hall_charge = $("#hall_charges").html();
    //alert(hall_charge);
   $("#amount").text(((total_coast+ +menu_coast)*min_person)+ +hall_charge );
}

//total person change event
function persons() {

    var people = $("#tp").val();
    //alert(people);
    min_person=people;
    show_total();
}


//function to add dish cost
function dish_check(id) {
    var people = $("#tp").val();
    if (people != "") {
        var d_id = ($(id).attr('id'));
        var if_check = document.getElementById(d_id);
        var per_head = $(id).attr('title')
        if (if_check.checked) {
            var temp = +total_coast + +per_head;
            total_coast = temp;
            show_total();

            //alert("checked");
        }
        else {
            var temp = +total_coast - +per_head;
            total_coast = temp;
            show_total();

            // alert("unchecked");
        }
    }
    else {
        alert("Please Mention Guest count first");
    }
    
}

function cost_menu(id) {
var people = $("#tp").val();
if (people != "") {
    var m_id = $("select").val();
    var per_head = $("#menu").find("option:selected").attr("perhead");
    $("#m_p").text(per_head);
    menu_coast = per_head;
    show_total();
}
else {
    //alert("Please Mention Guest count first");
}
}