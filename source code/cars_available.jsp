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
                        Coupon
                    </th>
                    <th>
                        Reserve
                    </th>
                </tr>


<% 
    ArrayList<String> list = (ArrayList<String>) request.getAttribute("available_cars");
    String available_car_id = "";
    String car_name = "";
    String car_desc = "";
    String car_Price = "";
    for(int i = 0; i<list.size(); i++)
        {
            available_car_id = list.get(i);
            MongoClient mongo = new MongoClient("localhost", 27017);
            DB db = mongo.getDB("practice");
            DBCollection cars = db.getCollection("cars");
            BasicDBObject whereQuery = new BasicDBObject();
            whereQuery.put("car_id", available_car_id);
            DBCursor cursor1 = cars.find(whereQuery);
            while(cursor1.hasNext())
                {
                    BasicDBObject obj = (BasicDBObject) cursor1.next();            
%>
<form method = "post" action = "confirm.jsp">
<tr>
<td><input type="radio" name="available_car_id" value="<%= available_car_id %>" required/></td>
<input type="hidden" name="available_car_name" value="<%= obj.getString("car_name") %>" />
<input type="hidden" name="available_car_price" value="<%= obj.getString("car_Price") %>" />

<td><%= obj.getString("car_name") %></td>
<td><%= obj.getString("car_desc") %></td>
<td><%= obj.getString("car_Price") %> per day</td>
<td><input type=text name = "dealCode"/></td>
<td><input type="submit" value="Reserve"></td>
</tr>
</form>
<% }%>
<!-- closing braces for the while loop, in the top line. -->
<!-- closing braces for the for loop, in the top line. -->
<% }%>

</table>
<%@ include file="footer.jsp" %>
</body>
</html>
