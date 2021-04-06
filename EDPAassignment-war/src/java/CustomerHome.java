/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.persistence.criteria.Order;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Orders;
import model.OrdersFacade;
import model.Product;
import model.ProductFacade;
import model.ProductOrder;
import model.ProductOrderFacade;

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/CustomerHome"})
public class CustomerHome extends HttpServlet {

    @EJB
    private OrdersFacade ordersFacade;

    @EJB
    private ProductOrderFacade productOrderFacade;
    
    @EJB
    private ProductFacade productFacade;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession s = request.getSession(false);
        Customer user = (Customer)s.getAttribute("user");
        List<Product> listP = productFacade.findAll();
        String query = request.getParameter("search");
        String addItem = request.getParameter("item");
        String addQuantity = request.getParameter("quantity");
        
        List<Orders> listOrder = ordersFacade.findAll();
        List<Orders> userOrder = new ArrayList<Orders>();
        Orders takeOrder = null;
        ProductOrder productOrder = null;
        Boolean check = false;
//        String fk ="kau";

        if(addItem != null) {
            userOrder.clear();
            for(int i=0; i<listOrder.size();i++){
                if(listOrder.get(i).getCustomerId().equals(user.getId())){
                    userOrder.add(listOrder.get(i));
                }
            }
                if(userOrder.size()>0 ){
                    for (int i = 0; i < userOrder.size(); i++) {
                        if(userOrder.get(i).getStatus()==0){
                            takeOrder = userOrder.get(i);
                            productOrder = new ProductOrder(takeOrder.getId(), Long.parseLong(addItem), Integer.parseInt(addQuantity));
                            productOrderFacade.create(productOrder);
                            check = true;
                            break;
                        } 
                    }
                    if(!check){
                        takeOrder = new Orders(user.getId(), 0L, 0);
                        ordersFacade.create(takeOrder);
                        productOrder = new ProductOrder(takeOrder.getId(), Long.parseLong(addItem), Integer.parseInt(addQuantity));
                        productOrderFacade.create(productOrder);
                    }
                } else {
                    takeOrder = new Orders(user.getId(), 0L, 0);
                    ordersFacade.create(takeOrder);
                    productOrder = new ProductOrder(takeOrder.getId(), Long.parseLong(addItem), Integer.parseInt(addQuantity));
                    productOrderFacade.create(productOrder);
                }
        }
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Home</title>");   
            out.println("<link rel=\"stylesheet\" href=\"css/Header.css\" />");    
            out.println("<link rel=\"stylesheet\" href=\"css/Table.css\" />");  
            out.println("<link rel=\"stylesheet\" href=\"css/main.css\" />");
            out.println("<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>");
            out.println("<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap\" rel=\"stylesheet\">");             
            out.println("</head>");
            out.println("<body>");
            request.getRequestDispatcher("CustomerHeader.jsp").include(request, response);
            out.println("<center><h1>Welcome back, "+user.getName()+"</h1></center>");
            request.getRequestDispatcher("CustomerProductNav.jsp").include(request, response);
//            out.println(fk);
            if(query!=null) {
                List<Product> queryList = new ArrayList<Product>();
                for (int i = 0; i < listP.size(); i++) {
                    if(listP.get(i).getName().contains(query))
                        queryList.add(listP.get(i));
                }
                if(queryList.isEmpty()){
                    out.println(""
        + "<div class=\"limiter\">\n" +
"            <div class=\"container-table100\">\n" +
"                <div class=\"wrap-table100\">\n" +
"                    <div class=\"table100 ver1 m-b-110\">\n" +
"                        <div class=\"table100-head\">\n" +
"                            <table>\n" +
"                                <tr class=\"row100 head\">\n" +
"                                <th class=\"cell100 column1\"></th>\n" +
"                                <th class=\"cell100 column2\">Item</th>\n" +
"                                <th class=\"cell100 column3\">Price</th>\n" +
"                                <th class=\"cell100 column4\">Description</th>\n" +
"                                </tr>\n" +
"                            </table>\n" +
"                        </div>\n" +
"                        <div class=\"table100-body js-pscroll\">\n" +
"                            <table>\n" +
"                                <tbody>\n" +
"                                     <tr class=\"row100 body\">\n" +
"                                          <td class=\"cell100 column4\" col-span\"4\">Item was not found</td>" +
"                                     </tr>\n" +
"                                </tbody>\n" +
"                            </table>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>");
                } else {
                    s.setAttribute("productList", queryList);
                    request.getRequestDispatcher("CustomerProductTable.jsp").include(request, response);
                }
            } else {
                
                s.setAttribute("productList", listP);
                request.getRequestDispatcher("CustomerProductTable.jsp").include(request, response);
                
            }
            out.println("</body>");
            out.println("</html>");
            if(addItem!= null) {
//                out.println("<script>alert('Item added to cart')</script>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
