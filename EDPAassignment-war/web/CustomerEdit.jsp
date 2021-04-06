<%-- 
    Document   : CustomerEdit
    Created on : Oct 15, 2020, 3:43:10 AM
    Author     : Ee ren
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/Header.css" />
        <title>Edit Profile</title>
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
                margin-top: 25vh;
                width: 70vw;
            }
            .logo {
                margin: 2vh;
                width: 8vw;
            }
            .relative {
                position: relative;
                width: 100vw;
            }
            .absolute {
                position: absolute;
                top:-10vh;
                z-index: -1;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession s = request.getSession(false);
            Customer user = (Customer)s.getAttribute("user");
            String gender;
            if(user.getGender()==1){
                gender="Male";
            } else {
                gender="Female";
            }
        %>
        <div class="relative">
        <jsp:include page="CustomerHeader.jsp" />
        </div>
        <div class="absolute">
        <form class="form" action="CustomerEdit" method="POST">
            
        <div class="flex">
            <div class="container">
                <div class="return-cont"><span class="return" onclick="window.location='CustomerHome'">&#8592;</span><img src="image/logo.jpg" class="logo"/></div>
                <label for="email">Email: </label>
                <input type="text" name="email" size="20" value="<%= user.getEmail() %>" readonly>
                <label for="name">Name: </label>
                <input type="text" name="name" size="20" value="<%= user.getName() %>" readonly>
                <label for="password">Password: </label>
                <input type="password" name="password" size="20" value="<%= user.getPassword() %>">
                <label for="number">Phone No.</label>
                <input type="text" name="number" size="20" value="<%= user.getNumber()%>">
            </div>
            <div class="container">
                <label for="address" style="margin-top: 12vh;">Address: </label>
                <textarea rows="3" name="address"><%= user.getAddress() %></textarea>
                <label for="gender">Gender: </label>
                <input type="text" name="gender" size="20" value="<%= gender %>" readonly/>
                <input type="submit" value="Update">
            </div>
        </div>
        </form>
        </div>
    </body>
</html>