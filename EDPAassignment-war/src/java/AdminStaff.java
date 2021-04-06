
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

/**
 *
 * @author Ee ren
 */
@WebServlet(urlPatterns = {"/AdminStaff"})
public class AdminStaff extends HttpServlet {

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
        List<DeliveryStaff> listDS = deliveryStaffFacade.findAll();
        
        HttpSession s = request.getSession(false);
        
        String query = request.getParameter("search");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Admin Staff</title>");   
            out.println("<link rel=\"stylesheet\" href=\"css/Header.css\" />");    
            out.println("<link rel=\"stylesheet\" href=\"css/Table.css\" />");  
            out.println("<link rel=\"stylesheet\" href=\"css/main.css\" />");
            out.println("<script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>");
            out.println("<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap\" rel=\"stylesheet\">");     
            out.println("</head>");
            out.println("<body>");
            request.getRequestDispatcher("AdminHeader.jsp").include(request, response);
            out.println("<h1>Delivery Staff</h1>");
            request.getRequestDispatcher("AdminStaffNav.jsp").include(request, response);
            if(query!=null) {
                List<DeliveryStaff> queryList = new ArrayList<DeliveryStaff>();
                for (int i = 0; i < listDS.size(); i++) {
                    if(listDS.get(i).getName().contains(query))
                        queryList.add(listDS.get(i));
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
"                                <th class=\"cell100 column2\">Name</th>\n" +
"                                <th class=\"cell100 column3\">Gender</th>\n" +
"                                <th class=\"cell100 column4\">Email</th>\n" +
"                                </tr>\n" +
"                            </table>\n" +
"                        </div>\n" +
"                        <div class=\"table100-body js-pscroll\">\n" +
"                            <table>\n" +
"                                <tbody>\n" +
"                                     <tr class=\"row100 body\">\n" +
"                                          <td class=\"cell100 column4\" col-span\"4\">Staff was not found</td>" +
"                                     </tr>\n" +
"                                </tbody>\n" +
"                            </table>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>");
                } else {
                    s.setAttribute("staffList", queryList);
                    request.getRequestDispatcher("AdminStaffTable.jsp").include(request, response);
                }
            } else {
                
                s.setAttribute("staffList", listDS);
                request.getRequestDispatcher("AdminStaffTable.jsp").include(request, response);
                
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
