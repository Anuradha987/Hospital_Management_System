<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

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
    .lCon{
        background: #f12711;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #f5af19, #f12711);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #f5af19, #f12711); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    }
    .mCon{
        background: #52c234;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #061700, #52c234);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #061700, #52c234); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

    }
    .rCon{
        background: #4b6cb7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #182848, #4b6cb7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #182848, #4b6cb7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

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
       
        width: 30%;
        float: left;
        height: 100%;
        margin-left: 3%;
        border-radius: 2px;
        background-color: black;
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
        /* border: 1px solid white;*/
            float: left;
            height: 80%;
            width: 50%;
            margin-left: 20%
        }
        .loBtn{
            border: none;
            background-color: crimson;
            color: white;
            padding: 1.2%;
            width: 20%;
            margin-top: 2%;
            font-family: century gothic;
            margin-left: 10%;
            
        }
    .naBtn {
        color: white;
        text-decoration: none;
        display: block;
        float: left;
        margin-left: 5%;
        margin-top: 3.5%;
        font-family: century gothic;
        font-size: 0.8rem
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
            <a href="DoctorAndNurse.jsp" class="naBtn">Home</a>
            <%
                if("Doctor".equals(sessionLog.getAttribute("_userstatus").toString())){
                    %>
                        <a href="AddMedication.jsp" class="naBtn">Add Medicine</a>
                        <a href="AddDailyReport.jsp" class="naBtn">Add Daily Report</a>
                    <%
                }else{
                    %>
                        <a href="AddActivity.jsp" class="naBtn">Add Activity</a>                      
                    <%
                }
            %>
            
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
    <br><br><br><br>
    <div class="uperPanel">
        <div class="upSep">
            <form action="">
                <p class="lbldp">Patient ID:</p>
                <select name="pid" id="" class="patDp">
                    <%
                        DBConnect db = new DBConnect();
                        String query = "select * from patient where STS != 'Discharged';";
                        ResultSet res = db.readData(query);
                        try{
                            while(res.next()){
                                %>
                                <option><%= res.getString("PID") %></option>
                                <%
                            }
                        }catch(Exception e){}
                    %>
                </select>
              
                <button class="loadBtn" value="Load" name="Load">Load</button>
                <% 
                    String getBtn = request.getParameter("Load");
                 %>
            </form>
        </div>
            <%
                int nos = 0;
                int noc = 0;
                int nop = 0;
                DBConnect dbPATI = new DBConnect();
                String queryPATI = "select * from patient where STS != 'Discharged' ;";
                ResultSet resPATI = dbPATI.readData(queryPATI);
                try{
                    while(resPATI.next()){
                        nop++;
                        if(resPATI.getString("STS").equals("Very Bad")){
                            noc++;
                        }
                        if(resPATI.getString("STS").equals("Normal")){
                            nos++;
                        }
                    }
                }catch(Exception e){}
            %>
        <div class="upSep" style="width: 69%">
            <div class="detCon lCon">
                <div class="detConInSep dciL">
                    <p class="conLbl">No Of <br>Patients</p>
                </div>
                <div class="detConInSep dciR">
                    <p class="conVal"><%= nop %></p>
                </div>
            </div>
            <div class="detCon mCon">
                <div class="detConInSep dciL">
                    <p class="conLbl">No Of <br> Critical Patients</p>
                </div>
                <div class="detConInSep dciR">
                    <p class="conVal"><%= noc %></p>
                </div>
            </div>
            <div class="detCon rCon">
                <div class="detConInSep dciL">
                    <p class="conLbl">No Of <br> Stable Patients</p>
                </div>
                <div class="detConInSep dciR">
                    <p class="conVal"><%= nos %></p>
                </div>
            </div>
        </div>
    </div>
  <!--  <div class="loverPnl">
        <br>
        <form action="" class="fm">
            <table style="border: 0px solid; width: 80%">
                <tr>
                    <td>
                        <p class="lblTbl">Patient ID</p>
                        <input type="text" class="inp">
                    </td>
                    <td>
                        <p class="lblTbl">First Name</p>
                        <input type="text" class="inp">
                    </td>
                    <td>
                        <p class="lblTbl">Last Name</p>
                        <input type="text" class="inp">
                    </td>
                    <td>
                        <p class="lblTbl">Ward</p>
                        <input type="text" class="inp">
                    </td>

                </tr>
                <tr>
                    <td>
                        <p class="lblTbl">Admitted Date</p>
                        <input type="text" class="inp">
                    </td>
                    <td>
                        <p class="lblTbl">Reason</p>
                        <input type="text" class="inp">
                    </td>
                    <td>
                        <p class="lblTbl">Bed Number</p>
                        <input type="text" class="inp">
                    </td>
                    <td>
                        <p class="lblTbl">Status</p>
                        <input type="text" class="inp">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" class="btnRemove" value="Remove">
            <input type="submit" class="btnUpdate" value="Update">
        </form>

    </div>-->
    <div style="clear: both;"></div><br>
    <div class="thirdLover">
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
                    <h3 class="headersM" style="text-align:left">Activity</h3>
                </div>
                <div class="sepMid3" style="width: 20%">
                    <h3 class="headersM">Nurse</h3>
                </div>
            </div>
            <%
                DBConnect dbAc = new DBConnect();
                ResultSet resAc;
                String queryAc;
                String getPid = request.getParameter("pid");
                
                
                DBConnect dbAcD = new DBConnect();
                ResultSet resAcD;
                String queryAcD;
                
               DBConnect dbPID = new DBConnect();
                ResultSet resPID;
                String queryPID;
                 String fPID = null;
                
                if("Load".equals(getBtn)){
                    queryAc = "select * from activity where PID = '"+getPid+"';";
                    resAc = dbAc.readData(queryAc);
                    try{
                        while(resAc.next()){
                            %>
                                <div style="border: 0px solid; clear: both;">
                                <div class="sepMid3">
                                    <p class="lblM3" style="margin-left: 5%;"><%= resAc.getString("DT") %></p>
                                 </div>
                             <div class="sepMid3">
                              <p class="lblM3"><%= resAc.getString("TM") %></p>
                             </div>
                                <div class="sepMid3" style="width: 47%">
                                 <p class="lblM3"><%= resAc.getString("Activity") %></p>
                            </div>
                            <div class="sepMid3" style="width: 20%">
                                <p class="lblM3" style="margin-left: 5%"><%= resAc.getString("STID") %></p>
                            </div>
                            </div>
                            <%
                        }
                    }catch(Exception e){}
                }else{
                    queryPID = "select * from patient where STS !='Discharged' limit 1; ";
                    resPID = dbPID.readData(queryPID);
                    try{
                        while(resPID.next()){
                            fPID = resPID.getString("PID");
                        }
                    }catch(Exception e){}
                    queryAcD = "select * from activity where PID = '"+fPID+"';";
                    resAcD = dbAcD.readData(queryAcD);
                    try{
                        while(resAcD.next()){
                             %>
                                <div style="border: 0px solid; clear: both;">
                                <div class="sepMid3">
                                    <p class="lblM3" style="margin-left: 5%;"><%= resAcD.getString("DT") %></p>
                                 </div>
                             <div class="sepMid3">
                              <p class="lblM3"><%= resAcD.getString("TM") %></p>
                             </div>
                                <div class="sepMid3" style="width: 47%">
                                 <p class="lblM3"><%= resAcD.getString("Activity") %></p>
                            </div>
                            <div class="sepMid3" style="width: 20%">
                                <p class="lblM3" style="margin-left: 5%"><%= resAcD.getString("STID") %></p>
                            </div>
                            </div>
                            <%
                        }
                    }catch(Exception e){}
                }
            %>     
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
                    <h3 class="headersM" style="text-align:left">Medication</h3>
                </div>
                <div class="sepMid3" style="width: 9%">
                    <h3 class="headersM">Qun</h3>
                </div>
                <div class="sepMid3" style="width: 15%">
                    <h3 class="headersM">Doctor</h3>
                </div>
            </div>
            <%
                DBConnect dbM = new DBConnect();
                ResultSet resM;
                String queryM;
                
                DBConnect dbMD = new DBConnect();
                ResultSet resMD;
                String queryMD;
                
                if("Load".equals(getBtn)){
                    queryM = "select * from medication where PID = '"+getPid+"';";
                    resM = dbM.readData(queryM);
                    try{
                        while(resM.next()){
                            %>
                                 <div style="border: 0px solid; clear: both;">
                                 <div class="sepMid3">
                                 <p class="lblM3" style="margin-left: 5%;"><%= resM.getString("DT") %></p>
                             </div>
                            <div class="sepMid3">
                              <p class="lblM3"><%= resM.getString("TM") %></p>
                          </div>
                            <div class="sepMid3" style="width: 43%">
                             <p class="lblM3"><%= resM.getString("MdInID") %></p>
                            </div>
                          <div class="sepMid3" style="width: 9%">
                               <p class="lblM3" style="margin-left: 5%;text-align: center;"><%= resM.getString("QUN") %></p>
                         </div>
                         <div class="sepMid3" style="width: 15%">
                              <p class="lblM3" style="margin-left: 5%"><%= resM.getString("STID") %></p>
                         </div>
                          </div>
                            <%
                        }
                    }catch(Exception e){}
                }else{
                    queryMD = "select * from medication where PID ='"+fPID+"';";
                    resMD = dbMD.readData(queryMD);
                    try{
                        while(resMD.next()){
                            %>
                                 <div style="border: 0px solid; clear: both;">
                                 <div class="sepMid3">
                                 <p class="lblM3" style="margin-left: 5%;"><%= resMD.getString("DT") %></p>
                             </div>
                            <div class="sepMid3">
                              <p class="lblM3"><%= resMD.getString("TM") %></p>
                          </div>
                            <div class="sepMid3" style="width: 43%">
                             <p class="lblM3"><%= resMD.getString("MdInID") %></p>
                            </div>
                          <div class="sepMid3" style="width: 9%">
                               <p class="lblM3" style="margin-left: 5%;text-align: center;"><%= resMD.getString("QUN") %></p>
                         </div>
                         <div class="sepMid3" style="width: 15%">
                              <p class="lblM3" style="margin-left: 5%"><%= resMD.getString("STID") %></p>
                         </div>
                          </div>
                            <%
                        }
                    }catch(Exception e){}
      
                }
            %>           
        </div>
    </div><br><br>
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
            DBConnect dbR = new DBConnect();
            ResultSet resR ;
            String queryR ;
             if("Load".equals(getBtn)){
                 
                    queryR = "select * from dailyreport where PID = '"+getPid+"';";
                    resR = dbR.readData(queryR);
                    try{
                        while(resR.next()){
                            %>
         <div style="border: 0px solid;width: 60%;margin-left: 20%;clear: both">
            <div class="sep4">
               <p class="lblM3" style="margin-left: 5%;"><%= resR.getString("DT") %></p>
            </div>
            <div class="sep4">
                <p class="lblM3" style="margin-left: 5%;"><%= resR.getString("TM") %></p>
            </div>
            <div class="sep4" style="width: 50%;">
                <p class="lblM3" style="margin-left: 5%;"><%= resR.getString("Details") %></p>
            </div>
            <div class="sep4" style="width: 21%">
                <p class="lblM3" style="margin-left: 5%;"><%= resR.getString("STID") %></p>
            </div>
        </div>
                            <%
                        }
                    }catch(Exception e){
                            %>
                 <div><%= e %></div>
                 <%
                    }
             }
        %>
        <!--
        <div style="border: 0px solid;width: 60%;margin-left: 20%;clear: both">
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
        </div>
         -->
        
     
      
    </div>
        <br/><br/><br/>
         <br/><br/><br/>
</body></html>
