<%-- 
    Document   : CustomerOrderStatusTable
    Created on : Oct 17, 2020, 9:29:30 PM
    Author     : Ee ren
--%>

<%@page import="java.util.Collections"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .column1 {
        width: 10%;
    }
    .column2 {
        width: 60%;
    }
    .column3 {
        width: 30%;
    }
    td {
        text-transform: uppercase;
    }
    .a {
        font-weight: bold;
        text-decoration: underline;
    }
</style>
        <%
            HttpSession s = request.getSession(false);
            List<Orders> listO = (List<Orders>)s.getAttribute("userO");
//            Collections.sort(listO, Collections.reverseOrder());
            int u = 0;
            String status="";
        %>
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <tr class="row100 head">
                                <th class="cell100 column1"></th>
                                <th class="cell100 column2">Orders</th>
                                <th class="cell100 column3">Status</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listO.size(); i++) {
                                                u=i+1;
                                                switch(listO.get(i).getStatus()){
                                                    case 1: status="Pending to issue";
                                                    break;
                                                    case 2: status="Waiting to deliver";
                                                    break;
                                                    case 3: status="Item delivered";
                                                    break;
                                                    case 4: status="Completed";
                                                    break;
                                                }
                                                out.println("<tr class=\"row100 body\">");
                                                out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                out.println("<td class=\"cell100 column2\"><a class=\"a\" href='CustomerOrderDetail?orderId="+listO.get(i).getId()+"' >"+listO.get(i).getId()+"</a></td>");
                                                out.println("<td class=\"cell100 column3\">"+status+"</td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>