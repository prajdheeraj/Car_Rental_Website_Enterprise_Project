<html>
<head>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>WRITE REVIEW</title>
	<link rel="stylesheet" href="style.css" type="text/css" />
</head>
</head>
<body>
	<%@include file="header2.jsp"%> 

  <h1>Product Reviews</h1>
	
	<%!
		String productName = "";
		String productPrice = "";
		String imageLocation = " ";
			
	%>
	<%
		productName = request.getParameter("carType");
		productPrice = request.getParameter("carPrice");  
	%>
		
	<h3><%=productName%></h3>
		
	
	
			<form method="get" action="SubmitReview.jsp">
			
			</table>
			</fieldset>
			<fieldset>
			<legend>Reviews:</legend>
			<table>
			<tr>
			<td> Product Model Name: </td>
			<td> <input type="text" name= "productName" value = "<%=productName%>" readonly>  </td>
			</tr>
			<tr>
			<td> Car price per hour: </td>
			<td> <input type="text" name= "productPrice" value = "<%=productPrice%>" readonly>  </td>
			</tr>
			<tr>
			<td> car name: </td>
			<td> <input type="text" name= "carName">  </td>
			</tr>
			<tr>
			<td> location zip: </td>
			<td> <input type="text" name= "locationZip">  </td>
			</tr>
		
			<tr>
			<td> User Id: </td>
			<td> <input type="text" name="userID" value="<%=(String)(session.getAttribute("sUserName"))%> "readonly> </td>
			</tr>
			<tr>
			<td> User age: </td>
			<td> <input type="number" name="userAge"> </td>
			</tr>
			<tr>
			<td> User Gender: </td>
			<td> <input type="text" name="userGender"> </td>
			</tr>
			<tr>
			<td> User Occupation: </td>
			<td> <input type="text" name="userOccupation"> </td>
			</tr>
			<tr>
			<td> Review Rating: </td>
			<td>
			<select name="reviewRating">
			<option value="1" selected>1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			</td>
			</tr>
		
			<td> Review Date: </td>
			<td> <input type="date" name="reviewDate"> </td>
			</tr>
			<tr>
			<td> Review Text: </td>
			<td><textarea name="reviewText" rows="4" cols="50"> </textarea></td>
			</tr>
			</table>
			<br><br>
			<input type="submit" value="Submit Review">
			</fieldset>
			</form>
						
	
</body>
</html>