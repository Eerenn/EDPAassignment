<%-- 
    Document   : AdminFeedbackTable
    Created on : Oct 18, 2020, 6:34:36 PM
    Author     : Ee ren
--%>

<%@page import="model.Feedback"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .column1 {
        width: 10%;
    }
    .column2 {
        width: 15%;
    }
    .column3 {
        width: 60%;
    }
    .column4 {
        width: 15%;
    }
</style>
<%
  HttpSession s = request.getSession(false);
  List<Feedback> listF = (List<Feedback>)s.getAttribute("listF");
  int u=0;
%>
<h1>Feedback</h1>
<div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <tr class="row100 head">
                                <th class="cell100 column1"></th>
                                <th class="cell100 column2">Order ID</th>
                                <th class="cell100 column3">Comments</th>
                                <th class="cell100 column4">Rating</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listF.size(); i++) {
                                                u=i+1;
                                                out.println("<tr class=\"row100 body\">");
                                                out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                out.println("<td class=\"cell100 column2\">"+listF.get(i).getOrderId()+"</td>");
                                                out.println("<td class=\"cell100 column3\">"+listF.get(i).getContent()+"</td>");
                                                out.println("<td class=\"cell100 column4\">"+listF.get(i).getRating()+"</td>");
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