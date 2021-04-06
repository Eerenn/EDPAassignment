<%-- 
    Document   : Login
    Created on : Oct 11, 2020, 10:55:28 PM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/LandingPage.css"/>
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet">
        <style>
            .title {
                margin:15vh 5vw;
            }
            .form {
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <div class="title">
        <form class="form" action="Login" method="POST">
            <img src="image/logo.jpg" class="logo" style="margin-top: 0;margin-left: 12vw;"/>
            <label for="name">Name: </label>
            <input type="text" name="name" size="20" required>
            <label for="password">Password: </label>
            <input type="password" name="password" size="20" required>
            
            <input type="submit" value="Login">
        </form>
        </div>
        <div class="div">
            <img class="sideimg" src="image/truck-man.jpg"/>
        </div>
        
        
    </body>
</html>
