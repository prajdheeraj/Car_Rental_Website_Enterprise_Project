<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>


<%@ include file="manager_header.jsp" %>

<div id="banner">
	



</div>
  <%@ include file="leftNav.jsp" %>
<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<table border = 1>
	<th>Select</th>
	<th>Car ID</th>
	<th> Car category </th>
	<th> Car name </th>
	<th> Price per day </th>
	<th> Description </th>
	<th> Action </th>


<% DB db = mongo.getDB("practice");%>
<% DBCollection cars = db.getCollection("cars");%>
<% BasicDBObject dbObject=new BasicDBObject();%>

<% List cl1= cars.distinct("car_id", dbObject);%>

<% BasicDBObject whereQuery = new BasicDBObject();%>
<% for(int i = 0; i<cl1.size(); i++){%>
<% whereQuery.put("car_id", (String)cl1.get(i));%>
<% DBCursor cursor1 = cars.find(whereQuery); %>
<% BasicDBObject obj = (BasicDBObject) cursor1.next(); %>
<% 
String car_id = obj.getString("car_id");
String car_category = obj.getString("car_category"); 
String car_name = obj.getString("car_name"); 
String car_Price = obj.getString("car_Price"); 
String car_desc = obj.getString("car_desc"); 
 %>

<tr>
<form method="post" action = "deleteCar1.jsp">
	<td width = 3%> <input type="radio" name="car_id" value="<%= car_id %>" required/></td>
	<td><%= car_id%></td>
	<td> <%= car_category%></td>
	<td> <%= car_name%></td>
	<td> <%= car_Price%></td>
	<td> <%= car_desc%></td>			
	<input type = "hidden" name = "car_category" value = "<%= car_category%>"/>
	<input type = "hidden" name = "car_name" value = "<%= car_name%>"/>
	<input type = "hidden" name = "car_Price" value = "<%= car_Price%>"/>
	<input type = "hidden" name = "car_desc" value = "<%= car_desc%>"/>
		

	<td width= 10%> <input type="submit" value="Delete this car">
	</form>	
</tr>


<% }%>
</table>

<%@ include file="footer.jsp" %>
</body>
</html>