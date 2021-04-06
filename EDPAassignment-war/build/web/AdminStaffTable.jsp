<%-- 
    Document   : AdminStaffTable
    Created on : Oct 13, 2020, 6:02:35 PM
    Author     : Ee ren
--%>

<%@page import="java.util.List"%>
<%@page import="model.DeliveryStaff"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    .column1 {
        width: 8%;
    }
    .column2 {
        width: 15%;
    }
    .column3 {
        width: 30%;
    }
    .column4 {
        width: 17%
    }
    .column5 {
        width: 30%;
    }
</style>        
        <%
            HttpSession s = request.getSession(false);
            List<DeliveryStaff> listDS = (List<DeliveryStaff>)s.getAttribute("staffList");
            int u=0;
            
            
        %>
        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100 ver1 m-b-110">
                        <div class="table100-head">
                            <table>
                                <tr class="row100 head">
                                <th class="cell100 column1"></th>
                                <th class="cell100 column2">Staff ID</th>
                                <th class="cell100 column3">Name</th>
                                <th class="cell100 column4">Gender</th>
                                <th class="cell100 column5">Email</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listDS.size(); i++) {
                                                u=i+1;
                                                out.println("<tr class=\"row100 body\">");
                                                out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                out.println("<td class=\"cell100 column2\">"+listDS.get(i).getId()+"</td>");
                                                out.println("<td class=\"cell100 column3\">"
                                                        + "<form name="+listDS.get(i).getName()+" action=\"AdminStaffFunction.jsp\" method=\"POST\">"
//                                                        + "<input type=\"hidden\" value="+listDS.get(i).getId()+" name=\"id\"/>"
                                                        + "<input type=\"hidden\" value="+i+" name=\"index\"/>"
//                                                        + "<input type=\"hidden\" value="+listDS.get(i).getName()+" name=\"name\"/>"
//                                                        + "<input type=\"hidden\" value="+listDS.get(i).getEmail()+" name=\"email\"/>"
                                                        + " <span class=\"submitBtn\" onclick="+listDS.get(i).getName()+".submit()>"+listDS.get(i).getName()+"</span></form></td>");
                                                
                                                        
                                                
                                                if(listDS.get(i).getGender()==1){
                                                    out.println("<td class=\"cell100 column4\">Male</td>");
                                                } else {
                                                    out.println("<td class=\"cell100 column3\">Female</td>");
                                                }
    //                                            out.println("<td class=\"cell100 column3\">"+listDS.get(i).getGender()+"</td>");
                                                out.println("<td class=\"cell100 column5\">"+listDS.get(i).getEmail()+"</td>"
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