//Danish Iftikhar
//Date 4/02/2015
//function to  make first page search
function redirect_search() {


    var city = $("#c1").val();
    var persons = $("#p1").val();
    var timing = $("#car").val();
    var parking = $("#timing").val();
    if (city == '- Select City -') {
        city = "0"
    }
    //    else {
    //        alert(city);
    //    }
    if (persons == '- Max Persons -') {
        persons = "0";
    }

    //    else {
    //        alert(persons);
    //    }
    if (timing == '- CarParking -') {
        timing = "0";
    }
    //    else {
    //        alert(timing);
    //    }
    if (parking == '- Avalibility -') {
        parking = "0";
    }
    //    else {
    //        alert(parking);
    //    }

    if(parking=='0'&&timing=='0'&&persons=='0'&&city=='0'){
        window.location.href = "Index";
    }
    else{
    window.location.href = "Default.aspx?cityid=" + city + "&persons=" + persons + "&parking=" + parking + "&timing=" + timing;
    }
}