
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <style>
            body {
                margin: 0;
                padding: 0;
            }

            .sep2 {
                /* border: 1px solid;*/
                height: 88vh;
                float: left;
                width: 64%;
            }

            .tbl,
            .list {
                /* border: 1px solid;*/
                height: 40vh;
            }
            .tbl{
                border: 0px solid;
                width: 90%;
                margin-left: 3%;
                margin-top: 2%;
                background-color: rgb(245, 245, 245);
            }
            .list {
                height: 45vh;
            }

            select {
                padding: 0.4%;
                width: 20%;
                margin-left: 8%;
            }

            .btnPatL {
                border: none;
                padding: 0.7%;
                background-color: blue;
                color: white;
                width: 10%;
                cursor: pointer;
            }

            .lefDataList {
                /* border: 1px solid;*/
                height: 70%;
                overflow-y: scroll;
                width: 80%;
                margin-left: 10%;
            }

            .pb {
                border: none;
                padding: 1%;
                background-color: red;
                color: white;
                width: 100%;
                cursor: pointer;
            }

            .lefDet {
                /* border: 1px solid;*/
                height: 4vh;

            }

            .botSep {
                /* border: 1px solid;*/
                float: left;
                width: 16%;
                height: 100%;
            }

            .mn {
                width: 40%;
            }

            .lbl {
                margin: 0;
                font-family: verdana;
                font-size: 0.9rem;
                margin-left: 5%;
                margin-top: 1%;
            }

            .lblH {
                margin: 0;
                font-weight: bold;
                font-size: 1rem;
                margin-left: 5%;
                margin-top: 1%;
            }

            .tblHed {
                background-color:rgb(191, 0, 48);
                color: white;
                border: none;
            }

            .mn1 {
                width: 20%;
            }

            .hed {
                margin: 0;
                margin-left: 5%;
                margin-top: 1%;
            }

            .bilp {
                border: 3px solid goldenrod;
                height: 60vh;
                /*overflow-y: scroll;*/
            }

            .bolCon {
                /*border: 1px solid;*/
                height: 50vh;
                overflow-y: scroll;
            }
            .sema{
                border: none;
                background-color: goldenrod;
                padding: 1%;
                margin-top: 2%;
                margin-left: 5%;
                width:45%;
            }
            .navBarCon{
            border: 1px solid;
            height: 10vh;
            background-color: black;
            
        }
        .iconCon{
           /* border: 1px solid white;*/
            height: 100%;
            width:20%;
            margin-left: 5%;
            float: left;
            
        }
        img{
            height: 7vh;
            margin-top: 10%;
        }
        .imgCon{
            /*border: 1px solid white;*/
            height: 100%;
            width: 25%;
            float: left;
        }
        .restCon{
            float: left;
            /*border: 1px solid white;*/
            width: 73%;
            height: 100%;
            
        }
        .navHed{
            color: white;
            font-size: 1.1rem;
            margin: 0;
            text-align: center;
            font-family: verdana;
            margin-top: 10%;
        }
        .butCon{
         /*   border: 1px solid white;*/
            float: left;
            height: 80%;
            width: 30%;
            margin-left: 40%
        }
        .loBtn{
            border: none;
            background-color: crimson;
            color: white;
            padding: 1.5%;
            width: 30%;
            margin-top: 4%;
            font-family: century gothic;
            margin-left: 20%
        }
        .naBtn {
        color: white;
        text-decoration: none;
        display: block;
        float: left;
        margin-left: 5%;
        margin-top: 6%;
        font-family: century gothic;
        font-size: 0.8rem;
        </style>
    </head>

    <body>
        <%
            HttpSession sessionLog = request.getSession();
            String userSes = sessionLog.getAttribute("_userid").toString();
            if("None".equals(userSes)){
                response.sendRedirect("index.html");
            }
        %>
       <div class="navBarCon">
        <div class="iconCon">
           <div class="imgCon">
                <img src="CssImages/icons8-doctors-bag-100.png" alt="">
           </div>
           <div class="restCon">
               <p class="navHed">Hospital Management</p>
           </div>         
        </div>
        <div class="butCon">
            <a href="Pharmacist.jsp" class="naBtn">Home</a>
           <a href="Suggestions.jsp" class="naBtn">Suggestions</a>
           <form action="">
              
               <button name="lo" value="lo" class="loBtn">logout</button>
               
               <!--
               <input type="submit" value="logout" class="loBtn" />
                -->
           </form>
           <%
               String lo = request.getParameter("lo");
               if("lo".equals(lo)){
                   sessionLog.setAttribute("_userid","None");
                   response.sendRedirect("index.html");
               }
           %>
        </div>
        
    </div>
    <div style="clear: both;"></div>
        <div class="sep2">
            <div class="tbl">
                <h1 class="hed">Previous Data</h1>
                <div class="lefDataList">
                    <br>

                    <div class="lefDet" style="">
                        <div class="mn1 botSep tblHed">
                            <p class="lblH">Patient ID</p>
                        </div>
                        <div class="mn botSep tblHed">
                            <p class="lblH">Medicine</p>
                        </div>
                        <div class="botSep tblHed">
                            <p class="lblH">Quantity</p>
                        </div>
                        <div class="botSep tblHed">
                            <p class="lblH">UOM</p>
                        </div>

                    </div>
                    <%
                        String query = "select * from medication where STS= 'Delevered';";
                        ResultSet res;
                        DBConnect db = new DBConnect();
                        try{
                            res = db.readData(query);
                            while(res.next()){
                    %>
                    <div class="lefDet">

                        <div class="mn1 botSep">
                            <p class="lbl"><%= res.getString("PID") %></p>
                        </div>
                        <div class="mn botSep">
                            <p class="lbl"><%= res.getString("MdInID") %></p>
                        </div>
                        <div class="botSep">
                            <p class="lbl"><%= res.getString("QUN") %></p>
                        </div>
                        <div class="botSep" style="width: 14.78%;">
                            <p class="lbl">124</p>
                        </div>
                    </div>
                    <%
                }
                                
            }catch(Exception e){
                        
            }
                    %>  
                    <!--
                    <div class="lefDet">

                        <div class="mn1 botSep">
                            <p class="lbl">PTN123445</p>
                        </div>
                        <div class="mn botSep">
                            <p class="lbl">Panadol</p>
                        </div>
                        <div class="botSep">
                            <p class="lbl">124</p>
                        </div>
                        <div class="botSep" style="width: 14.78%;">
                            <p class="lbl">124</p>
                        </div>
                    </div>
                    -->
                </div>
            </div>
            <br>
            <div class="list">
                <br>
                <form>
                    <select name="pidNm" id="">
                        <%
                             List<String> listPid =new ArrayList<String>(); 
                            DBConnect dbP = new DBConnect();
                            String queryP = "select * from medication where STS= 'Not_Delevered';";
                            ResultSet resP = dbP.readData(queryP);
                            boolean isExist = false;
                            try{
                                while(resP.next()){
                                    isExist = false;
                                    for(String p : listPid){
                                        if(resP.getString("PID").equals(p)){
                                            isExist = true;
                                        }
                                    }
                                    if(!isExist){
                                        listPid.add(resP.getString("PID"));
                        %>
                        <option><%= resP.getString("PID") %></option>
                        <%
                    }
                }
            }catch(Exception e){

            }
                        %>
                    </select>
                    <button class="btnPatL" name="Load" value="Load">Load</button>
                </form>
                <%
                    String getBtn = request.getParameter("Load");
                    
                %>

                <div class="lefDataList">
                    <br>
                    <div class="lefDet ">
                        <div class="mn botSep tblHed">
                            <p class="lblH">Medicine</p>
                        </div>
                        <div class="botSep tblHed">
                            <p class="lblH">Quantity</p>
                        </div>
                        <div class="botSep tblHed">
                            <p class="lblH">UOM</p>
                        </div>
                    </div>
                    <%
                        HttpSession session2 = request.getSession();
                        String pidD = request.getParameter("pidNm");
                        String pidStore = "NA";
                        DBConnect dbPat = new DBConnect();
                        ResultSet resPat;
                        String queryPat ;
                        if("Load".equals(getBtn)){
                           
                           queryPat = "select * from medication where PID='"+pidD+"' && STS='Not_Delevered';";
                           resPat = dbPat.readData(queryPat);
                           try{
                               while(resPat.next()){
                    %>
                    <div class="lefDet">
                        <div class="mn botSep">
                            <p class="lbl"><%= resPat.getString("MdInID") %></p>
                        </div>
                        <div class="botSep">
                            <p class="lbl"><%= resPat.getString("QUN") %></p>
                        </div>
                        <div class="botSep" style="width: 15%;">
                            <p class="lbl">124</p>
                        </div>
                    </div>
                    <%
                }
            }catch(Exception e){
                               
            }
         }else{
                    %>

                    <%
           }
                    %>
                </div>
                <form>
                    <!--
                    <button class="pb" name="gb" value="gb">Generate Bil</button>
                    -->
                </form>
                <%
                     String genBill = request.getParameter("gb");
                     String date = java.time.LocalDate.now().toString();
                     String time = java.time.LocalTime.now().toString();
                %>
            </div>
        </div>
          <br/> <br/> <br/> <br/>
        <div class="sep2 bilp" style="width:  35%">
            <h1 style="margin-left: 5%;">Receipt</h1>
            <div class="bolCon">
                <p class="lbl">Date: <%= date %> </p>
                <p class="lbl">Time: <%= time %> </p> 
                <br>
                <hr/>
                <% 
                    DBConnect dbBill = new DBConnect();
                    ResultSet resBill;
                    String queryBill;
                    int Total = 0;
                    if("Load".equals(getBtn)){
                         Total = 0;
                        queryBill = "select * from medication where PID='"+pidD+"' && STS='Not_Delevered';";
                        resBill = dbBill.readData(queryBill);
                        try{
                            while(resBill.next()){
                                Total = Total + Integer.parseInt(resBill.getString("Price"));
                %> 
                <div class="lefDet">
                    <div class="mn botSep">
                        <p class="lbl"><%= resBill.getString("MdInID") %></p>
                    </div>
                    <div class="botSep">
                        <p class="lbl"><%= resBill.getString("QUN") %></p>
                    </div>
                    <div class="botSep" style="width: 30%;">
                        <p class="lbl">Rs . <%= resBill.getString("Price") %></p>
                    </div>
                </div>
                <%
            }
        }catch(Exception e){
                            
        }
    }else{
    %>
    <%
}
                %>
                <!--
                <div class="lefDet">

                    <div class="mn botSep">
                        <p class="lbl">Panadol</p>
                    </div>
                    <div class="botSep">
                        <p class="lbl">124</p>
                    </div>
                    <div class="botSep" style="width: 30%;">
                        <p class="lbl">Rs. 15000</p>
                    </div>
                </div>
  -->
            </div>
            <p class="lbl">total : Rs.  <%= Total %> </p>
            <!--
            <button class="sema">Send Receipt via Email</button>
            -->
            <form action="SendEmailSer">
                <%
                    DBConnect dbEm = new DBConnect();
                    ResultSet resEm;
                    String queryEm;
                    if("Load".equals(getBtn)){
                        queryEm = "select * from patient where PID='"+pidD+"';";
                        resEm = dbEm.readData(queryEm);
                        try{
                            while(resEm.next()){
                                %>
                                
                                    <input type="text" name="em" value=<%= resEm.getString("EM")%> >
                                    <input type="text" name="pddd" value=<%= pidD %> >
                                <%
                            }
                        }catch(Exception e){}
                    }
                %>
                
                <input class="sema" type="submit" value="Send Collect Email"/>
            </form>
        </div>
    </body></html>
