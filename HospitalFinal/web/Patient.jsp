

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <style>
        body {
            margin: 0;
            padding: 0;

        }

        .uperPanel {
            /*border: 1px solid;*/
            height: 10vh;
        }

        .upSep {
            /* border: 1px solid;*/
            width: 30%;
            float: left;
            height: 100%;
        }

        .lbldp {
            margin: 0;
            font-family: verdana;
            font-size: 0.9rem;
            margin-left: 10%;
            margin-top: 2%;
            margin-bottom: 1.5%;
        }

        .patDp {
            margin-left: 10%;
            padding: 1%;
            width: 50%;
        }

        .loadBtn {
            border: none;
            background-color: crimson;
            padding: 1.2%;
            width: 25%;
            margin-left: 5%;
            color: white;
            font-family: verdana;
            border-radius: 3px;
        }

        .detCon {
            border: 1px solid;
            width: 30%;
            float: left;
            height: 100%;
            margin-left: 3%;
            border-radius: 2px;
            background-color: black;
        }
        .lCon,.mCon, .rCon{
            border: none;
         background: #00c6ff;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #0072ff, #00c6ff);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #0072ff, #00c6ff); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */



        }
        .detConInSep {
            /*border: 1px solid white;*/
            height: 100%;
            width: 50%;
            float: left;
        }

        .conLbl {
            color: white;
            font-family: verdana;
            font-size: 1rem;
            margin: 0;
            text-align: center;
            margin-top: 8%;
        }

        .conVal {
            color: white;
            margin: 0;
            font-size: 1.8rem;
            font-family: verdana;
            text-align: center;
            margin-top: 12%;
        }

        /*Lover panel ***********************************************************/
        td {
            padding-left: 10%;
        }

        .inp {
            padding: 4%;
            margin-left: 5%;
            width: 130%;
        }

        .lblTbl {
            margin: 0;
            font-family: verdana;
            font-size: 0.8rem;
            margin-left: 4%;
        }

        .fm {
            /* border: 1px solid;
            color: red;*/
        }

        .btnRemove {
            border: none;
            background-color: crimson;
            color: white;
            padding: 0.7%;
            width: 10%;
            margin-left: 9%;
        }

        .btnUpdate {
            border: none;
            background-color: greenyellow;
            color: black;
            padding: 0.7%;
            width: 20%;

        }

        /*3rd Lover panel ***********************************************************/
        .thirdLover {
            /* border: 1px solid;*/
            height: 49vh
        }

        .sep3 {
            /* border: 1px solid;*/
            width: 49%;
            height: 100%;
            float: left;
            overflow-y: scroll;
        }

        .sepMid3 {
            /*border: 1px solid;*/
            height: 100%;
            float: left;
            width: 15%
        }

        .lblM3 {
            margin: 0;
            font-size: 0.8rem;
            font-family: verdana;
            margin-bottom: 3%;
        }

        .headersM {
            margin: 0;
            text-align: center;
            margin-bottom: 5%;
        }

        /*4rd Lover panel ***********************************************************/
        .m4 {
            /*border: 1px solid;*/
            /* height: 80vh;
             overflow-y: scroll;*/
        }

        .sep4 {
            /* border: 1px solid;*/
            float: left;
            width: 14%;

        }
         .navBarCon {
            border: 1px solid;
            height: 10vh;
            background-color: black;

        }

        .iconCon {
            /* border: 1px solid white;*/
            height: 100%;
            width: 20%;
            margin-left: 5%;
            float: left;

        }

        img {
            height: 7vh;
            margin-top: 10%;
        }

        .imgCon {
            /*border: 1px solid white;*/
            height: 100%;
            width: 25%;
            float: left;
        }

        .restCon {
            float: left;
            /*border: 1px solid white;*/
            width: 73%;
            height: 100%;

        }

        .navHed {
            color: white;
            font-size: 1.1rem;
            margin: 0;
            text-align: center;
            font-family: verdana;
            margin-top: 10%;
        }

        .butCon {
            /* border: 1px solid white;*/
            float: left;
            height: 80%;
            width: 60%;
            margin-left: 10%
        }

       .loBtn {
            border: none;
            background-color: crimson;
            color: white;
            padding: 1%;
            width: 15%;
           margin-top: 2%;
            font-family: century gothic;
            margin-left: 7%;
        }

        .naBtn {
            color: white;
            text-decoration: none;
               display: block;
        float: left;
            margin-left: 4%;
            margin-top: 3.5%;
            font-family: century gothic;
            font-size: 0.8rem;
        }
        .ul {
            /* border: 1px solid white;*/
            color: white;
            font-family: century gothic;
            font-size: 0.8rem;
            text-decoration: none;
            list-style: none;
            margin-top: 3%;
        }

        .mainLi {
            float: left;
            /*border: 1px solid white;*/
            width: 13%;

        }

        ul li ul {
            list-style: none;
            margin-left: -30%;
            margin-top: 5%;
        }

        ul li:hover ul li {
            visibility: visible;
        }

        ul li ul li {
            padding: 4%;
            background-color: grey;
            margin-left: -11%;
            visibility: hidden;
        }
    </style>

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
                
                <a href="AdminWard.jsp" class="naBtn">Ward</a>
            <a href="AdminNurse.jsp" class="naBtn">Nurse</a>
            <a href="AdminDoctor.jsp" class="naBtn">Doctor</a>
            <a href="Patient.jsp" class="naBtn">Patient</a>
            <a href="AddMedecine.jsp" class="naBtn">Add Medicine</a>
            <a href="AddStaff.jsp" class="naBtn">Account</a>
            <a href="AddWard.jsp" class="naBtn">Add Ward</a>
             <form action="">
              
               <button name="lo" value="lo" class="loBtn">logout</button>
         
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
        <%
            DBConnect dbP1 = new DBConnect();
            String query11 = "select * from patient;";
            boolean c = false;
            String fPid = null;
            ResultSet resP1 = dbP1.readData(query11);
            try{
                while(resP1.next()){
                    if(c){
                        break;
                }else{
                        fPid = resP1.getString("PID");
                    }
                    c = true;
                }    
            }catch(Exception e){}
        %>
        <br/>
        <div class="uperPanel">
            <div class="upSep">
                <form action="">
                    <p class="lbldp">Patient ID:</p>
                    <select name="pid" id="" class="patDp">
                        <%
                       
                            DBConnect db1 = new DBConnect();
                            String query1 = "select * from patient where STS !='Discharged';";
                            ResultSet res1 = db1.readData(query1);
                            try{
                                while(res1.next()){
                        %>
                        <option><%= res1.getString("PID") %></option>
                        <%
                    }
                }catch(Exception ex){
                            
                }
                        %>
                    </select>
                    <!-- <input type="submit" class="loadBtn" value="Load"> -->
                    <button class="loadBtn" name="btn" value="load">load</button>


                </form>
            </div>
                    <%
                        int totPat = 0;
                        int critPat = 0;
                        int stbPat = 0;
                        
                        String qAllPat = "select * from patient;";
                        DBConnect dbAP = new DBConnect();
                        ResultSet resAP = dbAP.readData(qAllPat);
                        try{
                            while(resAP.next()){
                                if(resAP.getString("STS").equals("Very_Bad")){
                                    critPat++;
                                }
                                if(resAP.getString("STS").equals("Normal")){
                                    stbPat++;
                                }
                                totPat++;
                            }
                        }catch(Exception e){
                            
                        }
                    %>
            <div class="upSep" style="width: 69%">
                <div class="detCon lCon">
                    <div class="detConInSep dciL">
                        <p class="conLbl">No Of <br>Patients</p>
                    </div>
                    <div class="detConInSep dciR">
                        <p class="conVal"><%= totPat %></p>
                    </div>
                </div>
                <div class="detCon mCon">
                    <div class="detConInSep dciL">
                        <p class="conLbl">No Of <br> Critical Patients</p>
                    </div>
                    <div class="detConInSep dciR">
                        <p class="conVal"><%= critPat %></p>
                    </div>
                </div>
                <div class="detCon rCon">
                    <div class="detConInSep dciL">
                        <p class="conLbl">No Of <br> Stable Patients</p>
                    </div>
                    <div class="detConInSep dciR">
                        <p class="conVal"><%= stbPat %></p>
                    </div>
                </div>
            </div>
        </div>
        <%
                      String pID,fn,ln,rs,dt,wd,sts,email  ;
                      int bn,cn;
                      String pid = request.getParameter("pid");
                      String btnVal = request.getParameter("btn");
                      String queryTb ;
                      ResultSet resTb;
                      DBConnect dbTb = new DBConnect();
                      
                      String queryTb1 ;
                      ResultSet resTb1;
                      DBConnect dbTb1 = new DBConnect();
                      String fPid2 = null;
                      
             HttpSession session1 = request.getSession();                     
           if(session1.getAttribute("_userstatus").equals("Admin")){
               if("load".equals(btnVal)){
                   queryTb = "select * from patient where PID = '"+pid+"';";
                   resTb = dbTb.readData(queryTb);
           
                   try{
                       while(resTb.next()){
                         pID = resTb.getString("PID");
                         fn = resTb.getString("FN");
                         ln = resTb.getString("LN");
                         dt = resTb.getString("ADDate");
                         wd = resTb.getString("Ward");
                         rs = resTb.getString("Reason");
                         sts = resTb.getString("STS");
                         email = resTb.getString("EM");
                         bn = Integer.parseInt(resTb.getString("BedNo"));
                         cn = Integer.parseInt(resTb.getString("CN"));
        %>
        <div class="loverPnl">
            <br>
            <form action="Servelet_UpdatePatient" class="fm">
                <table style="border: 0px solid; width: 80%">
                    <tr>
                        <td>
                            <p class="lblTbl">Patient ID</p>
                            <input type="text" name="pid" class="inp" readonly="" value=<%=pID%> >
                        </td>
                        <td>
                            <p class="lblTbl">First Name</p>
                            <input type="text" class="inp" name="fn" id="fn" value=<%=fn%>>
                        </td>
                        <td>
                            <p class="lblTbl">Last Name</p>
                            <input type="text" class="inp" name="ln" id="ln" value=<%=ln%>>
                        </td>
                        <td>
                            <p class="lblTbl">Ward</p>
                            <input type="text" class="inp" name="wd" id="wd" value=<%=wd%>>

                        </td>

                    </tr>
                    <tr>
                        <td>
                            <p class="lblTbl">E-mail</p>
                            <input type="text" class="inp" name="ema" id="em" value=<%=email%>>
                        </td>
                        <td>
                            <p class="lblTbl">Reason</p>
                            <input type="text" class="inp" name="rs" id="rs" value=<%=rs%>>
                        </td>
                        <td>
                            <p class="lblTbl">Bed Number</p>
                            <input type="text" class="inp" name="bn" id="bn" value=<%=bn%>>
                        </td>
                        <td>
                            <p class="lblTbl">Status ( <%=sts%> )</p>
<!--                            <input type="text" name="st" value=>-->
                            <select class="inp" name="st">
                                <option>Very_Bad</option>
                                <option>Bad</option>
                                <option>Normal</option>
                                <option>Good</option>
                                <option>Very_Good</option>
                                <option>Discharged</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br>
               
                <!--<button  class="btnRemove" name="crud" value="Remove">Remove</button>-->
                <button id="subB" class="btnUpdate" name="crud"  value="Update" style="margin-left:8%">Update</button>
                
                <script src="JavaScript/jquery-3.3.1.js"></script>
                       <script>
                           $(document).ready(function () {
                               
                               var cl = $("#subB").click(function () {
                                   var retVal = 0;
                                   
                                   if ($("#fn").val().length == 0) {
                                       retVal = 1;
                                       alert("First Name Cannot be blank !");
                                       return false;
                                   }
                                   if ($("#ln").val().length == 0) {
                                       retVal = 1;
                                       alert("Last Name Cannot be blank !");
                                       return false;
                                   }
                                   if ($("#rs").val().length == 0) {
                                       alert("Reason Cannot be blank !");
                                       retVal = 1;
                                       return false;
                                   }
                                   if ($("#em").val().length == 0) {
                                       alert("Email Cannot be blank !");
                                       retVal = 1;
                                       return false;
                                   }
                                    if ($("#wd").val().length == 0) {
                                       alert("Ward Cannot be blank !");
                                       retVal = 1;
                                       return false;
                                   }
                                   //ValidateEmail(eee);
                                   if ($("#bn").val().length == 0) {
                                       alert("Bed No Cannot be blank !");
                                       retVal = 0;
                                       return false;
                                   } else {
                                       if (Math.floor($("#bn").val()) == $("#bn").val() && $.isNumeric($("#bn").val())) {
                                           return true;
                                       } else {
                                           alert("( Bed No )Cannot convert String to integer!");
                                           return false;
                                       }
                                   }
                                   // alert(retVal)
                               });
                           });
                       </script>
                
                <%
                    String crud = request.getParameter("crud");
                    String getPid,getFn,getLn,getWd,getSts,getRs;
                    int getBn,getCn;
                    String queryUp;
                    DBConnect dbUp = new DBConnect();
                    if("Update".equals(crud)){
                        getFn = request.getParameter("fn");
                        getLn = request.getParameter("ln");
                        getWd = request.getParameter("wd");
                        getSts = request.getParameter("st");
                        getRs = request.getParameter("rs");
                        getBn = Integer.parseInt(request.getParameter("bn"));
                       // getCn = Integer.parseInt(request.getParameter("cn"));
                       queryUp = "update patient set FN='"+getFn+"',LN='"+getLn+"',Ward='"+getWd+"', STS='"+getSts+"',Reason = '"+getRs+"',BN = '"+getBn+"' where PID = '"+pid+"';";
                       dbUp.insertData(queryUp);
                    }
                %>
            </form>

        </div>
        <%
    }
}catch(Exception e){
                       
}
}else{
    // sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    queryTb1 = "select * from patient limit 1;";
    resTb1 = dbTb1.readData(queryTb1);
    try{
        while(resTb1.next()){
            %>
               
            <%
        }
    }catch(Exception e){}
    
}
        %>

        <%
    }else{
        %>
        <div></div>
        <%
    }
        %>

        <div style="clear: both;"></div><br>
        <div class="thirdLover" style="clear:both">
            <div class="sep3">
                <br>
                <h1 class="3HedHed" style="text-align: center; margin: 0;">Activities</h1> <br>
                <div style="border: 0px solid; clear: both;">
                    <div class="sepMid3">
                        <h3 class="headersM">Date</h3>
                    </div>
                    <div class="sepMid3">
                        <h3 class="headersM">Time</h3>
                    </div>
                    <div class="sepMid3" style="width: 47%">
                        <h3 class="headersM">Activity</h3>
                    </div>
                    <div class="sepMid3" style="width: 20%">
                        <h3 class="headersM">Nurse</h3>
                    </div>
                </div>
                <% 
                        
                      
                      String queryAct ;
                      ResultSet resAct;
                      int count = 0 ;
                      DBConnect dbAct = new DBConnect();
                      if("load".equals(btnVal)){
                         queryAct = "select * from activity where PID='"+pid+"';";
                         resAct = dbAct.readData(queryAct);               
                         try{
                             while(resAct.next()){
                %>
                <div style="border: 0px solid; clear: both;">
                    <div class="sepMid3">
                        <p class="lblM3" style="margin-left: 5%;"> <%= resAct.getString("DT")%> </p>
                    </div>
                    <div class="sepMid3">
                        <p class="lblM3"> <%= resAct.getString("TM")%></p>
                    </div>
                    <div class="sepMid3" style="width: 47%">
                        <p class="lblM3"> <%= resAct.getString("Activity")%></p>
                    </div>
                    <div class="sepMid3" style="width: 20%">
                        <p class="lblM3" style="margin-left: 5%"> <%= resAct.getString("STID")%></p>
                    </div>
                </div>
                <%
            }
                               
        }catch(Exception e){
                %>
                <div style="border: 0px solid; clear: both;">
                    <div class="sepMid3">
                        <p class="lblM3" style="margin-left: 5%;">e</p>
                    </div>
                    <div class="sepMid3">
                        <p class="lblM3">e</p>
                    </div>
                    <div class="sepMid3" style="width: 47%">
                        <p class="lblM3">e</p>
                    </div>
                    <div class="sepMid3" style="width: 20%">
                        <p class="lblM3" style="margin-left: 5%">e</p>
                    </div>
                </div>
                <%
        }
     }else{
        
         //session1.setAttribute("_userstatus",stsAd);
        queryAct = "select * from activity where PID='"+pid+"';";
                         resAct = dbAct.readData(queryAct);               
                         try{
                             while(resAct.next()){
                %>
                <div style="border: 0px solid; clear: both;">
                    <div class="sepMid3">
                        <p class="lblM3" style="margin-left: 5%;"> <%= resAct.getString("DT")%> </p>
                    </div>
                    <div class="sepMid3">
                        <p class="lblM3"> <%= resAct.getString("TM")%></p>
                    </div>
                    <div class="sepMid3" style="width: 47%">
                        <p class="lblM3"> <%= resAct.getString("Activity")%></p>
                    </div>
                    <div class="sepMid3" style="width: 20%">
                        <p class="lblM3" style="margin-left: 5%"> <%= resAct.getString("STID")%></p>
                    </div>
                </div>
                <%
            }
     }catch(Exception e){}
}             
                
                %>
                <!--    <div style="border: 0px solid; clear: both;">
                          <div class="sepMid3">
                              <p class="lblM3" style="margin-left: 5%;">2020-02-31</p>
                          </div>
                          <div class="sepMid3">
                              <p class="lblM3">12:20:12</p>
                          </div>
                          <div class="sepMid3" style="width: 47%">
                              <p class="lblM3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga facere earum veritatis c</p>
                          </div>
                          <div class="sepMid3" style="width: 20%">
                              <p class="lblM3" style="margin-left: 5%">NUR_1521_155</p>
                          </div>
                      </div>  -->
            </div>
            <div class="sep3">
                <br>
                <h1 class="3Hed" style="text-align: center; margin: 0;">Medications</h1><br>
                <div style="border: 0px solid; clear: both;">
                    <div class="sepMid3">
                        <h3 class="headersM">Date</h3>
                    </div>
                    <div class="sepMid3">
                        <h3 class="headersM">Time</h3>
                    </div>
                    <div class="sepMid3" style="width: 43%">
                        <h3 class="headersM">Medication</h3>
                    </div>
                    <div class="sepMid3" style="width: 9%">
                        <h3 class="headersM">Qun</h3>
                    </div>
                    <div class="sepMid3" style="width: 15%">
                        <h3 class="headersM">Doctor</h3>
                    </div>
                </div>
                <%
                    String queryMed ;
                      ResultSet resMed;
                      DBConnect dbMed = new DBConnect();
                      if("load".equals(btnVal)){
                          queryMed = "select * from medication where PID='"+pid+"';";
                          resMed = dbMed.readData(queryMed);
                          try{
                              while(resMed.next()){
                %>
                <div style="border: 0px solid; clear: both;">
                    <div class="sepMid3">
                        <p class="lblM3" style="margin-left: 5%;"> <%= resMed.getString("DT") %></p>
                    </div>
                    <div class="sepMid3">
                        <p class="lblM3"><%= resMed.getString("TM") %></p>
                    </div>
                    <div class="sepMid3" style="width: 43%">
                        <p class="lblM3"><%= resMed.getString("MdInID") %></p>
                    </div>
                    <div class="sepMid3" style="width: 9%">
                        <p class="lblM3" style="margin-left: 5%;text-align: center;"><%= resMed.getString("QUN") %></p>
                    </div>
                    <div class="sepMid3" style="width: 15%">
                        <p class="lblM3" style="margin-left: 5%"><%= resMed.getString("STID") %></p>
                    </div>
                </div> 
                <%
            }
        }catch(Exception e){
                              
        }
    }
                %>
                <!--   <div style="border: 0px solid; clear: both;">
                       <div class="sepMid3">
                           <p class="lblM3" style="margin-left: 5%;">2020-02-31</p>
                       </div>
                       <div class="sepMid3">
                           <p class="lblM3">12:20:12</p>
                       </div>
                       <div class="sepMid3" style="width: 43%">
                           <p class="lblM3">Lorem ipsum dolor sit amet, consectetur</p>
                       </div>
                       <div class="sepMid3" style="width: 9%">
                           <p class="lblM3" style="margin-left: 5%;text-align: center;">12</p>
                       </div>
                       <div class="sepMid3" style="width: 15%">
                           <p class="lblM3" style="margin-left: 5%">NUR_1521_155</p>
                       </div>
                   </div> -->
            </div>
        </div>
        <br><br>
        <div class="m4">
            <h1 style="text-align: center;">Daily Reports</h1>
            <div style="border: 0px solid;width: 60%;margin-left: 20%;clear: both">
                <div class="sep4">
                    <h3 class="headersM">Date</h3>
                </div>
                <div class="sep4">
                    <h3 class="headersM">Time</h3>
                </div>
                <div class="sep4" style="width: 50%;">
                    <h3 class="headersM">Report</h3>
                </div>
                <div class="sep4" style="width: 21%">
                    <h3 class="headersM">Doctor</h3>
                </div>
            </div>
            <%
                 String queryRep ;
                      ResultSet resRep;
                      DBConnect dbRep = new DBConnect();
                      if("load".equals(btnVal)){
                          queryRep = "select * from dailyreport;";
                          resRep = dbRep.readData(queryRep);
                          try{
                              while(resRep.next()){
            %>
            <div style="border: 0px solid;width: 60%;margin-left: 20%;clear: both">
                <div class="sep4">
                    <p class="lblM3" style="margin-left: 5%;"> <%= resRep.getString("DT") %></p>
                </div>
                <div class="sep4">
                    <p class="lblM3" style="margin-left: 5%;"><%= resRep.getString("TM") %></p>
                </div>
                <div class="sep4" style="width: 50%;">
                    <p class="lblM3" style="margin-left: 5%;"><%= resRep.getString("Details") %></p>
                </div>
                <div class="sep4" style="width: 21%">
                    <p class="lblM3" style="margin-left: 5%;"><%= resRep.getString("STID") %></p>
                </div>
            </div>
            <%
        }
    }catch(Exception e){
                              
    }
}
            %>
            <!-- <div style="border: 0px solid;width: 60%;margin-left: 20%;clear: both">
                 <div class="sep4">
                     <p class="lblM3" style="margin-left: 5%;">2020-02-31</p>
                 </div>
                 <div class="sep4">
                     <p class="lblM3" style="margin-left: 5%;">12:15:20</p>
                 </div>
                 <div class="sep4" style="width: 50%;">
                     <p class="lblM3" style="margin-left: 5%;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. At, voluptas dolorem alias inventore fuga. Vitae dolorum nostrum totam praesentium nulla iusto? Porro dolorum </p>
                 </div>
                 <div class="sep4" style="width: 21%">
                     <p class="lblM3" style="margin-left: 5%;">SDC_15241455</p>
                 </div>
             </div> -->

            <br/><br/><br/><br/><br/><br/>
        </div> 
    </body></html>