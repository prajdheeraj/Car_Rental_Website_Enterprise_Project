<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@ include file="manager_header.jsp" %>
</div>

    <div id="banner">
    </div>
  
    <%@ include file="leftNav.jsp" %>


<div id="content">
    <div id="content_right">

      <div class="content_right_section_01">

      <h1>Enter deal Details</h1>
       <form method="post" action="MAddDeal">
        <table>
          <tr>
            <td>Deal title:</td>
            <td>
            <input type="text" name="dealTitle" size="24" /> 
            </td>
            <tr>

           <tr>
            <td>Deal Code:</td>
            <td>
            <input type="text" name="dealCode" size="24"  /> 
            </td>
            <tr> 

            <tr>
            <td>Deal description:</td>
            <td>
              <input type="text rows="4" cols="50"" name="dealDescription" size="24"  />                              
            </td>
            </tr>  

            <tr>
            <td>Deal percentage on all rentals:</td>
            <td>
            <input type="number" name="dealPercent"  size="5" /> 
            </td>
            <tr> 

            

            <tr>
            <td>
            <center><input type="submit" value="Add" class="formbutton" /></center> </td>
            
            </tr>
        </table>
       
        
        
      </div>
    </div>

    <!-- end of content left -->
    <div class="cleaner">&nbsp;</div>
  </div>
  <!-- end of content -->
  <center><div id="footer"> 
    <a href="#">Home</a> | <a href="#">FAQs</a> | <a href="#">Terms of use</a> | <a href="#">Privacy Policies</a> | <a href="#">Contact</a><br />
    Copyright &copy; 2015 <a href="#"><strong>CarZ Rentals</strong></a> | Designed by <a target="_blank" rel="nofollow" href="http://www.templatemo.com">Team 9</a>
  </div></center>
  <!-- end of footer -->
<!-- </div> -->
<!-- end of container -->
</body>
</html>
