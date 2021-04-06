<%-- 
    Document   : CustomerOrderDetailTable
    Created on : Oct 17, 2020, 11:41:27 PM
    Author     : Ee ren
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Orders"%>
<%@page import="model.Product"%>
<%@page import="model.ProductOrder"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    button {
        height: 8vh;
        padding: 1px 10px;
        cursor: pointer;
        border: none;
        background-color: #6c7ae0;
        color: #fff;
        border-radius: 3px;
        transition: .2s;
        text-transform: uppercase;
        font-weight: 800;
        border: solid 2px #fff;
        margin-left: 30px;
        
    }
    button:hover {
        background-color: #fff;
        color: #6c7ae0;
        border: solid 2px #6c7ae0;
    }
    .flex {
        align-items: center;
    }
</style>
<% 
    HttpSession s = request.getSession(false);
    List<Product> userP = (List<Product>)s.getAttribute("selectedP");
    List<ProductOrder> userPO = (List<ProductOrder>)s.getAttribute("selectedPO");
    Orders userOrders = (Orders)s.getAttribute("selectedO");
    DecimalFormat df2 = new DecimalFormat("#.##");
    int u = 0;
    Double sum=0.0;
    Double sumAll=0.0;
    
%>
<div class="limiter">
    <div class="flex">
        <h1>Order #<%= userOrders.getId() %></h1>
    <% 
        if(userOrders.getStatus()==3) {
        out.println(" <button onclick=\"window.location='CustomerFeedbackForm.jsp'\">Submit Feedback</button>");
        }
    %>
    </div>
    
    <h2 class="gap">Order #<%= userOrders.getId() %></h2>

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

    
<!--            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <tr class="row100 head">
                                <th class="cell100 column1"><a style="color:#fff; font-weight: 800;" href="CustomerOrderStatus" >&#8592;</a></th>
                                <th class="cell100 column2">Item</th>
                                <th class="cell100 column3">Quantity</th>
                                <th class="cell100 column3">Price (Per item)</th>
                                <th class="cell100 column3">Total Cost</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < userP.size(); i++) {
                                                u=i+1;
                                                sum= userPO.get(i).getQuantity()*userP.get(i).getPrice();
                                                sumAll += sum;
                                                out.println("<tr class=\"row100 body\">");
                                                out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                out.println("<td class=\"cell100 column2\">"+userP.get(i).getName()+"</td>");
                                                out.println("<td class=\"cell100 column3\">"+userPO.get(i).getQuantity()+"</td>");
                                                out.println("<td class=\"cell100 column3\">"+df2.format(userP.get(i).getPrice())+"</td>");
                                                out.println("<td class=\"cell100 column3\">"+df2.format(sum)+"</td>");
                                                
//                                                out.println("<td class=\"cell100 column5\">"
//                                                        + "<form class=\"marginauto\" action=\"CustomerHome\" id="+listP.get(i).getName()+" method=\"POST\"> "
//                                                                + "<input  id="+listP.get(i).getName()+" type=\"number\" name=\"quantity\" min=\"1\" value=\"1\" />"
//                                                                        + "<input type=\"hidden\" value="+listP.get(i).getId()+" name=\"item\">"
//                                                                + "<input type=\"submit\" value=\"Add\" onclick=\"addProduct()\".submit() /></form></td>");
                                                        
                                                out.println("</tr>");
                                            }
                                            out.println("<tr>");
                                            out.println("<td class=\"cell100 column1\"></td>");
                                            out.println("<td class=\"cell100 column2\">Total Cost:</td>");
                                            out.println("<td class=\"cell100 column3\"></td>");
                                            out.println("<td class=\"cell100 column3\"></td>");
                                            out.println("<td class=\"cell100 column3\">"+df2.format(sumAll)+"</td>");
                                            out.println("</tr>");
                                        %>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->