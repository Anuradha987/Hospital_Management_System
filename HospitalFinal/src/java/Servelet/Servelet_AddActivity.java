/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import javax.servlet.http.HttpSession;

public class Servelet_AddActivity extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            PKGenerator pk = new PKGenerator();
            
            // getting values from AddActivity.jsp ..
            String pid = request.getParameter("pid");
            
            // setting primary key from db from PKGenerator class
            String id = pk.getPrimarykey(pid);
            
             // getting values from AddActivity.jsp ..
            String ac = request.getParameter("ac");
            String nurseID = session.getAttribute("_userid").toString();
            String date = java.time.LocalDate.now().toString();
            String time = java.time.LocalTime.now().toString();
            
            // setting up db connection and adding data to db
            DBConnect db = new DBConnect();
            String query = "insert into activity values ('"+id+"','"+ac+"','"+nurseID+"','"+date+"','"+time+"','"+pid+"');";
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
