<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>


<%@ include file="header.jsp" %>

<div id="banner">



</div>
  

<table border = 1>
	<th>Car category</th>
	<th>Car name</th>
	<th> Start date </th>
	<th> End date </th>
	<th> Price </th>
	<th> Edit </th>

<% String res_id = request.getParameter("res_id"); 
String carCategory = request.getParameter("carCategory"); 
String car_name = request.getParameter("car_name"); 
String start_date_string = request.getParameter("start_date_string"); 
String end_date_string = request.getParameter("end_date_string"); 
String price_total = request.getParameter("price_total"); 

%>

<tr>
<form method="post" action = "createReservation">
	<tr>
	
	<input type = "text" name = "res_id" value = "<%= res_id%>"/>	
	<td><input type = "text" name = "carCategory" value = "<%= carCategory%>"/></td>
	<td><input type = "text" name = "car_name" value = "<%= car_name%>"/></td>
	<td><input type = "text" name = "start_date_string" value = "<%= start_date_string%>"/></td>
	<td><input type = "text" name = "end_date_string" value = "<%= end_date_string%>"/></td>
	<td><input type = "text" name = "price_total" value = "<%= price_total%>"/>	</td>

	<td width= 10%> <input type="submit" value="Edit this reservation"></td>
	</form>	
</tr>


</table>

<%@ include file="footer.jsp" %>
</body>
</html>