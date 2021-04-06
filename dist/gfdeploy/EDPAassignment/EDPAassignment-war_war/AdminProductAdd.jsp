<%-- 
    Document   : AdminProductAdd
    Created on : Oct 14, 2020, 10:13:02 PM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New Product</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet">
    </head>
    <body>
        <form class="form" action="AdminProductAdd" method="POST">
            <div class="return-cont"><span class="return" onclick="window.location='AdminProduct'">&#8592;</span><h1>Add New Product</h1></div>
            <label for="name">Item:   </label>
            <input type="text" name="name" size="20" required>
            <label for="price">Price:   </label>
            <input type="number" name="price" size="20" step="0.1" min="0" required>
            <label for="description">Description: </label>
            <textarea rows="3" name="description" required/></textarea>
            
                <input type="submit" value="Click to Register">
        </form>
    </body>
</html>