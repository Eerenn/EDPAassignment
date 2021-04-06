<%-- 
    Document   : AdminOrderTable
    Created on : Oct 18, 2020, 1:28:26 AM
    Author     : Ee ren
--%>

<%@page import="model.DeliveryStaff"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .column1 {
        width: 10%;
    }
    .column2 {
        width: 25%;
    }
    .column3 {
        width: 25%;
    }
    .column4 {
        width: 40%;
    }
    select {
        width: 10vw;
        height: 6vh;
    }
    .marginauto {
        display: flex;
        justify-content: space-around;
        align-content: center;
        
    }
    input[type=submit] {
        border: none;
        background-color: #6c7ae0;
        cursor: pointer;
        color: #fff;
        transition: .2s;
        width: 10vw;
        height: 6vh;
        margin: 0;
    }
    input[type=submit]:hover {
        background-color: #fff;
        color: #6c7ae0;
    }
</style>
        <%
            HttpSession s = request.getSession(false);
            List<Orders> listO = (List<Orders>)s.getAttribute("listO");
            List<DeliveryStaff> listDS = (List<DeliveryStaff>)s.getAttribute("listDS");
            int u=0;
            DecimalFormat df2 = new DecimalFormat("#.##");
            boolean noStaff = false;
            if(listDS.size()==0){
                noStaff = true;
            }
            
        %>
        <h1>Pending Order</h1>
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <tr class="row100 head">
                                <th class="cell100 column1"></th>
                                <th class="cell100 column2">Order ID</th>
                                <th class="cell100 column3">Customer ID</th>
                                <th class="cell100 column4">Staff ID</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listO.size(); i++) {
                                                    if(listO.get(i).getStatus()==1) {
                                                        u=i+1;
                                                        out.println("<tr>");
                                                        out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                        out.println("<td class=\"cell100 column2\">"+listO.get(i).getId()+"</td>");
                                                        out.println("<td class=\"cell100 column3\">"+listO.get(i).getCustomerId()+"</td>");
                                                        
                                                        if(noStaff){
                                                            out.println("<td class=\"cell100 column4\">No staff is available currently</td>");
                                                        } else {
                                                            out.println("<td class=\"cell100 column4\"><form class=\"marginauto\" action=\"AdminOrderAssign\" method=\"POST\"><div><select name=\"staffIndex\">");
                                                            for (int j = 0; j < listDS.size(); j++) {
                                                                    out.println("<option value="+j+">"+listDS.get(j).getId()+"</option>");
                                                                }
                                                            out.println("</select></div><input type=\"hidden\" value="+i+" name=\"orderIndex\" /><input type=\"submit\" value=\"Assign\" /></form></td>");
                                                        }
                                                        out.println("</tr>");
                                                    }
                                                }
                                        %>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>