
<% HttpSession newsession = request.getSession(false);%>
<% String productID = ""; %>
<% if (newsession != null){%>


<% newsession.invalidate();%>
<% }%>
<% response.sendRedirect(request.getContextPath() + "/login.jsp");%>
<% %>