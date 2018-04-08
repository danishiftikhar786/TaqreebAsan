<%@ Page Title="" Language="C#" MasterPageFile="~/Profile/Profile_m.master" AutoEventWireup="true" CodeFile="Road_map.aspx.cs" Inherits="Profile_Road_map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script
src="http://maps.googleapis.com/maps/api/js">
</script>

<div>
<label runat="server" id="longi"  clientidmode="Static" style="visibility: hidden">0.0</label>
<label runat="server" id="lat"    clientidmode="Static" style="visibility: hidden">0.0</label>
<div  id="googleMap" style="width:100%;height:100%; position:absolute;"></div>
</div>
<script>

var a=$("#longi").html();
var b=$("#lat").html();
var myCenter=new google.maps.LatLng(a,b);

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:13,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  icon: '../website_images/map-icon-mallorca-hotel-large.png',
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
  <!--your location on map -->
  
</asp:Content>

