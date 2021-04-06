<%-- 
    Document   : CustomerFeedbackForm
    Created on : Oct 18, 2020, 4:58:42 PM
    Author     : Ee ren
--%>

<%@page import="model.Orders"%>
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
                width: 35vw;
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
            input[type=radio] {
                margin-top: 16px;
            }
            .flex-center {
                display:flex;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession s = request.getSession(false);
            Customer user = (Customer)s.getAttribute("user");
            Orders order = (Orders)s.getAttribute("selectedO");
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
        <form class="form" action="CustomerFeedback" method="POST">
            
        <div class="flex">
            <div class="container">
                <div class="return-cont"><span class="return" onclick="window.location='CustomerOrderDetail?orderId=<%= order.getId() %>'">&#8592;</span><img src="image/logo.jpg" class="logo"/></div>
                <label for="orderId">Order ID: </label>
                <input type="text" name="orderId" size="20" value="<%= order.getId() %>" readonly>
                <label for="comments">Comments: </label>
                <textarea rows="3" name="comments"></textarea>
                <label>Ratings: </label>
                <div class="flex">
                    <div class="flex-center">
                        <input type="radio" id="q" name="rating" value="1">
                        <label for="q">1</label>
                    </div>
                    <div class="flex-center">
                        <input type="radio" id="w" name="rating" value="2">
                        <label for="w">2</label>
                    </div>
                    <div class="flex-center">
                        <input type="radio" id="e" name="rating" value="3">
                        <label for="e">3</label>
                    </div>
                    <div class="flex-center">
                        <input type="radio" id="r" name="rating" value="4">
                        <label for="r">4</label>
                    </div>
                    <div class="flex-center">
                        <input type="radio" id="t" name="rating" value="5">
                        <label for="t">5</label>
                    </div>
                </div>
                <input type="submit" value="Submit">
            </div>
        </div>
        </form>
        </div>
    </body>
</html>