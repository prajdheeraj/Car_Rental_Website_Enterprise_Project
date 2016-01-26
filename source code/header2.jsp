

<script type="text/javascript" src="javascript.js"></script>
<body onload = "init()">

<div id="container">
  <div id="menu"> <span></span>
<nav>
    <ul>
        <li style="width:127px;font-size:14px;"><a href="index.jsp"><center>Home</center></a></li>
        <li style="width:127px;font-size:14px;"><a href="#">Reserve</a>
            <ul>
                <li style="width:187px;font-size:14px;"><a href="reserve.jsp">Rent A Car</a></li>
                <li style="width:187px;font-size:14px;"><a href="cancelReservation.jsp">Modify Reservation</a></li>
                
            </ul>
        </li>
        <li style="width:127px;font-size:14px;"><a href="location.jsp">Location </a>
            
        </li>
        <li style="width:127px;font-size:14px;"><a href="viewDeals.jsp">Deals </a>

        </li>

        <li style="width:197px;font-size:14px;"><a href="contact.jsp">Contact Us </a>
            
        </li>

        <li style="width:251px;font-size:14px;"><a href="#"><%=(String)(session.getAttribute("sUserName"))%>'s account </a>
            <ul>

                <li style="width:251px;font-size:14px;"><a href="editProfile.jsp">Edit Profile</a></li>
                <li style="width:251px;font-size:14px;"><a href="logout.jsp">Logout</a></li>
                
        <li style="width:197px;font-size:14px;"><a href="myReservations.jsp">My reservations </a>
            
        </li>        
                
            </ul>
            
        </li>
        
    </ul>
    

    

</nav>
</div>

      <form autocomplete="off" name="autofillform" action="autocomplete" width = "100%" height = "100%">
      <table border="0" cellpadding="5"> 
        <tbody>
          <tr width = 100>
                        <td width = 100%>
                            <input type="text"
                       size="125" 
                       id="complete-field"
                                   onkeyup="doCompletion()" placeholder = "type a car name here">
                        </td>
          </tr>
          <tr width = 100>
              <td id="auto-row" colspan="2" width = 100>
                <table id="complete-table" class="popupBox" width = 100%/>
              </td>
          </tr>
        </tbody>
      </table>
    </form>
