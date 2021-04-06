<%-- 
    Document   : AdminCustomerFunction
    Created on : Oct 14, 2020, 11:29:26 AM
    Author     : Ee ren
--%>

<%@page import="java.util.List"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap\" rel=\"stylesheet\">
        <%
            int index= Integer.parseInt(request.getParameter("index"));
            HttpSession s = request.getSession(false);
            List<Customer> listC = (List<Customer>)s.getAttribute("customerList");
            Customer c = listC.get(index);
            s.setAttribute("user", c);
            %>
    </head>
    <body>
        
        <form class="form" action="AdminCustomerFunction" method="POST">
            <div class="return-cont"><span class="return" onclick="window.location='AdminCustomer'">&#8592;</span><h1>Edit Profile</h1></div>
            <label for="email">Email: </label>
            <input type="text" name="email" size="20" value="<%= c.getEmail() %>" required/>
            <label for="name">Name: </label>
            <input type="text" name="name" size="20" value="<%= c.getName()%>" required/>
            <label for="address">Address: </label>
            <input type="text" name="address" size="20" value="<%= c.getAddress()%>" required/>
            <label for="number">Phone No.</label>
            <input type="text" name="number" size="20" value="<%= c.getNumber()%>" required/>
            
                <input type="hidden" value="none" name="delete"/>
                <input type="submit" value="Update">
                <input type="button" onclick="del()" value="Delete">
        </form>
    </body>
</html>
<script>
    function del() {
        window.location = "AdminCustomerFunction?delete=del&number=0";
    }
</script>
