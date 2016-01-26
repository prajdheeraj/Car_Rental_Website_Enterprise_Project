<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date"%>

<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<% String str1 = request.getParameter("userName"); %>
<% String str2 = request.getParameter("password"); %>
<% if(str1.equalsIgnoreCase("salesman") && str2.equals("password")){%>
<%  out.println("Thank you. Your credentials are valid."); %>
<% response.sendRedirect("salesman_console.jsp");%>
<% }else{%>
<% out.println("<h3>Sorry, you are INVALID</h3>"); } %>
<% %>
<% %>
<% %>
<% %>