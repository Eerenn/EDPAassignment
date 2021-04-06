<%-- 
    Document   : CustomerReceipt
    Created on : Oct 17, 2020, 5:41:18 PM
    Author     : Ee ren
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Orders"%>
<%@page import="model.ProductOrder"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="css/main.css" />
            <link rel="stylesheet" href="css/Receipt.css" />
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.1.1/jspdf.umd.min.js"></script>
            <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;800&display=swap" rel="stylesheet">
        <title>Receipt</title>
        <% 
            HttpSession s = request.getSession(false);
            List<Product> userP = (List<Product>)s.getAttribute("userP");
            List<ProductOrder> userPO = (List<ProductOrder>)s.getAttribute("userPO");
            Orders order = (Orders)s.getAttribute("orderObj");
            DecimalFormat df2 = new DecimalFormat("#.##");
            double sum =0;
            double sumAll = 0.00;
            int u = 0;
        %>
    </head>
    <body>
            
        <div class="receipt" id="content">
            <div class="flex">
            <img src="image/logo.jpg"/>
            <h1>Receipt</h1>
            
            </div>
            <h3>Kiki's Delivery Service</h3>
            <h4 style="    border-top: none !important; text-align: left;">Order ID: #<%= order.getId() %></h4>
            <table>
                <thead>
                    <tr>
                        <th class="column1"></th>
                        <th class="column2">Item</th>
                        <th class="column3">Qty</th>
                        <th class="column4">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (int i = 0; i < userP.size(); i++) {
                            u=i+1;
                            sum= userPO.get(i).getQuantity()*userP.get(i).getPrice();
                            sumAll += sum;
                                out.print("<tr>");
                                out.print("<td class=\"column1\">"+u+"</td>");
                                out.print("<td class=\"column2\">"+userP.get(i).getName()+"</td>");
                                out.print("<td class=\"column3\">"+userPO.get(i).getQuantity()+"</td>");
                                out.print("<td class=\"column4\">"+df2.format(sum)+"</td>");
                                
                                out.print("</tr>");
                            }
                    %>
                    
                </tbody>
            </table>
                    <h4>Total: <%= df2.format(sumAll) %></h4>
                    <div id="editor"></div>
                    <div class="flex-end"> 
                        <button id="cmd" >Download Receipt</button>
                        <button onclick="window.location='CustomerPayment'">Next</button>
                    </div>
        </div>
                    
    </body>
</html>
<script>
    $(document).ready(function() {
        var doc = new jsPDF();
        var specialElementHandlers = {
            '#editor': function (element, renderer) {
                return true;
            }
        };

        $('#cmd').click(function () {
            doc.fromHTML($('#content').html(), 15, 15, {
                'width': 170,
                    'elementHandlers': specialElementHandlers
            });
            doc.save('receipt.pdf');
        });
    })


</script>