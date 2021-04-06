<%-- 
    Document   : Registration
    Created on : Oct 11, 2020, 10:36:12 PM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="css/Form.css" />
        <link rel="stylesheet" href="css/LandingPage.css"/>
        <link rel="stylesheet" href="css/main.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet">
        <style>
            .container {
                width: 30vw;
            }
            .flex {
                justify-content: space-between;
            }
            .form {
                width: 70vw;
            }
            .logo {
                margin: 2vh;
                width: 8vw;
            }
            
        </style>
    </head>
    <body>
        <form class="form" action="Registration" method="POST">
            
        <div class="flex">
            <div class="container">
                <img src="image/logo.jpg" class="logo"/>
                <label for="email">Email: </label>
                <input type="text" name="email" size="20" required>
                <label for="name">Name: </label>
                <input type="text" name="name" size="20" required>
                <label for="password">Password: </label>
                <input type="password" name="password" size="20" required>
                <label for="number">Phone No.</label>
                <input type="text" name="number" size="20" required>
            </div>
            <div class="container">
                <label for="address" style="margin-top: 12vh;">Address: </label>
                <textarea rows="3" name="address" required></textarea>
                <label for="gender">Gender: </label>
                <select name="gender" required>
                    <option value="1">Male</option>
                    <option value="0">Female</option>
                </select>
            
                <input type="submit" value="Register">
            </div>
        </div>
        </form>
    </body>
</html>
