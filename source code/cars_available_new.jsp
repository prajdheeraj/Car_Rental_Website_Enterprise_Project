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
                        Car Name
                    </th>
                    <th>
                        Car Category
                    </th>
                    <th>
                        Price
                    </th>
                    <th width = "20%">
                        Description
                    </th>
                </tr>
                <% 
                String car_category = request.getParameter("car_category"); 

                MongoClient mongo;
                        
                            // Connect to Mongo DB
                            mongo = new MongoClient("localhost", 27017);
                        
                        DB db = mongo.getDB("practice");
                        DBCollection cars = db.getCollection("cars");
                        BasicDBObject whereQuery = new BasicDBObject();
                        whereQuery.put("car_category", car_category); 
                        DBCursor cursor_car = cars.find(whereQuery);
                        while(cursor_car.hasNext())
                        {
                            BasicDBObject bobj = (BasicDBObject) cursor_car.next();
                            String car_name = ( bobj.getString("car_name")).trim();
                            String car_Price = ( bobj.getString("car_Price")).trim();
                            String car_desc = ( bobj.getString("car_desc")).trim(); %>
                            <tr>
                                <td><%= car_name%></td>
                                <td><%= car_category%></td>
                                <td><%= car_Price%></td>
                                <td><%= car_desc%></td>
                            </tr>


                            
                        <% }%>
                    </table>

<%@ include file="footer.jsp" %>
</body>
</html>
