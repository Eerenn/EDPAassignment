<%-- 
    Document   : CustomerPayment
    Created on : Oct 17, 2020, 3:59:31 PM
    Author     : Ee ren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
            <link rel="stylesheet" href="css/Form.css" />
            <link rel="stylesheet" href="css/Payment.css" />
            <link rel="stylesheet" href="css/main.css" />
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;800&display=swap" rel="stylesheet">
            <style>
                .form, .display-amount {
                    margin: 10vh 0;
                }
                .form {
                    border-radius: 0 10px 10px 0;
                    box-shadow: 0 0px 40px 0px rgba(0, 0, 0, .3);
                }
            </style>
            <%
                HttpSession s = request.getSession(false);
                double total = Double.parseDouble(request.getParameter("sum"));
            %>
    </head>
    <body>
        <div class="credit-card">
            <div class="display-amount">
                <div class="return-cont"><img src="image/logo.jpg" class="logo"/></div>
                <p style="color: #fff">RM<%= total %></p>
            </div>
            <form class="form" action="CustomerReceipt.jsp" >
                    <h1>Credit Card Details: </h1>
                    <label for="name">Card Holder: </label>
                    <input type="text" name="name" size="20" value="" required>
                    <label for="cardNumber">Card Number:  </label>
                    <input type="text" name="cardNumber" size="20" value="" required>
                    <div class="cont-cont">
                        <div class="MonthYear-cont">
                            <input class="MonthYear" type="text" size="2" placeholder="MM" required /><input class="MonthYear" type="text" size="4" placeholder="yyyy" required/>
                        </div>
                        <input class="MonthYear" style="margin-right: 0 !important" type="text" name="csv" size="4" value="" placeholder="CSV" required/>
                    </div>
                    <input type="submit" value="Pay">
            </form>
        </div>
    </body>
</html>
