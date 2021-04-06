<%-- 
    Document   : AdminProductTable
    Created on : Oct 14, 2020, 10:13:52 PM
    Author     : Ee ren
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%
            HttpSession s = request.getSession(false);
            List<Product> listP = (List<Product>)s.getAttribute("productList");
            int u=0;
            DecimalFormat df2 = new DecimalFormat("#.##");
            
            
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
                                <th class="cell100 column3">Price</th>
                                <th class="cell100 column4">Description</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listP.size(); i++) {
                                                u=i+1;
                                                out.println("<tr class=\"row100 body\">");
                                                out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                out.println("<td class=\"cell100 column2\">"
                                                        + "<form name="+listP.get(i).getName()+" action=\"AdminProductFunction.jsp\" method=\"POST\">"
                                                        + "<input type=\"hidden\" value="+i+" name=\"index\"/>"
                                                        + " <span class=\"submitBtn\" onclick="+listP.get(i).getName()+".submit()>"+listP.get(i).getName()+"</span></form></td>");
                                                
                                                out.println("<td class=\"cell100 column3\">"+df2.format(listP.get(i).getPrice())+"</td>");
                                                out.println("<td class=\"cell100 column4\">"+listP.get(i).getDescription()+"</td>"
                                                        + "</tr>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>