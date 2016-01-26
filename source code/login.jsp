<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>


<%@ include file="header.jsp" %>

<div id="banner">



</div>
  
<form method="post" action="Login">
	<br>

  <h2>Please login to view any functionality. If you do not wish to sign up, login as a guest. </h2>	
  <input type="text" name="userName" placeholder="username"/><br><br>
  <input type="password" name="password" placeholder="pssword"/><br><br>

  <input type="submit" value="Login">
</form>
<p><a href="customer_create_account.jsp">New User? Register here</a></p>
<p><a href="setSessionGuest.jsp">Login as a guest. </a></p>

<%@ include file="footer.jsp" %>
</body>
</html>