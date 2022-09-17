package Clases;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;

public class SendEmailSer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String to = request.getParameter("em");
            String subject = "Medication Ready ";
            String message = " Your medication has been prepaired! Please come and collect !";
            String user = "hmangement5@gmail.com";
            String pass = "hos1234567";
            SendMail.send(to, subject, message, user, pass);
            
            out.println("Mail send successfully");

            
            
            
            
            
            
            
            
            
            
            
            
            
            // Uncomment from  here ..............
            DBConnect db1 = new DBConnect();
            DBConnect db2 = new DBConnect();
            DBConnect db3 = new DBConnect();
            DBConnect db4 = new DBConnect();
            DBConnect db5 = new DBConnect();
            DBConnect db6 = new DBConnect();
            DBConnect db7 = new DBConnect();
            DBConnect db8 = new DBConnect();
            DBConnect db9 = new DBConnect();
            DBConnect db10 = new DBConnect();

            String query1 = "";
            String query2 = "";
            String query3 = "";
            String query4 = "";
            String query5 = "";
            String query6 = "";
            String query7 = "";
            String query8 = "";
            String query9 = "";
            String query10 = "";

            String PatID = request.getParameter("pddd");
            query1 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query2 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query3 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query4 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query5 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query6 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query7 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query8 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query9 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            query10 = "update medication set STS='Delevered' where PID='" + PatID + "';";
            db1.insertData(query1);
            db2.insertData(query2);
            db3.insertData(query3);
            db4.insertData(query4);
            db5.insertData(query5);
            db6.insertData(query6);
            db7.insertData(query7);
            db8.insertData(query8);
            db9.insertData(query9);
            db10.insertData(query10);
            // to here.....................

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
