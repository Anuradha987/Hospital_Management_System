
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import java.sql.ResultSet;

public class Servelet_AddStaff extends HttpServlet {

       final String secretKey = "secrete";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
             AESEncryptionDecryption aesEncryptionDecryption = new AESEncryptionDecryption();
             
            
              // getting input from "AddStaff.jsp" page......
             PKGenerator pk = new PKGenerator();
            String sid = request.getParameter("sid");
            
            DBConnect dbRid = new DBConnect();
            boolean isIDExist = false;
            String queryRid = "select * from staff;";
            ResultSet resultSet = dbRid.readData(queryRid); 
            try{
                while(resultSet.next()){
                    if(sid.toLowerCase().equals(resultSet.getString("STID").toLowerCase())){
                        isIDExist = true;
                    }
                }
            }catch(Exception e){}
            
            String fn = request.getParameter("fn");
            String ln = request.getParameter("ln");
            String wd = request.getParameter("wd");
            String lcn = request.getParameter("lcn");
            
            DBConnect dbRid1 = new DBConnect();
            boolean isIDExist1 = false;
            String queryRid1 = "select * from staff;";
             ResultSet resultSet1 = dbRid1.readData(queryRid1); 
            try{
                while(resultSet1.next()){
                    if(lcn.toLowerCase().equals(resultSet1.getString("LycNO").toLowerCase())){
                        isIDExist1 = true;
                    }
                }
            }catch(Exception e){}
            
            String pw = aesEncryptionDecryption.encrypt(request.getParameter("pw"), secretKey) ;
            int cn = Integer.parseInt(request.getParameter("cn"));
            String st = request.getParameter("st");
            String ID = pk.getPrimarykey();
            
            // Setting db connection and set the query
            DBConnect db = new DBConnect();
            String query = "insert into staff values ('"+sid+"','"+fn+"','"+ln+"','"+wd+"','"+lcn+"','"+cn+"','"+pw+"','"+st+"','Offline','"+ID+"');";
            //db.insertData(query, out);
            if(!isIDExist && !isIDExist1){
                db.insertData(query, out);
            }else if(isIDExist && isIDExist1){
                out.print("<h2 style='text-align:center; margin-top:10%; color:red'> Staff ID and license Number already Exists  </h2>");
            }else if(isIDExist1){
                 out.print("<h2 style='text-align:center; margin-top:10%; color:red'> License Number already Exists  </h2>");
            }else if(isIDExist){
                 out.print("<h2 style='text-align:center; margin-top:10%; color:red'> Staff ID already Exists  </h2>");
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
