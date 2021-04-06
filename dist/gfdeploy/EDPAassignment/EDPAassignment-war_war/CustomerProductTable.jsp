<%-- 
    Document   : CustomerProductTable
    Created on : Oct 16, 2020, 3:12:39 PM
    Author     : Ee ren
--%>
<%@page import="java.text.DecimalFormat"%>
<style>
    .column1 {
        width: 10%;
    }
    .column2 {
        width: 20%;
    }
    .column3 {
        width: 10%;
    }
    .column4 {
        width:40%;
    }
    .column5 {
        width: 20%;
    }
    input[type=number] {
        width: 3vw;
    }
    .marginauto {
        margin: 0 auto;
        display: flex;
        justify-content: space-around;
    }
    input[type=submit] {
        border: none;
        background-color: #6c7ae0;
        cursor: pointer;
        color: #fff;
        transition: .2s;
    }
    input[type=submit]:hover {
        background-color: #fff;
        color: #6c7ae0;
    }
</style>
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
                                <th class="cell100 column2">Quantity</th>
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
                                                out.println("<td class=\"cell100 column2\">"+listP.get(i).getName()+"</td>");
                                                out.println("<td class=\"cell100 column3\">"+df2.format(listP.get(i).getPrice())+"</td>");
                                                out.println("<td class=\"cell100 column4\">"+listP.get(i).getDescription()+"</td>");
                                                out.println("<td class=\"cell100 column5\">"
                                                        + "<form class=\"marginauto\" action=\"CustomerHome\" id="+listP.get(i).getName()+" method=\"POST\"> "
                                                                + "<input  id="+listP.get(i).getName()+" type=\"number\" name=\"quantity\" min=\"1\" value=\"1\" />"
                                                                        + "<input type=\"hidden\" value="+listP.get(i).getId()+" name=\"item\">"
                                                                + "<input type=\"submit\" value=\"Add\" onclick=\"addProduct()\".submit() /></form></td>");
                                                        
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