<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>WRITE REVIEW</title>
	<link rel="stylesheet" href="style.css" type="text/css" />
</head>

<body>
	<div id="container">
    
<%@include file="header2.jsp"%> 
  <h1>Product Reviews</h1>
<%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
		<%
			String prodName = "productName";
			String parameterS = "";
		%>

		<% parameterS = request.getParameter("carType");%>
	
<%
			DB db = mongo.getDB("practice");
			DBCollection myReviews = db.getCollection("carReviews");
			BasicDBObject queryS = new BasicDBObject();
			queryS.put(prodName, parameterS);

			DBCursor cursor = myReviews.find(queryS);
%>
<%			
			if(cursor.count() == 0){
%>
			<table>
				<tr>There are no reviews for this product.</tr>
			</table>

<%
			}else{ %>

			

	<%			String productModelName="";
				
				String productPrice = "" ;
				
				String locationZip = "";
				
				String userId = "";
				String userAge = "" ;	
				String userGender = "";
				String userOccupation = "";
				String reviewRating = ""  ;
				String reviewDate = "";
				String reviewText = "";
				int c=1;
%>          
		<%  while (cursor.hasNext()) { %>
		<%  BasicDBObject obj = (BasicDBObject) cursor.next();  
					%>
					<fieldset>
						<h2><%=c%></h2>
					
					<table>
					<tr>
					<td> Car Name: </td>
					<%  productModelName = obj.getString("productName");%>
					<td>"<%=productModelName%>"</td>
					</tr>	
					
					<tr>
					<td> Product Price: </td>
					<%productPrice = obj.getString("productPrice");%>
					<td>"<%=productPrice%>" </td>
					</tr>
					
					<td> Retailer zip: </td>
					<%locationZip = obj.getString("locationZip");%>
					<td> "<%=locationZip%>"  </td>
					
					<tr>
					<td> User Id: </td>
					<%userId = obj.getString("userId");%>
					<td> "<%=userId%>" </td>
					</tr>
					<tr>
					<td> User age: </td>
					<%userAge = obj.getString("userAge");%>
					<td>"<%=userAge%>" </td>
					</tr>
					<tr>
					<td> User Gender: </td>
					<%userGender = obj.getString("userGender");%>
					<td> "<%=userGender%>" </td>
					</tr>
					<tr>
					<td> User Occupation: </td>
					<%userOccupation = obj.getString("userOccupation");%>
					<td> "<%=userOccupation%>"</td>
					</tr>
					<tr>
					<td> Review Rating: </td>
					<%reviewRating = obj.getString("reviewRating");%>
					<td> "<%=reviewRating%>"</td>
					</tr>
					<tr>
					<td> Review Date: </td>
					<%reviewDate = obj.getString("reviewDate");%>
					<td>"<%=reviewDate%>" </td>
					</tr>
					<tr>
					<td> Review Text: </td>
					<%reviewText = obj.getString("reviewText");%>
					<td>"<%=reviewText%>"</td>
					</tr>
					</table>
					<br><br>
					</fieldset>
					<%c=c+1;%>
			
	<% }
}%>

</body>
</html>