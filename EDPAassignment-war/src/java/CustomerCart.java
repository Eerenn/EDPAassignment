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
@WebServlet(urlPatterns = {"/CustomerCart"})
public class CustomerCart extends HttpServlet {

    @EJB
    private ProductFacade productFacade;
    
    @EJB
    private OrdersFacade ordersFacade;

    @EJB
    private ProductOrderFacade productOrderFacade;
    
    
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
        List<ProductOrder> listPO = productOrderFacade.findAll();
        List<Orders> listOrder = ordersFacade.findAll();
        List<Orders> userOrder = new ArrayList<Orders>();
        Orders takeOrder = null;
//        String query = request.getParameter("search");
        
        for(int i=0; i<listOrder.size();i++){
            if(listOrder.get(i).getCustomerId().equals(user.getId())){
                userOrder.add(listOrder.get(i));
            }
        }
        if(userOrder.size()>0 ){
              for (int i = 0; i < userOrder.size(); i++) {
                  if(userOrder.get(i).getStatus()==0){
                      takeOrder = userOrder.get(i);
                  }
              }
        } 
        
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Cart</title>");   
            out.println("<link rel=\"stylesheet\" href=\"css/Header.css\" />");    
            out.println("<link rel=\"stylesheet\" href=\"css/Table.css\" />");  
            out.println("<link rel=\"stylesheet\" href=\"css/main.css\" />");
            out.println("<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>");
            out.println("<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap\" rel=\"stylesheet\">");             
            out.println("</head>");
            out.println("<body>");
            request.getRequestDispatcher("CustomerHeader.jsp").include(request, response);
            out.println("<center><h1>Order Cart</h1></center>");
            
            s.setAttribute("productList", listP);
            s.setAttribute("cartList", listPO);
            s.setAttribute("orderObj", takeOrder);
            if(takeOrder!= null){
                request.getRequestDispatcher("CustomerCartTable.jsp").include(request, response);
                
            } else {
                request.getRequestDispatcher("CustomerEmptyCartTable.jsp").include(request, response);
            }
            out.println("</body>");
            out.println("</html>");
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
