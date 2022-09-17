
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import javax.servlet.http.HttpSession;


public class Servelet_Suggestions extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
            PKGenerator pk = new PKGenerator();
            HttpSession session = request.getSession();
            String userID = session.getAttribute("_userid").toString();
            String type = session.getAttribute("_userstatus").toString();
            String sub = request.getParameter("su");
            String con = request.getParameter("cn");
            String date = java.time.LocalDate.now().toString();
            
            String query = "insert into suggestions values ('"+pk.getPrimarykey()+"','"+sub+"','"+con+"','"+date+"','"+userID+"','"+type+"');";
            DBConnect db = new DBConnect();
            db.insertData(query,out);
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
