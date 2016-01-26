<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%@ include file="header2.jsp" %>
<% String startDate = request.getParameter("startDate"); %>
<% String endDate = request.getParameter("endDate"); %>
<% String startTime = request.getParameter("startTime"); %>
<% String endTime = request.getParameter("endTime"); %>
<% startDate = startDate + startTime; %>
<% endDate = endDate + endTime; %>

<% session.setAttribute( "sStartDate", startDate);%>
<% session.setAttribute("sEndDate", endDate); %>

<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.io.IOException,java.io.PrintWriter,javax.servlet.RequestDispatcher,javax.servlet.ServletException,javax.servlet.http.HttpServlet,javax.servlet.http.*,java.text.*,java.util.*,javax.servlet.*,java.util.Date"%>

<% Date startDate_date; 
Date endDate_date; 
boolean c1 = true; %>
<% 		try 
        {
           startDate_date = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((startDate).trim());
           endDate_date = new SimpleDateFormat("yyyy-MM-ddhh:mm").parse((endDate).trim());
           if(startDate_date.compareTo(endDate_date)>0)
           c1 = false;
          %>


<% if(c1){%>
<div id="banner">
</div>
<!--
<aside class="sidebar">
</aside>
<div id="content">-->
<center><h1><b><br>Car Category Selection Page</h1></b></center>
<div id="content_right">
   <div id="body">		
	<section id="content">
		<article class="expanded">	
		<left><h2><b>Car Categories</h2></left>		
            <table border="1" >
			<tr>
				<td>
					<img src = "images/img_compact.png" alt = "Nissan Versa Note"><br>
					
				</td>
				<td>
					<p>Compact Cars</p><br>
					<p>Nissan Versa Note or Similar</p>
				</td>
				<td>
					<form  method = "get" action ="cars_available_new">
					<input type = "hidden" name = "startDate" value = "<%=startDate%>">
					<input type = "hidden" name = "endDate" value = "<%=endDate%>">
					<input type = "hidden" name = "car_category" value = "Compact Car">
					<input type = "submit" value = "Submit">
					</form>
				</td>
			</tr>

			<tr>
				<td>
					<img src = "images/img_standard.png" alt = "Toyota Corolla"><br>
					
				</td>
				<td>
					<p>Standard/Intermediate Cars</p><br>
					<p>Toyota Corolla or Similar</p>
				</td>
				<td>
					<form  method = "get" action = "cars_available_new">
					<input type = "hidden" name = "startDate" value = "<%=startDate%>">
					<input type = "hidden" name = "endDate" value = "<%=endDate%>">	
					<input type = "hidden" name = "car_category" value = "Standard Car">
					<input type = "submit" value = "Submit">
					</form>
				</td>
			</tr>

			<tr>
				<td>
					<img src = "images/img_fullsize.png" alt = "Ford Focus"><br>
					
				</td>
				<td>
					<p>FullSize/Sedan Cars</p><br>
					<p>Ford Focus or Similar</p>
				</td>
				<td>
					<form  method = "get" action = "cars_available_new">
					<input type = "hidden" name = "startDate" value = "<%=startDate%>">
					<input type = "hidden" name = "endDate" value = "<%=endDate%>">	
					<input type = "hidden" name = "car_category" value = "Sedan Car">
					<input type = "submit" value = "Submit">
					</form>
				</td>
			</tr>

			<tr>
				<td>
					<img src = "images/img_SUV.png" alt = "Honda CR-V"><br>
					
				</td>
				<td>
					<p>SUV </p><br>
					<p>Honda CR-V or Similar</p>
				</td>
				<td>
					<form  method = "get" action = "cars_available_new">
					<input type = "hidden" name = "startDate" value = "<%=startDate%>">
					<input type = "hidden" name = "endDate" value = "<%=endDate%>">
					<input type = "hidden" name = "car_category" value = "SUV Car">
					<input type = "submit" value = "Submit">
					</form>
				</td>
			</tr>

			</table>
			
		</article>
    </section>
	</div>
</div>
<% } else{%>
<h1>Go back and check your dates. </h1>
<%}%>

<% }
      	catch (ParseException e) 
        {
          e.printStackTrace();
        }%>
<%@ include file="footer.jsp" %>
</body>
</html>