
package Servelet;

import Clases.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Servelet_UpdateNurse extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String stid = request.getParameter("stid");
            String fn= request.getParameter("fn");
            String ln = request.getParameter("ln");
            String wd = request.getParameter("wd");
            String lcn = request.getParameter("lcn");
            int cn = Integer.parseInt(request.getParameter("cn"));
            String pw = request.getParameter("pw");
            String avai = request.getParameter("avai");
            
            DBConnect db = new DBConnect();
            String query = "Update staff set Avai = '"+avai+"', FN='"+fn+"',LN='"+ln+"',Ward='"+wd+"',LycNo='"+lcn+"',CN="+cn+",PW='"+pw+"' where STID = '"+stid+"'; ";
            db.insertData(query,out);
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
