<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%@ include file="header.jsp" %>

<div id="banner">
</div>
<div id="Page Heading">
<br>
<center><h1><b>Registration Page </h1></b><center>
</div>
<div>
  <form method="get" action="customer_create_account">
  <input type="text" name="name" placeholder="Enter name"/><br><br><br>
  <input type="text" name="username" placeholder="Enter username "/><br><br><br>
  <input type="password" name="password" placeholder="Enter Password "/><br><br><br>
  <input type="submit" value="Register"/><br><br><br>
</form>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>