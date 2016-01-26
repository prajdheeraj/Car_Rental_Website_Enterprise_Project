<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script
src="http://maps.googleapis.com/maps/api/js">
</script>
<script>
var myCenter1=new google.maps.LatLng(41.834286,-87.623804);
var myCenter2=new google.maps.LatLng(41.778655,-88.096270);

function initialize()
{
var mapProp = {
  center:myCenter1,
  center:myCenter2,
  zoom:9,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker1=new google.maps.Marker({
  position:myCenter1,
  });


marker1.setMap(map);
marker2.setMap(map);

var infowindow1 = new google.maps.InfoWindow({
  content:"Location A "
  });


infowindow1.open(map,marker1);

}
google.maps.event.addDomListener(window, 'load', initialize);
</script>
<style>
th, td{
  padding : 15px
  }
</style>
<body>
<%@ include file="header2.jsp" %>
</div>
    <div id="banner">
    </div> 
        <aside class="sidebar">
        
          <div id="content_left">
          <div class="right_column_section">
            <h4><div id="Search">
            
            </div>
            <%@ include file="home_nav.jsp" %>
    </aside>
    <div id="content">
    <div id="content_right">
       <div class="content_right_section_01">
        <center><h1>Locations</h1></center>
        <center><table border="4" ;allign="center">
       <th> Chicago: </th>
          <tr>
          <td>
          Location A: <br>
          3300 S Federal St, Chicago, IL 60616
          </td>
          </tr>
          
        </table></center></br>
        <center><div id="googleMap" style="width:500px;height:300px;"></div></center>
    </div>
<div id="map"> </div>

    <div class="cleaner">&nbsp;</div>
  </div>
  </div>
     <%@ include file="footer.jsp" %>
</body>
</html>
 


