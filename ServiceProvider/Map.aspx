<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/Admin_serviceprovider.master" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="ServiceProvider_Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <!--your location on map -->
<asp:Label runat="server" ID="sp_id" ClientIDMode="Static" CssClass="hidden"></asp:Label>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
    /*code to get geo location of user*/
    var long;
    var lat;
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function showPosition(position) {
        document.getElementById("long").innerHTML = position.coords.latitude;
        document.getElementById("lat").innerHTML = position.coords.longitude;


    } 





    function initialize() {
        getLocation();
        var x = document.getElementById("long").innerHTML;
        var y = document.getElementById("lat").innerHTML;
        var mapProp = {
            center: new google.maps.LatLng(x, y),
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);


        //set marker on location///////////
        var myCenter = new google.maps.LatLng(x,y);
        marker = new google.maps.Marker({
            position: myCenter,
            draggable: true,
            icon: '../website_images/map-icon-mallorca-hotel-large.png'
            //animation: google.maps.Animation.BOUNCE
        });
        marker.setMap(map);
        //show tag on marker
        var infowindow = new google.maps.InfoWindow({
            content: " Drag mark to you accurate position!"
        });
        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
        });
        google.maps.event.addListener(marker, 'dragend', function () {

            long = marker.position.lng();
            lat = marker.position.lat();
            document.getElementById("long").innerHTML = long;
            document.getElementById("lat").innerHTML = lat;

            //alert(long);

        });



    }
    google.maps.event.addDomListener(window, 'load', initialize);

    function save_location() {
      long=  document.getElementById("long").innerHTML ;
       lat= document.getElementById("lat").innerHTML ;

        var sp_id = $("#sp_id").html();
        var datatype = "{lat:'" + long + "' ,lon:'" +lat +"',id:'" + sp_id + "'}";
        $.ajax({
            type: "POST",
            url: "Map.aspx/save_location",
            data: datatype,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                //alert(response.d);
                $("#message").html(response.d);
            },
            failure: function (response) {
                //alert(response.d);
                $("#message").html("Failed!");
            }
        });
    }


</script>
<p id="long" class="hidden" >33.729388199999995</p>
<p id="lat" class="hidden" >73.0931461</p>
       <div class=" panel panel-primary">
       <div class="panel-heading><i class="fa fa-fw fa-globe"></i><h4>Make your self avalible at TaqreebAsan Map</h4></div>
       <p>Your location on map will help your client  to find you easily in your area!<input type=button align="left" value="Mark Location" title="Location Mark" class="btn  btn-success" onclick="save_location()" /></p>
       <p id="message" class="label-success"></p>
       <div class="panel panel-default"
             <div style="width:1100px; padding-left:10px; height:500px" id="googleMap"></div>
       

        
 </div>
       </div>
</asp:Content>

