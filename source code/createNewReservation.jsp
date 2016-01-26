<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>


<%@ include file="salesman_header.jsp" %>

<div id="banner">



</div>
<%@ include file="SmLeftNav.jsp" %>
  
<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<table border = 1>
	<th>Select</th>
	<th> UserName </th>
	<th> Submit </th>


<% DB db = mongo.getDB("practice");%>
<% DBCollection loindet = db.getCollection("loindet");%>
<% BasicDBObject dbObject=new BasicDBObject();%>

<% List cl1= loindet.distinct("username", dbObject);%>

<% BasicDBObject whereQuery = new BasicDBObject();%>
<% for(int i = 0; i<cl1.size(); i++){%>
<% whereQuery.put("username", (String)cl1.get(i));%>
<% DBCursor cursor1 = loindet.find(whereQuery); %>
<% BasicDBObject obj = (BasicDBObject) cursor1.next(); %>
<% 
String username = obj.getString("username");
String password = obj.getString("password"); 
 %>

<tr>
<form method="post" action = "setSession.jsp">
	<td width = 3%> <input type="radio" name=userName value="<%= username %>" required/></td>
	<td width = 30%> <%= username%></td>
	<input type="hidden" name = "password" value="<%= password%>"/>

	<td width= 10%> <input type="submit" value="Create reservation for this user"/>
	</form>	
</tr>


<% }%>
</table>

<%@ include file="footer.jsp" %>
</body>
</html>