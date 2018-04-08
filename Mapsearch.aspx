<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Mapsearch.aspx.cs" Inherits="Mapsearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
var markers = [
<asp:Repeater ID='data' runat='server'>
<ItemTemplate>
            {
            "title": '<%# Eval("sp_name") %>',
            "lat": '<%# Eval("logitude") %>',
            "lng": '<%# Eval("latitude") %>',
            "description": '<%# Eval("website") %>'
        }
</ItemTemplate>
<SeparatorTemplate>
    ,
</SeparatorTemplate>
</asp:Repeater>

];
</script>
<script type="text/javascript">
    window.onload = function () {
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                icon: 'website_images/map-icon-mallorca-hotel-large.png',
                url: 'Profile.aspx?name='+data.title,
                title: data.title
            });
            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                    var win = window.open('Profile.aspx?name='+data.title, '_blank');
                    win.focus();
                });
            })(marker, data);
        }
    }
</script>
<div id="dvMap" style="width: 1300px; height: 500px">
</div>

</asp:Content>

