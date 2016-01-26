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
	<th>Deal Code</th>
	<th>Deal Title</th>
	<th>Deal Percent</th>
	<th>Deal description</th>
	<th> Action </th>


<% DB db = mongo.getDB("practice");%>
<% DBCollection deals = db.getCollection("deals");%>
<% BasicDBObject dbObject=new BasicDBObject();%>

<% List cl1= deals.distinct("dealCode", dbObject);%>

<% BasicDBObject whereQuery = new BasicDBObject();%>
<% for(int i = 0; i<cl1.size(); i++){%>
<% whereQuery.put("dealCode", (String)cl1.get(i));%>
<% DBCursor cursor1 = deals.find(whereQuery); %>
<% BasicDBObject obj = (BasicDBObject) cursor1.next(); %>
<% 
String dealCode = obj.getString("dealCode");
String dealTitle = obj.getString("dealTitle"); 
String dealPercent = obj.getString("dealPercent"); 
String dealDescription = obj.getString("dealDescription"); 
 %>

<tr>
<form method="post" action = "deleteDeal1.jsp">
	<td width = 3%> <input type="radio" name="dealCode" value="<%= dealCode %>" required/></td>
	<td><%= dealCode%></td>
	<td> <%= dealTitle%></td>
	<td> <%= dealPercent%></td>
	<td> <%= dealDescription%></td>			
	<input type = "hidden" name = "dealTitle" value = "<%= dealTitle%>"/>
	<input type = "hidden" name = "dealPercent" value = "<%= dealPercent%>"/>
	<input type = "hidden" name = "dealDescription" value = "<%= dealDescription%>"/>
	<input type = "hidden" name = "dealCode" value = "<%= dealCode%>"/>
		

	<td width= 10%> <input type="submit" value="Delete this deal">
	</form>	
</tr>


<% }%>
</table>

<%@ include file="footer.jsp" %>
</body>
</html>