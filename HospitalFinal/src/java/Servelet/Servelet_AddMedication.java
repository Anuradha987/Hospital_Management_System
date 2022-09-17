
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.*;
import Clases.*;
import java.sql.ResultSet;

public class Servelet_AddMedication extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
          String mn = request.getParameter("mid");
          DBConnect db2 = new DBConnect();
          String query2 = "select * from medicine where NM = '"+mn+"';";
          int Price = 0;
          ResultSet res = db2.readData(query2);
          try{
              while(res.next()){
                  Price = Integer.parseInt(res.getString("EP").toString());
              }
          }catch(Exception e){
              
          }
         HttpSession session = request.getSession();
         PKGenerator pk = new PKGenerator();
         // getting input from "AddMedication.jsp"        
        
         String id = pk.getPrimarykey(mn);
         // getting primary key for db from PKGenerator class
         String pid = request.getParameter("pid");       
         int qun = Integer.parseInt(request.getParameter("qn"));
         String did = session.getAttribute("_userid").toString();
         // getting time and date from system
         String date = java.time.LocalDate.now().toString();
         String time = java.time.LocalTime.now().toString();
         
         DBConnect db = new DBConnect();
         String query = "insert into medication values ('"+id+"','"+did+"','"+pid+"','"+mn+"','"+date+"','"+time+"','"+qun+"','Not_Delevered','"+Price*qun+"');";
         db.insertData(query, out);
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
