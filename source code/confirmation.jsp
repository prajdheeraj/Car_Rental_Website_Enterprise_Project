<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Confirmation</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%@ include file="header2.jsp" %>

<div id="banner">
</div>
<center><h1><b><br>Confirm your reservation. </h1></b></center>
<div id="content_right">
   <div id="body">      
    <section id="content">
        <article class="expanded">  
        <left><h2><b>Booking details:</h2></left>     
        <center>
            <table border="1" width = "800" height="300" >
                <tr>
                    <td>
                        <b>User's name:</b> 
                    </td>
                    <td>
                        sarath
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>From Date:</b>
                    </td>
                    <td>
                        09/11/15, 18:00
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>To Date:</b>
                    </td>
                    <td>
                        09/15/15, 08:30
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Car Name: </b>
                    </td>
                    <td>
                        Honda Civic
                    </td>
                </tr>

                <tr>
                    <td>
                        <b>Total with tax: </b>
                    </td>
                    <td>
                        $352 only
                    </td>
                </tr>
                
            </table>
            <table border="0" width = "800" height="10" >
                <tr>
                    <td>
                        <input type = "submit" value = "Confirm this reservation">
                    </td>    
                    <td>
                        <input type = "submit" value = "Nope! Replan">
                    </td>    
                </tr>
            </table>
        </center>
            
        </article>
    </section>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
