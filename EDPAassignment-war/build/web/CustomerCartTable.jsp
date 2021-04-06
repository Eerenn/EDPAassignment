<%-- 
    Document   : CustomerCartTable
    Created on : Oct 16, 2020, 10:23:39 PM
    Author     : Ee ren
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Orders"%>
<%@page import="model.ProductOrder"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .column1 {
        width: 5%;
    }
    .column2 {
        width: 30%;
    }
    .column3 {
        width: 20%;
    }
    span {
        cursor: pointer;
        transition: .2s;
    }
    span:hover {
        color: #6c7ae0;
    }
    .checkoutIcon {
        width: 20px;
    }
</style>
        <%
            HttpSession s = request.getSession(false);
            List<ProductOrder> listPO = (List<ProductOrder>)s.getAttribute("cartList");
            List<Product> listP = (List<Product>)s.getAttribute("productList");
            Orders order = (Orders)s.getAttribute("orderObj");
            DecimalFormat df2 = new DecimalFormat("#.##");
            int u=0;
            
            List<ProductOrder> userPO = new ArrayList<ProductOrder>();
            List<Product> userP = new ArrayList<Product>();
            for (int i = 0; i < listPO.size(); i++) {
                if(listPO.get(i).getOrderId().equals(order.getId())) {
                    userPO.add(listPO.get(i));
                }
            }
            for (int i = 0; i < userPO.size(); i++) {
                for (int j = 0; j < listP.size(); j++) {
                    if(userPO.get(i).getProductId().equals(listP.get(j).getId())){
                        userP.add(listP.get(j));
                        break;
                    }
                }
            }
            int userProduct = userP.size();
            int userProductOrder = userPO.size();
            s.setAttribute("userPO", userPO);
            s.setAttribute("userP", userP);
            Double sum= 0.0;
            Double sumAll = 0.0;
        %>
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <tr class="row100 head">
                                <th class="cell100 column1"></th>
                                <th class="cell100 column2">Item</th>
                                <th class="cell100 column3">Quantity</th>
                                <th class="cell100 column3">Price (Per item)</th>
                                <th class="cell100 column3">Total Cost</th>
                                <th class="cell100 column1"></th>
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
                                                out.println("<td class=\"cell100 column1\"><span onclick='window.location=\"CustomerCartDelete?id="+i+"\"'>&#10005;</span></td>");
                                                
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
                                            out.println("<td class=\"cell100 column1\"><form action=\"CustomerPayment.jsp\" id=\"form\" method=\"POST\"><input type=\"hidden\" value="+df2.format(sumAll)+" name=\"sum\"/><span onclick=\"form.submit()\" alt=\"Check Out\"><img class=\"checkoutIcon\" src=\"image/empty-cart.png\" /></span></form></td>");
                                            out.println("</tr>");
                                        %>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>