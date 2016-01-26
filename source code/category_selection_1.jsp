<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%@ include file="header2.jsp" %>

<!-- <div id="banner">
</div> -->
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
					<form  method = "post" action ="reserve.jsp">
					<input type = "submit" name = "Compact_Cars" value = "View Cars">
					</form>
				<br>
				
					<form  method = "post" action ="viewReviews.jsp">
						<input type = "hidden" name = "carType" value = "Compact Car">
					<input type = "submit" name = "Compact_Cars" value = "View Reviews">
					</form>
				<br>

				<form class = "submit-button" method = "post" action = "writeReview.jsp">
						<input type = "hidden" name = "carType" value = "Compact Car">
						<input type = "hidden" name = "carPrice" value = "$25">
						<input type = "submit" name = "Compact_Cars" value = "Write Review">
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
					<form  method = "post" action ="reserve.jsp">
					<input type = "submit" name = "Compact_Cars" value = "View Cars">
					</form>
				<br>
				
					<form  method = "post" action ="viewReviews.jsp">
						<input type = "hidden" name = "carType" value = "Standard Car">
					<input type = "submit" name = "Standard_Cars" value = "View Reviews">
					</form>
				<br>
				
					<form class = "submit-button" method = "post" action = "writeReview.jsp">
						<input type = "hidden" name = "carType" value = "Standard Car">
						<input type = "hidden" name = "carPrice" value = "$30">
						<input type = "submit" name = "Standard_Cars" value = "Write Review">
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
					<form  method = "post" action ="reserve.jsp">
					<input type = "submit" name = "Compact_Cars" value = "View Cars">
					</form>
				<br>
				
					<form  method = "post" action ="viewReviews.jsp">
						<input type = "hidden" name = "carType" value = "Sedan Car">
					<input type = "submit" name = "Sedan_Cars" value = "View Reviews">
					</form>
				<br>
				
					<form class = "submit-button" method = "post" action = "writeReview.jsp">
						<input type = "hidden" name = "carType" value = "Sedan Car">
						<input type = "hidden" name = "carPrice" value = "$35">
						<input type = "submit" name = "Sedan_Cars" value = "Write Review">
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
					<form  method = "post" action ="reserve.jsp">
					<input type = "submit" name = "Compact_Cars" value = "View Cars">
					</form>
				<br>
				
					<form  method = "post" action ="viewReviews.jsp">
						<input type = "hidden" name = "carType" value = "SUV Car">
					<input type = "submit" name = "SUV_Cars" value = "View Reviews">
					</form>
				<br>
				
					<form class = "submit-button" method = "post" action = "writeReview.jsp">
						<input type = "hidden" name = "carType" value = "SUV Car">
						<input type = "hidden" name = "carPrice" value = "$50">
						<input type = "submit" name = "SUV_Cars" value = "Write Review">
					</form>

				</td>
			</tr>

			</table>
			
		</article>
    </section>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>