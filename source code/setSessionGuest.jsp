<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date"%>

<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<% String n = "12567"; %>
<% session.setAttribute( "sUserName", n );%>

<!-- <a href="index1.jsp">click here to go shopping</a> -->
<% response.sendRedirect("index.jsp");%>
