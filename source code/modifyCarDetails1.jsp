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
<% DBCollection cars = db.getCollection("cars");%>
<% String car_category = request.getParameter("car_category");%>
<% String car_id = request.getParameter("car_id");%>
<% String car_name = request.getParameter("car_name");%>
<% String car_Price = request.getParameter("car_Price");%>
<% String car_desc = request.getParameter("car_desc");%>


<% BasicDBObject updateQuery = new BasicDBObject();%>
<% updateQuery.append("$set", 
      new BasicDBObject().append("car_category", car_category).append("car_name", car_name).append("car_Price", car_Price).append("car_desc", car_desc));%>
<% BasicDBObject searchQuery = new BasicDBObject();%>
<% searchQuery.append("car_id", car_id);%>
<% cars.updateMulti(searchQuery, updateQuery);%>
<% %>
Car details updated

<%@ include file="footer.jsp" %>
</body>
</html>