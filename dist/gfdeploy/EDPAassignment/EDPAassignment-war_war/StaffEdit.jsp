<%-- 
    Document   : StaffEdit
    Created on : Oct 12, 2020, 1:10:26 AM
    Author     : Ee ren
--%>

<%@page import="model.DeliveryStaff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Header.css" />
        <title>Edit Profile</title>
    </head>
    <body>
        <%
            HttpSession s = request.getSession(false);
            DeliveryStaff user = (DeliveryStaff)s.getAttribute("user");
        %>
        <jsp:include page="StaffHeader.jsp" />
        <form class="form" action="StaffEdit" method="POST">
            <div class="return-cont"><span class="return" onclick="window.location='Home'">&#8592;</span><h1>Edit Profile</h1></div>
        <label for="email">Email: </label>
        <input type="text" name="email" size="20" value="<%= user.getEmail() %>" readonly/>
        <label for="name">Name: </label>
        <input type="text" name="name" size="20" value="<%= user.getName()%>" readonly/>
        <label for="password">Password:  </label>
        <input type="text" name="password" size="20" value="<%= user.getPassword()%>"/>
                <input type="submit" value="Update">
        </form>
    </body>
</html>
