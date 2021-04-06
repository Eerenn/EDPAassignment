/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerFacade;

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/AdminCustomerFunction"})
public class AdminCustomerFunction extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;
    
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
        Customer c = (Customer)s.getAttribute("user");
        String newName = request.getParameter("name");
        String newEmail = request.getParameter("email");
        String newAddress = request.getParameter("address");
        Long newNumber = Long.parseLong(request.getParameter("number"));
        String delete = request.getParameter("delete");
        
        if(delete.equals("del")){
            customerFacade.remove(c);
            
        } else {
            c.setEmail(newEmail);
            c.setName(newName);
            c.setAddress(newAddress);
            c.setNumber(newNumber);
            
            customerFacade.edit(c);
        }
        
        try (PrintWriter out = response.getWriter()) {
//            request.getRequestDispatcher("AdminHome.jsp").forward(request, response);

            out.println("<script>window.location='AdminCustomer?search=0'</script>");
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
