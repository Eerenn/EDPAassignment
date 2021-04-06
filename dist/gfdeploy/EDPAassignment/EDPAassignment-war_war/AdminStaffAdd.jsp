<%-- 
    Document   : AdminStaffAdd
    Created on : Oct 14, 2020, 4:38:40 AM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet">
    </head>
    <body>
        <form class="form" action="AdminStaffAdd" method="POST">
            <div class="return-cont"><span class="return" onclick="window.location='AdminStaff'">&#8592;</span><h1>Add New Staff</h1></div>
            <label for="email">Email: </label>
            <input type="text" name="email" size="20" required>
            <label for="name">Name:  </label>
            <input type="text" name="name" size="20" required>
            <label for="password">Password:  </label>
            <input type="password" name="password" size="20" required>
            <label for="gender">Gender: </label>
            <select name="gender" required>
                <option value="1">Male</option>
                <option value="0">Female</option>
            </select>
            
                <input type="submit" value="Click to Register">
        </form>
    </body>
</html>
