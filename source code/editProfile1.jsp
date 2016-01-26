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
<% DBCollection loindet = db.getCollection("loindet");%>
<% String name = request.getParameter("name");%>

<% String password1 = request.getParameter("password1");%>
<% String password2 = request.getParameter("password2");%>
<% String username = (String)(session.getAttribute("sUserName")); %>
<% if(password1.equals(password2)){%>



<% BasicDBObject updateQuery = new BasicDBObject();%>
<% updateQuery.append("$set", 
      new BasicDBObject().append("name", name).append("password", password1));%>
<% BasicDBObject searchQuery = new BasicDBObject();%>
<% searchQuery.append("username", username);%>
<% loindet.updateMulti(searchQuery, updateQuery);%>
<% %>
password details updated
<%} else {%>
<h1> Your passwords donot match each other. </h1>
<%}%>


<%@ include file="footer.jsp" %>
</body>
</html>