<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.io.*,javax.servlet.ServletException,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,com.mongodb.MongoClient,com.mongodb.MongoException,com.mongodb.WriteConcern,com.mongodb.DB,com.mongodb.DBCollection,com.mongodb.BasicDBObject,com.mongodb.DBObject,com.mongodb.DBCursor,com.mongodb.ServerAddress,java.util.Arrays,java.util.List,java.util.Set,java.util.Date, com.mongodb.WriteResult,java.util.*;"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Car Rental</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="javascript.js"></script>
  <div id="header">
    <div id="site_title"> CarZ Rentals </div>
  </div>

<body onload="init()">
<%@ include file="header2.jsp" %>
</div>

    <div id="banner">
    </div>
  <form autocomplete="off" name="autofillform" action="autocomplete" width = "100%" height = "100%">
      <table border="0" cellpadding="5"> 
        <tbody>
          <tr>
                        <td>
                            <input type="text"
                       size="125" 
                       id="complete-field"
                                   onkeyup="doCompletion()" placeholder = "type your search field here">
                        </td>
          </tr>
          <tr>
              <td id="auto-row" colspan="2">
                <table id="complete-table" class="popupBox" />
              </td>
          </tr>
        </tbody>
      </table>
    </form>
    <aside class="sidebar">
    
      <div id="content_left">
      <div class="right_column_section">
        <h4><div id="Search">
        
        </div>
        <%@ include file="home_nav.jsp" %>
</aside>


<div id="content">
    <div id="content_right">
      <div class="content_right_section_01">
        
        <%
MongoClient mongo = new MongoClient("localhost", 27017);
%>
  <%
    String pageHeading = "Submit Review";
    String pageContent =" ";
    String myPage = " ";
    String tableData = " ";
    
    int count = 0;
  %>
  <%    
      try{
      String productName = request.getParameter("productName");
      

            String productPrice =request.getParameter("productPrice");      
            
      String locationZip  = request.getParameter("locationZip");
      
      
      String userId = request.getParameter("userID");
      String userGender = request.getParameter("userGender");
      String userOccupation = request.getParameter("userOccupation");
            int userAge = Integer.parseInt(request.getParameter("userAge"));
      
      int reviewRating = Integer.parseInt(request.getParameter("reviewRating"));
      String reviewDate = request.getParameter("reviewDate");
      String reviewText = request.getParameter("reviewText");

  %>

  <%
    DB db = mongo.getDB("practice");
    DBCollection myReviews = db.getCollection("carReviews");

    BasicDBObject doc = new BasicDBObject("title", "MongoDB").
        append("productName", productName).
        append("productPrice", productPrice).
        
        append("locationZip", locationZip).
        
        append("userId", userId).
        append("userAge", userAge).
        append("userGender", userGender).
        append("userOccupation", userOccupation).
        append("reviewRating", reviewRating).
        append("reviewDate", reviewDate).
        append("reviewText", reviewText);


    myReviews.insert(doc);
    BasicDBObject searchQuery = new BasicDBObject();
    searchQuery.put("productName", productName);
    searchQuery.put("userId", userId);
    DBCursor dbCursor = myReviews.find(searchQuery);
       String var1="";
       String var2="";
       String var3="";

       String var4="";
       String var5="";
       String var6="";
       String var71="";

       String var72="";
       String var8="";
       String var9="";

       String var10="";
       String var11="";
       String var12="";
       String var13="";

       String var14="";
       String var15="";
       String var16="";


    %>
    
    <% while (dbCursor.hasNext()) {%>

    <% BasicDBObject bobj = (BasicDBObject) dbCursor.next();
    %>
    <% 
       var2=bobj.getString("productName");
       var3=bobj.getString("productPrice");

       
       var5=bobj.getString("locationZip");
      
       var10=bobj.getString("userId");
       var11=bobj.getString("userAge");
       var12=bobj.getString("userGender");
       var13=bobj.getString("userOccupation");

       var14=bobj.getString("reviewRating");
       var15=bobj.getString("reviewDate");
       var16=bobj.getString("reviewText");

       %>

       <%}
    %>
    <table>
    
    <tr>
      <td> Product Name </td>
      <td><%=var2%></td>
    </tr>
    <tr>
      <td> Product Price </td>
      <td><%=var3%></td>
    </tr>
    
    
    <tr>
      <td>Location Zipcode </td>
      <td><%=var5%></td>
    </tr>
    
    <tr>
      <td>User Id </td>
      <td><%=var10%> </td>
    </tr>
    <tr>
      <td>User Age </td>
      <td><%=var11%> </td>
    </tr>
    <tr>
      <td>User Gender </td>
      <td><%=var12%> </td>
    </tr>
    <tr>
      <td>User Occupation </td>
      <td><%=var13%> </td>
    </tr>
    <tr>
      <td> Review Rating </td>
      <td><%=var14%></td>
    </tr>
    <tr>
      <td> Review Date </td>
      <td><%=var15%></td>
    </tr>
    <tr>
      <td>Review Text </td>
      <td><%=var16%> </td>
    </tr>
    
    </table>
    <%  }catch (MongoException e) 
        {
        e.printStackTrace();
        }
    %>
      </div>
    </div>

    <!-- end of content left -->
    <div class="cleaner">&nbsp;</div>
  </div>
  <!-- end of content -->
  <center><div id="footer"> 
    <a href="#">Home</a> | <a href="#">FAQs</a> | <a href="#">Terms of use</a> | <a href="#">Privacy Policies</a> | <a href="#">Contact</a><br />
    Copyright &copy; 2015 <a href="#"><strong>CarZ Rentals</strong></a> | Designed by <a target="_blank" rel="nofollow" href="http://www.templatemo.com">Team 9</a>
  </div></center>
  <!-- end of footer -->
<!-- </div> -->
<!-- end of container -->
</body>
</html>
