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
	<th>User Name</th>
	<th>Name</th>
	<th> Password </th>
	<th> New password </th>
	<th> New password again </th>
	<th> Action </th>


<% DB db = mongo.getDB("practice");%>
<% DBCollection loindet = db.getCollection("loindet");%>
<% BasicDBObject dbObject=new BasicDBObject();%>

<% String username = (String)(session.getAttribute("sUserName"));%>

<% BasicDBObject whereQuery = new BasicDBObject();%>

<% whereQuery.put("username", username);%>
<% DBCursor cursor1 = loindet.find(whereQuery); %>
<% BasicDBObject obj = (BasicDBObject) cursor1.next(); %>
<% 
String name = obj.getString("name"); 
String password = obj.getString("password"); 
 %>

<tr>
<form method="post" action = "editProfile1.jsp">
	<td><%= username%></td>
	<td> <input type = "text" name = "name" value = "<%= name%>"/></td>
	<td> <input type = "text" name = "password" value = "<%= password%>" readonly/></td>
	<td> <input type = "password" name = "password1" /></td>
	<td> <input type = "password" name = "password2"/></td>			
	
		

	<td width= 10%> <input type="submit" value="Modify this account details">
	</form>	
</tr>



</table>

<%@ include file="footer.jsp" %>
</body>
</html>