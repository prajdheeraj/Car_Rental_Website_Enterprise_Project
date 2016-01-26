<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
  <div id="header">
    <div id="site_title"> CarZ Rentals </div>
  </div>

<body>
<%@ include file="header2.jsp" %>
</div>

    <div id="banner">
    </div>
  


<div id="content">
    <div id="content_right">
      <div class="content_right_section_01">
<form method="post" action="category_selection.jsp">
  Start Date:
  <input type="date" name="startDate" required>
  <input type = "time" name = "startTime" required><br><br>
  End Date: 
  <input type="date" name="endDate" required>
  <input type = "time" name = "endTime" required>
  <br><br>
  <input type="submit">
</form>        
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
