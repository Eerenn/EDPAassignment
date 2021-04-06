<%-- 
    Document   : AdminCustomerTable
    Created on : Oct 14, 2020, 10:53:13 AM
    Author     : Ee ren
--%>

<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .column1 {
        width: 5%;
    }
    .column2 {
        width: 10%;
    }
    .column3 {
        width: 20%;
    }
    .column4 {
        width: 10%;
    }
    .column5 {
        width: 20%;
    }
    .column6 {
        width: 20%;
    }
    .column7 {
        width: 15%;
    }
</style>
        <%
            HttpSession s = request.getSession(false);
            List<Customer> listC = (List<Customer>)s.getAttribute("customerList");
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
                                <th class="cell100 column2">Customer ID</th>
                                <th class="cell100 column3">Name</th>
                                <th class="cell100 column4">Gender</th>
                                <th class="cell100 column5">Email</th>
                                <th class="cell100 column6">Address</th>
                                <th class="cell100 column7">Phone No.</th>
                                </tr>
                            </table>
                        </div>
                        <div class="table100-body js-pscroll">
                            
                                <table>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listC.size(); i++) {
                                                u=i+1;
                                                out.println("<tr class=\"row100 body\">");
                                                out.println("<td class=\"cell100 column1\">"+u+"</td>");
                                                out.println("<td class=\"cell100 column2\">"+listC.get(i).getId()+"</td>");
                                                out.println("<td class=\"cell100 column3\">"
                                                        + "<form name="+listC.get(i).getName()+" action=\"AdminCustomerFunction.jsp\" method=\"POST\">"
//                                                        + "<input type=\"hidden\" value="+listDS.get(i).getId()+" name=\"id\"/>"
                                                        + "<input type=\"hidden\" value="+i+" name=\"index\"/>"
//                                                        + "<input type=\"hidden\" value="+listDS.get(i).getName()+" name=\"name\"/>"
//                                                        + "<input type=\"hidden\" value="+listDS.get(i).getEmail()+" name=\"email\"/>"
                                                        + " <span class=\"submitBtn\" onclick="+listC.get(i).getName()+".submit()>"+listC.get(i).getName()+"</span></form></td>");
                                                
                                                        
                                                
                                                if(listC.get(i).getGender()==1){
                                                    out.println("<td class=\"cell100 column4\">M</td>");
                                                } else {
                                                    out.println("<td class=\"cell100 column4\">F</td>");
                                                }
    //                                            out.println("<td class=\"cell100 column3\">"+listDS.get(i).getGender()+"</td>");
                                                out.println("<td class=\"cell100 column5\">"+listC.get(i).getEmail()+"</td>");
                                                out.println("<td class=\"cell100 column6\">"+listC.get(i).getAddress()+"</td>");
                                                out.println("<td class=\"cell100 column7\">"+listC.get(i).getNumber()+"</td>"
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