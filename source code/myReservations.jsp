<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>


<%@ include file="header2.jsp" %>

<div id="banner">



</div>
  
<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<table border = 1>
	<th>Select</th>
	<th> Car category </th>
	<th> Car name </th>
	<th> From </th>
	<th> To </th>
	<th> Total </th>
	<th> Status </th>


<% String userName = (String)(session.getAttribute("sUserName")); %>
<% DB db = mongo.getDB("practice");%>
<% DBCollection reservationsNew = db.getCollection("reservations");%>
<% BasicDBObject dbObject=new BasicDBObject();%>
<% dbObject.append("userName",userName);%>

<% List cl1= reservationsNew.distinct("res_id", dbObject);%>

<% BasicDBObject whereQuery = new BasicDBObject();%>
<% for(int i = 0; i<cl1.size(); i++){%>
<% whereQuery.put("res_id", (String)cl1.get(i));%>
<% DBCursor cursor1 = reservationsNew.find(whereQuery); %>
<% BasicDBObject obj = (BasicDBObject) cursor1.next(); %>
<% 
String reservation_id_temp = obj.getString("res_id");
String car_category = obj.getString("carCategory"); 
String car_name = obj.getString("car_name"); 
String start_date_string = obj.getString("start_date_string"); 
String end_date_string = obj.getString("end_date_string"); 
String price_total = obj.getString("price_total"); 
String status = obj.getString("status"); 
 %>

<tr>
<form method="post" action = "cancelReservation1.jsp">
	<td width = 3%> <input type="radio" name=myradio value="<%= reservation_id_temp %>" required/></td>
	<td> <%= car_category%></td>
	<td> <%= car_name%></td>
	<td> <%= start_date_string%></td>
	<td> <%= end_date_string%></td>			
	<td> <%= price_total%></td>
	<td> <%= status%></td>	
	<td width= 10%> <input type="submit" value="Cancel this reservation">
	</form>	
</tr>


<% }%>
</table>

<%@ include file="footer.jsp" %>
</body>
</html>