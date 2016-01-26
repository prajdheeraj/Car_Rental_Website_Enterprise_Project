<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>


<%@ include file="header.jsp" %>

<div id="banner">



</div>
  
    <%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date,com.mongodb.WriteResult"%>

<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<% DB db = mongo.getDB("practice");%>
<% DBCollection reservations = db.getCollection("reservations");%>
<% String price_total = request.getParameter("price_total");%>
<% String res_id = request.getParameter("res_id");%>
<% String status = request.getParameter("status");%>


<% BasicDBObject updateQuery = new BasicDBObject();%>
<% updateQuery.append("$set", 
      new BasicDBObject().append("price_total", price_total).append("status", status));%>
<% BasicDBObject searchQuery = new BasicDBObject();%>
<% searchQuery.append("res_id", res_id);%>
<% reservations.updateMulti(searchQuery, updateQuery);%>
<% %>
reservation details updated

<%@ include file="footer.jsp" %>
</body>
</html>