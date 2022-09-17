package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import java.sql.ResultSet;
import java.time.*;


public class Servelet_AddPatient extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            // getting input from "AddPatient.jsp" page......
          
                      
            String pid = request.getParameter("pid");
            DBConnect dbRid = new DBConnect();
            boolean isIDExist = false;
            String queryRid = "select * from patient;";
             ResultSet resultSet = dbRid.readData(queryRid); 
            try{
                while(resultSet.next()){
                    if(pid.equals(resultSet.getString("PID"))){
                        isIDExist = true;
                    }
                }
            }catch(Exception e){}
            
            String fn = request.getParameter("fn");
            String ln = request.getParameter("ln");
            String dt = java.time.LocalDate.now().toString();;
            String rs = request.getParameter("rs");
            String wd = "None";       
            String pty = request.getParameter("pTy");
            int bn = 0;
            
            DBConnect dbWB = new DBConnect();
            boolean isBedReserved = false;
            boolean isBeNoExceded = false;
            String queryBed = "";
            ResultSet resBed = null;
            
            DBConnect dbBNN = new DBConnect();
            String queryBNN = "";
            ResultSet resBNN = null;
            
            if("Admit".equals(pty)){

                wd = request.getParameter("wd");
                bn = Integer.parseInt(request.getParameter("bn"));
                
                queryBed = "select * from ward where WID='"+wd+"';";
                resBed = dbWB.readData(queryBed);
                
                queryBNN = "select * from patient where Ward='"+wd+"' && STS != 'Discharged';";
                resBNN = dbBNN.readData(queryBNN);
                try {
                    while(resBed.next()){
                        if(bn > Integer.parseInt(resBed.getString("NofB"))){
                            isBeNoExceded = true;
                        }
                    }
                    while(resBNN.next()){
                        if(bn == Integer.parseInt(resBNN.getString("BedNo"))){
                            isBedReserved = true;
                        }
                    }
                } catch (Exception e) {
                }
                
            }
            //     String wd = request.getParameter("wd");
            //   int bn = Integer.parseInt(request.getParameter("bn"));
            //   String rs = request.getParameter("rs");
            //     String wd = request.getParameter("wd");
            //   int bn = Integer.parseInt(request.getParameter("bn"));
            //  }
            // String dt,bn,wd,
            //String pty = request.getParameter("pTy");
            // if ("Admit".equals(pty)) {
            //String dt = request.getParameter("dt");
            //   String rs = request.getParameter("rs");
            //     String wd = request.getParameter("wd");
            //   int bn = Integer.parseInt(request.getParameter("bn"));
            //  }

            int cn = Integer.parseInt(request.getParameter("cn"));
            String st = request.getParameter("st");
            String em = request.getParameter("em");
            PKGenerator pk = new PKGenerator();
            // Setting db connection and set the query
            DBConnect db = new DBConnect();
            String query = "insert into patient values ('" + pid + "','" + fn + "','" + ln + "','" + wd + "','" + dt + "','" + rs + "','" + cn + "','" + st + "','" + bn + "','"+em+"','"+pk.getPrimarykey()+"');";
            if(!isIDExist && !isBeNoExceded && !isBedReserved){
                db.insertData(query, out);
            }else if(isIDExist && isBeNoExceded) {
                out.print("<h2 style='text-align:center; margin-top:10%; color:red'> ' Patient ' ID already Exists and <br/> 'Number of beds' are Exeeded  </h2>");
            }else if (isIDExist && isBedReserved){
                out.print("<h2 style='text-align:center; margin-top:10%; color:red'> ' Patient ' ID already Exists and <br/> 'Bed' is Already Reserved  </h2>");
            }else if(isIDExist){
                out.print("<h2 style='text-align:center; margin-top:10%; color:red'> ' Patient ' ID already Exists and  </h2>");
            }else if(isBeNoExceded){
                 out.print("<h2 style='text-align:center; margin-top:10%; color:red'> 'Number of Beds' are Exeeded </h2>");
            }else if (isBedReserved){
                 out.print("<h2 style='text-align:center; margin-top:10%; color:red'> 'Bed' is already Reserved  </h2>");
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
