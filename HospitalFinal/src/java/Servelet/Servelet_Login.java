package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

public class Servelet_Login extends HttpServlet {

    final String secretKey = "secrete";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean isExist = false;

        // statring session to check userstatus;
        HttpSession session = request.getSession();
        // statring session to check userid ;
        HttpSession session2 = request.getSession();
        
         AESEncryptionDecryption aesEncryptionDecryption = new AESEncryptionDecryption();

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String un = request.getParameter("un");
           String pw =aesEncryptionDecryption.encrypt(request.getParameter("pw"), secretKey);
           // out.print(un + " " + pw);
            String userStatus = null;
            String query = "select * from staff;";
            DBConnect db = new DBConnect();
            ResultSet result = db.readData(query);
            if (un.equals("") || pw.equals("")) {
                out.print("<h2> 'Username' and 'Password' must be filled </h3>");
            } else {
                try {
                    while (result.next()) {
                        if (result.getString("LycNO").equals(un)) {
                            if (result.getString("PW").equals(pw)) {
                                isExist = true;
                                session.setAttribute("_userid", result.getString("STID"));
                                session.setAttribute("_userstatus", result.getString("STS"));
                                userStatus = result.getString("STS");
                            }
                        }
                    }
                    if (isExist) {
                        //response.sendRedirect("AddActivity.jsp");
                        //response.sendRedirect("AddStaff.jsp");
                        //response.sendRedirect("AddMedication.jsp");
                        // response.sendRedirect("AddDailyReport.jsp");
                        // response.sendRedirect("AddPatient.jsp");
                        //response.sendRedirect("AddDailyReport.jsp");
                        //response.sendRedirect("Patient.jsp"); // update only
                        //response.sendRedirect("AdminDoctor.jsp"); // back end 1/2 and update
                        //response.sendRedirect("AddMedecine.html");
                        //response.sendRedirect("AddWard.html");
                        //response.sendRedirect("Pharmacist.jsp");
                        //response.sendRedirect("AdminWard.jsp");
                        //response.sendRedirect("AdminNurse.jsp");
                        //response.sendRedirect("DoctorAndNurse.jsp");
                        //response.sendRedirect("AddComplains.html");
                        //response.sendRedirect("EM.html");
                        if (userStatus.equals("Receptionist")) {
                            response.sendRedirect("AddPatient.jsp");
                        } else if (userStatus.equals("Pharmacist")) {
                            response.sendRedirect("Pharmacist.jsp");
                        } else if (userStatus.equals("Doctor")) {
                            response.sendRedirect("DoctorAndNurse.jsp");
                        } else if (userStatus.equals("Nurse")) {
                            response.sendRedirect("DoctorAndNurse.jsp");
                        } else if (userStatus.equals("Admin")) {
                            response.sendRedirect("AdminWard.jsp");
                        }

                    } else {
                        out.print(" <h3> Credentials dosenot match ... </h3> ");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print(e);
                }
            }
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
