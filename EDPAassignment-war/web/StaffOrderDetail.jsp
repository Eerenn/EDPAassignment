<%-- 
    Document   : StaffOrderDetail
    Created on : Oct 18, 2020, 3:15:05 PM
    Author     : Ee ren
--%>

<%@page import="model.Customer"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="model.ProductOrder"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        HttpSession s = request.getSession(false);
        List<ProductOrder> userPO = (List<ProductOrder>)s.getAttribute("selectedPO");
        Orders assignedO = (Orders)s.getAttribute("assignedO");
        List<Product> userP = (List<Product>)s.getAttribute("selectedP");
        Customer assignedC = (Customer)s.getAttribute("assignedC");
        DecimalFormat df2 = new DecimalFormat("#.##");
        double sum =0;
        double sumAll = 0.00;
        int u = 0;
    
%>
<div class="flex-spacebetween">
    <h1>Pending Order</h1>
    <button onclick="window.location='StaffConfirmDeliver'">Confirm and Deliver</button>
</div>
<div class="customer">
    <h2>Customer Details</h2>
    <div class="flex-spacebetween">
        <span>Name: </span>
        <span><%= assignedC.getName() %></span>
    </div>
    <div class="flex-spacebetween">
        <span>Email:  </span>
        <span><%= assignedC.getEmail()%></span>
    </div>
    <div class="flex-spacebetween">
        <span>Address: </span>
        <span><%= assignedC.getAddress()%></span>
    </div>
    <div class="flex-spacebetween">
        <span>Number: </span>
        <span><%= assignedC.getNumber()%></span>
    </div>
    
</div>

<h2 class="gap">Order #<%= assignedO.getId() %></h2>

<div class="topBorder">
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
    
    
    
</div>
