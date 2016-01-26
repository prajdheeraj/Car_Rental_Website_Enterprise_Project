<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>


<%@ include file="header.jsp" %>

<div id="banner">



</div>
  

<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.io.IOException,java.io.PrintWriter,javax.servlet.RequestDispatcher,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.*,java.text.*,java.util.*,javax.servlet.*,java.util.Date"%>
<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>

<% String productID = ""; %>
<% String res_id = request.getParameter("myradio"); %>
<% DB db = mongo.getDB("practice");%>
<% DBCollection reservations = db.getCollection("reservations");%>
<% BasicDBObject whereQuery = new BasicDBObject();%>
<% whereQuery.put("res_id", res_id);%>
<% DBCursor cursor = reservations.find(whereQuery);%>
<% BasicDBObject obj1 = (BasicDBObject) cursor.next();%>
<% BasicDBObject query = new BasicDBObject();%>
<% query.append("res_id", res_id);%>
<% reservations.remove(query);%>

<p> Reservation details deleted. </p>




<%@ include file="footer.jsp" %>
</body>
</html>