<%-- 
    Document   : AdminProductFunction
    Created on : Oct 15, 2020, 12:13:16 AM
    Author     : Ee ren
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap\" rel=\"stylesheet\">
        <%
            int index= Integer.parseInt(request.getParameter("index"));
            HttpSession s = request.getSession(false);
            List<Product> listP = (List<Product>)s.getAttribute("productList");
            Product p = listP.get(index);
            s.setAttribute("item", p);
            DecimalFormat df2 = new DecimalFormat("#.##");
            
            %>
    </head>
    <body>
        
        <form class="form" action="AdminProductFunction" method="POST">
            <div class="return-cont"><span class="return" onclick="window.location='AdminProduct'">&#8592;</span><h1>Edit Item</h1></div>
            <label for="name">Item: </label>
            <input type="text" name="itemname" size="20" value="<%= p.getName()%>" required/>
            <label for="price">Price: </label>
            <input type="number" name="price" size="20" step="0.1" min="0" value="<%= df2.format(p.getPrice())%>" required/>
            <label for="description">Description: </label>
            <textarea rows="3" name="description" required><%= p.getDescription()%></textarea>
            
                <input type="hidden" value="none" name="delete"/>
                <input type="submit" value="Update">
                <input type="button" onclick="del()" value="Delete">
        </form>
    </body>
</html>
<script>
    function del() {
        window.location = "AdminProductFunction?delete=del&price=0";
    }
</script>