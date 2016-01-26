<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
  <div id="header">
    <div id="site_title"> CarZ Rentals </div>
  </div>

<body>
<%@ include file="header2.jsp" %>
</div>
<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>
    <div id="banner">
    </div>
  
    <aside class="sidebar">
    
      <div id="content_left">
      <div class="right_column_section">
        <h4><div id="Search">
        </div>
        <%@ include file="home_nav.jsp" %>
</aside>


<div id="content">
    <div id="content_right">
      <div class="content_right_section_01">
        <%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
<table border = 1 width="400" height = "200">

  <th>Deal Code</th>
  <th> Deal Title </th>
  <th> Deal description </th>
  <th> Deal percent </th>



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
String dealDescription = obj.getString("dealDescription"); 
String dealPercent = obj.getString("dealPercent"); 
 %>

<tr>
  <td> <%= dealCode%></td>
  <td> <%= dealTitle%></td>
  <td> <%= dealDescription%></td>
  <td> <%= dealPercent%></td>
  
</tr>


<% }%>
</table>
        
      </div>
    </div>

    <!-- end of content left -->
    <div class="cleaner">&nbsp;</div>
  </div>
  <!-- end of content -->
  <center><div id="footer"> 
    <a href="#">Home</a> | <a href="#">FAQs</a> | <a href="#">Terms of use</a> | <a href="#">Privacy Policies</a> | <a href="#">Contact</a><br />
    Copyright &copy; 2015 <a href="#"><strong>CarZ Rentals</strong></a> | Designed by <a target="_blank" rel="nofollow" href="http://www.templatemo.com">Team 9</a>
  </div></center>
  <!-- end of footer -->
<!-- </div> -->
<!-- end of container -->
</body>
</html>
