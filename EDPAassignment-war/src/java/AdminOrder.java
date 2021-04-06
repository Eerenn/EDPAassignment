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
import model.DeliveryStaff;
import model.DeliveryStaffFacade;
import model.Orders;
import model.OrdersFacade;

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/AdminOrder"})
public class AdminOrder extends HttpServlet {
    
    @EJB
    private OrdersFacade ordersFacade;
    
    @EJB
    private DeliveryStaffFacade deliveryStaffFacade;
    
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
            List<DeliveryStaff> listDS = deliveryStaffFacade.findAll();
            List<Orders> listO = ordersFacade.findAll();
            List<DeliveryStaff> availableDS = new ArrayList<DeliveryStaff>();
            
            for (int i = 0; i < listDS.size(); i++) {
                if(listDS.get(i).getAvailability().equals(true)) {
                    availableDS.add(listDS.get(i));
                }
        }
            
            s.setAttribute("listDS", availableDS);
            s.setAttribute("listO", listO);
            
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminOrder</title>");
            out.println("<link rel=\"stylesheet\" href=\"css/Header.css\" />");
            out.println("<link rel=\"stylesheet\" href=\"css/main.css\" />");
            out.println("<link rel=\"stylesheet\" href=\"css/Table.css\" />");
            out.println("<link rel=\"stylesheet\" href=\"css/Form.css\" />");
            out.println("<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap\" rel=\"stylesheet\">");
            out.println("</head>");
            out.println("<body>");
            request.getRequestDispatcher("AdminHeader.jsp").include(request, response);
            request.getRequestDispatcher("AdminOrderTable.jsp").include(request, response);
            
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
