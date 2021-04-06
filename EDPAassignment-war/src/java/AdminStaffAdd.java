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
import model.DeliveryStaff;
import model.DeliveryStaffFacade;

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/AdminStaffAdd"})
public class AdminStaffAdd extends HttpServlet {

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
        
        String addEmail = request.getParameter("email");
        String addName = request.getParameter("name");
        String addPassword = request.getParameter("password");
        int gender = Integer.parseInt(request.getParameter("gender"));
        List<DeliveryStaff> listDS = deliveryStaffFacade.findAll();
        
        Boolean match = false;
        for (int i = 0; i < listDS.size(); i++) {
            if(listDS.get(i).getName().equals(addName)) {
                match = true;
                break;
            }
        }
        
        
        
        try (PrintWriter out = response.getWriter()) {
//            request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            if(!match) {
                DeliveryStaff ds = new DeliveryStaff(addName, addPassword, addEmail, gender, true);
                deliveryStaffFacade.create(ds);
                out.println("<script>window.location='AdminStaff'</script>");
            } else {
                out.println("<script>alert('this username had been used'); window.location='AdminStaff'</script>");

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
