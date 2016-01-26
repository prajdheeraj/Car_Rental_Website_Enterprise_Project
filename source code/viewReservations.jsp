<!doctype html>

<!-- INDEX -->
<html>

<%@ include file="header2.jsp" %>
    <!-- <img class="header-image" src="images/img_index1.jpg" width = "100%" height = "100%" alt="Index Page Image" />
 -->
    <div id="body">     

    <section id="content">
    <%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult"%>

<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>

<% DB db = mongo.getDB("practice");%>
<% DBCollection reservations = db.getCollection("reservations");%>
<% BasicDBObject whereQuery = new BasicDBObject();%>
<% String res_id = request.getParameter("myradio"); %>
<!-- <input type="text" name="userName" value='<%=(String)(session.getAttribute("sUserName"))%>' readonly>
<input type="text" name="res_id" value='<%=(String)(session.getAttribute("sOrderID"))%>' readonly>
 -->
<% float total = 0; %>
<% float temp = 0; %>
<% whereQuery.put("res_id", res_id);%>
<% DBCursor cursor1 = reservations.find(whereQuery);%>
<% while(cursor1.hasNext()){%>
<% BasicDBObject obj = (BasicDBObject) cursor1.next();%>
<% String carName = ""; %>
<% String userName = ""; %>
<% String start_date_string = ""; %>
<% String end_date_string = ""; %>
<table border=1>
<tr>
<td width = 50%><b>Car Name</b> </td>
<% carName = obj.getString("car_name"); %>
<td width = 50%> <%= carName%> </td>
</tr>
<tr>
<td width = 50%><b>Start Date:</b> </td>
<% start_date_string = obj.getString("start_date_string"); %>
<td width = 50%><%= start_date_string%></td>
</tr>
<td width = 50%><b>End Date: </b></td>
<% end_date_string = obj.getString("end_date_string"); %>
<td width = 50%> <%= end_date_string%> </td>
</tr> 
</table>
Your total is $ <%= obj.getString("price_total")%>
<% }%>
<br>
<br>
<br>
<b> <b>
<br>
<br>


    </section>
        
<%@ include file="footer.jsp" %>  
<aside class="sidebar"> 

</aside> 
    <div class="clear"></div>
    </div>
    
    <footer>
    
        
        <div class="footer-bottom">
            <p>CSP 595 - Enterprise Web Application - Assignment 1</p>
        </div>
        
    </footer>
</div>

</body>

</html>