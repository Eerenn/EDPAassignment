/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DeliveryStaff;
import model.DeliveryStaffFacade;
import model.Orders;
import model.OrdersFacade;

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/AdminOrderAssign"})
public class AdminOrderAssign extends HttpServlet {

    @EJB
    private DeliveryStaffFacade deliveryStaffFacade;
    
    @EJB
    private OrdersFacade ordersFacade;
    
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
        int staffIndex = Integer.parseInt(request.getParameter("staffIndex"));
        int orderIndex = Integer.parseInt(request.getParameter("orderIndex"));
        List<DeliveryStaff> listDS = (List<DeliveryStaff>)s.getAttribute("listDS");
        List<Orders> listO = (List<Orders>)s.getAttribute("listO");
        DeliveryStaff ds = listDS.get(staffIndex);
        Orders orders = listO.get(orderIndex);
//        
        orders.setStaffId(ds.getId());
        orders.setStatus(2);
        ordersFacade.edit(orders);
        
        ds.setAvailability(Boolean.FALSE);
        deliveryStaffFacade.edit(ds);
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<script>alert('Delivery Staff is assigned');window.location='AdminOrder'</script>");
            
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
