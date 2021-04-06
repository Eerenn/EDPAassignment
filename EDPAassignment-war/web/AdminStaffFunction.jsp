<%-- 
    Document   : AdminUpdateStaff
    Created on : Oct 14, 2020, 12:50:48 AM
    Author     : Ee ren
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DeliveryStaff"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Staff</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet">
        <%
            int index= Integer.parseInt(request.getParameter("index"));
            HttpSession s = request.getSession(false);
            List<DeliveryStaff> listDS = (List<DeliveryStaff>)s.getAttribute("staffList");
            DeliveryStaff ds = listDS.get(index);
            s.setAttribute("user", ds);
            %>
    </head>
    <body>
        <form class="form" action="AdminStaffFunction" method="POST">
            <div class="return-cont"><span class="return" onclick="window.location='AdminStaff'">&#8592;</span><h1>Edit Staff</h1></div>
        <label for="email">Email: </label>
        <input type="text" name="email" size="20" value="<%= ds.getEmail() %>" required>
        <label for="name">Name: </label>
        <input type="text" name="name" size="20" value="<%= ds.getName()%>" required/>
                <input type="hidden" value="none" name="delete"/>
                <input type="submit" value="Update">
                <input type="button" onclick="del()" value="Delete">
        </form>
    </body>
</html>
<script>
    function del() {
        window.location = "AdminStaffFunction?delete=del";
    }
    </script>
