<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cars Available</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.io.IOException,java.io.PrintWriter,javax.servlet.RequestDispatcher,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.*,java.text.*,java.util.*,javax.servlet.*,java.util.Date"%>

<%@ include file="header2.jsp" %>
<div id="banner">
</div>
<center><h1><b><br>These are the cars available. </h1></b></center>
<div id="content_right">
<%      String available_car_id = request.getParameter("available_car_id"); 
        String startDate_string = (String)(session.getAttribute("sStartDate"));
        String endDate_string = (String)(session.getAttribute("sEndDate")); 
        String price_string = request.getParameter("available_car_price"); 
        String available_car_name = request.getParameter("available_car_name"); 
        String dealCode = request.getParameter("dealCode"); 
        String dealPercent = ""; 
        float dealPercentInt = 0; 
        int diffInDays = 0; 
        float price_total = 0; 
        float price_total_end = 0; 
        try 
        {
          Date startDate = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((startDate_string).trim());
          Date endDate = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((endDate_string).trim());
          diffInDays = (int)( ( endDate.getTime() - startDate.getTime()) 
                 / (1000 * 60 * 60 * 24) );
                 diffInDays++; 
          
          MongoClient mongo = new MongoClient("localhost", 27017);
          

           DB db = mongo.getDB("practice");
           DBCollection deals = db.getCollection("deals");
           BasicDBObject whereQuery = new BasicDBObject();
           whereQuery.put("dealCode", dealCode);
           DBCursor cursor1 = deals.find(whereQuery);
           while(cursor1.hasNext()){
           BasicDBObject obj = (BasicDBObject) cursor1.next();
           dealPercent = obj.getString("dealPercent");
           dealPercentInt = Float.valueOf(dealPercent); 



          }

          price_total = Float.valueOf(price_string) * diffInDays; 
          price_total_end = ((100 - dealPercentInt)/100)*price_total; 
        } 
        catch (ParseException e) 
        {
          e.printStackTrace();
        }
%>
<form method="post" action="createReservation_new">
<table>
<tr>
<td>Your car name is:</td> <td><%= available_car_name%></td>
</tr>
<tr>
<td>Your start date is:</td> <td><%= startDate_string%></td>
</tr>
<tr>
<td>Your end date is:</td> <td><%= endDate_string%></td>
</tr>
<tr>
<td>Total no days:</td> <td><%= diffInDays%></td>
</tr>
<tr>
<td>Price per day:</td> <td><%= price_string%></td>
</tr>
<tr>
<td>Discount percentage:</td> <td><%= dealPercent%>%</td>
</tr>
<tr>
<td>Total price before discount:</td> <td><%= price_total%></td>
</tr>
<tr>
<td>Total price after discount:</td> <td><%= price_total_end%></td>
</tr>
<table>
<tr><td>Credit card no: </td><td><input type="text" required/></td></tr>
<tr><td>Drivers license no: </td><td><input type="text" required/></td></tr>
<tr><td>Expiry date: </td><td><input type="text" required/></td></tr>
<tr><td>CVV: </td><td><input type="password" required/></td></tr>

</table>

<input type="submit" name="available_car_id" value="Yes,create a reservation for this car" />


</form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
