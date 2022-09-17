package Clases;


import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.io.PrintWriter;

public class DBConnect {

    //Connection con;
    String Driver = "com.mysql.jdbc.Driver";
    String conString = "jdbc:mysql://localhost:3306/hospital";
    String un = "root";
    String pass = "";

    public void insertData(String query, PrintWriter pw) {
        try {
            Class.forName(Driver);
            Connection conn = DriverManager.getConnection(conString, un, pass);
            Statement st = conn.createStatement();

            int i = st.executeUpdate(query);
            pw.print("<img src='CssImages/icons8-checkmark-96.png' style='margin-left:47%; margin-top: 10%;'/>");
            pw.print("<h1 style='color:green; text-align:center; margin-top:2%'>Data Succesfully Inserted ! </h1>");
//            HttpServletResponse response = null;
//            response.sendRedirect("Success.html");
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
            pw.print(e);
        }
    }
    // overrited method ......
    public void insertData(String query) {
        try {
            Class.forName(Driver);
            Connection conn = DriverManager.getConnection(conString, un, pass);
            Statement st = conn.createStatement();

            int i = st.executeUpdate(query);
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }

    public ResultSet readData(String query) {
        ResultSet res = null;
        try {
            Class.forName(Driver);
            Connection conn = DriverManager.getConnection(conString, un, pass);
            Statement stmt = conn.createStatement();
            res = stmt.executeQuery(query);
        } catch (Exception e) {

        }
        return res;
    }
    public String displayData(String q){
        return q;
    }

}
