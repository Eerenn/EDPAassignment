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
import model.Customer;
import model.CustomerFacade;
import model.DeliveryStaff;
import model.DeliveryStaffFacade;

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

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
        
        String loginName = request.getParameter("name");
        String loginPassword = request.getParameter("password");
        DeliveryStaff ds = null;
        Customer c = null;
        
        List<DeliveryStaff> allStaff = deliveryStaffFacade.findAll();
        List<Customer> allCus = customerFacade.findAll();
        for(int i=0; i<allStaff.size(); i++) {
            if (allStaff.get(i).getName().equals(loginName)){
                ds = allStaff.get(i);
                break;
            }
        }
        for(int i=0;i<allCus.size();i++) {
            if(allCus.get(i).getName().equals(loginName)){
                c = allCus.get(i);
                break;
            }
        }
        try (PrintWriter out = response.getWriter()) {
            if(ds == null && c == null){
                if(loginName.equals("admin")&& loginPassword.equals("admin")){
                    request.getRequestDispatcher("AdminOrder").forward(request, response);
                    
                } else {
                request.getRequestDispatcher("Login.jsp").include(request, response);
                out.println("<script>alert('Invalid Username');</script>");
                }
                
            } else if(ds!=null) {
                if(ds.getPassword().equals(loginPassword)){
                    HttpSession s = request.getSession();
                    s.setAttribute("user", ds);
//                    request.getRequestDispatcher("StaffRedirect.jsp").forward(request, response);
                    out.println("<script>window.location='Home'</script>");
                } else {
                    request.getRequestDispatcher("Login.jsp").include(request, response);
                    out.println("<script>alert('Sorry, wrong credential');</script>");

                }
            } else if (c!=null){
                if(c.getPassword().equals(loginPassword)){
                    HttpSession s = request.getSession();
                    s.setAttribute("user", c);
//                    request.getRequestDispatcher("StaffRedirect.jsp").forward(request, response);
                    out.println("<script>window.location='CustomerHome'</script>");
                } else {
                    request.getRequestDispatcher("Login.jsp").include(request, response);
                    out.println("<script>alert('Sorry, wrong credential');</script>");

                }
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
