
package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clases.*;
import java.sql.ResultSet;

public class Servelet_AddWard extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String wd = request.getParameter("wid");
            DBConnect dbRid = new DBConnect();
            boolean isIDExist = false;
            String queryRid = "select * from ward;";
            ResultSet resultSet = dbRid.readData(queryRid); 
            try{
                while(resultSet.next()){
                    if(wd.toLowerCase().equals(resultSet.getString("WID").toLowerCase())){
                        isIDExist = true;
                    }
                }
            }catch(Exception e){}
            int beds = Integer.parseInt(request.getParameter("nob"));
            DBConnect db = new DBConnect();
            PKGenerator pk = new PKGenerator();
            String query = "insert into ward values('"+wd+"','"+beds+"','"+pk.getPrimarykey()+"');";
            //db.insertData(query, out);
            if(!isIDExist){
                db.insertData(query, out);
            }else{
                out.print("<h2 style='text-align:center; margin-top:10%; color:red'> Ward already Exists  </h2>");
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
