
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Servelet_AddMedecine extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            // getting input from "AddMedicine.htmll"
            String mid = request.getParameter("mid");
            String nm = request.getParameter("mn");
            int qn = Integer.parseInt(request.getParameter("qn"));
            String uom = request.getParameter("uom");
            String epri = request.getParameter("pri");
            PKGenerator pk = new PKGenerator();
            
            // setting up db and set query ....
            String query = "insert into Medicine values ('"+mid+"','"+nm+"','"+qn+"','"+uom+"','"+epri+"','"+pk.getPrimarykey()+"');";
            DBConnect db = new DBConnect();
            db.insertData(query, out);
                
//            String email = "hollywoodkolla@gmail.com";
//            String sub = "Heyy";
//            String msgF = "Heyy mamamma";
//               
//            SendEmails.send(email,sub,msgF);
//            out.print("message has been sent successfully"); 
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
