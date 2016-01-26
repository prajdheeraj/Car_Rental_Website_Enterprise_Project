<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date"%>

<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<% String n = request.getParameter("userName"); %>
<% String p = request.getParameter("password"); %>
<% DB db = mongo.getDB("practice");%>
<% BasicDBObject query = new BasicDBObject();%>
<% query.put("username", n);%>
<% query.put("password", p);%>
<% DBCollection loindet = db.getCollection("loindet");%>
<% DBCursor cursor = loindet.find(query);%>
<% int cnt = loindet.find(query).count();%>
<% if(cnt!=0){%>
<% session.setAttribute( "sUserName", n );%>
<% out.println(n);%>
<!-- <a href="index1.jsp">click here to go shopping</a> -->
<% response.sendRedirect("index.jsp");%>
<% }if(cnt == 0){%>

 <% out.println("not success"); }%>
