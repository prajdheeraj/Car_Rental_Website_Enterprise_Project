<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cars Available</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>

<%@ include file="header2.jsp" %>
<div id="banner">
</div>
<center><h1><b><br>These are the cars available. </h1></b></center>
<div id="content_right">
   <div id="body">      
    <section id="content">
        <article class="expanded">  
        <left><h2><b>Cars available:</h2></left>     
            <table border="1" >
                <tr>
                    <th>
                        Select
                    </th>
                    <th>
                        Car Name
                    </th>
                    <th>
                        Description
                    </th>
                    <th width = "20%">
                        Pricing
                    </th>
                    <th>
                        Reserve
                    </th>
                </tr>
<form method = "post" action = "AddToCart.jsp">

<% 
    ArrayList<String> list = (ArrayList<String>) request.getAttribute("available_cars");
    String available_car_id = "";
    String car_name = "";
    String car_desc = "";
    String car_Price = "";
    String car_name = ""; 
    for(int i = 0; i<list.size(); i++)
        {
            temp = list.get(i);
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("practice");
            DBCollection cars = db.getCollection("cars");
            BasicDBObject whereQuery = new BasicDBObject();
            whereQuery.put("car_id", temp);
            DBCursor cursor = cars.find(whereQuery);
            while(cursor1.hasNext())
            {
                BasicDBObject obj = (BasicDBObject) cursor1.next();
%>
<tr>
<input type="radio" name=myradio value="<%= temp %>"/>Select this<br>
<% }%>
<!-- closing braces for the for loop, in the top line. -->
<%@ include file="footer.jsp" %>
</body>
</html>
