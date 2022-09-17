

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

            .uperPanel {
                /* border: 1px solid;*/
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
            .tb{
                margin-top: 0%;
                padding: 1%;
                margin-left: 10%
            }
            .svBtn{
                border: none;
                padding: 1.4%;
                background-color: blue;
                width: 15%;
                border-radius: 3px;
                color: white;
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

            /*   m 2 **************************************************************************/
            .m2Con {

                height: 76vh
            }

            .allDetCon {
                border: 1px solid;
                width: 20%;
                height: 20vh;
                margin-top: 2%;
                margin-left: 4%;
                float: left;
                border-radius: 3px;
                color: white;
                background-color: black;
            }

            .lblCon {
                margin: 0;
                font-family: verdana;
                font-size: 0.8rem;

            }

            .lblData {
                margin: 0;
                font-family: verdana;
                font-size: 0.8rem;

            }

            tr {
                background-color: red;

            }

            .m2ConHed {
                margin: 0;
                margin-left: 5%;
            }

            .m2RepCon {
                /* border: 1px solid;*/
                height: 4vh;
                clear: both;
            }

            .repConSep {
                /*border: 1px solid;*/
                width: 70%;
                float: left;
                height: 100%;
            }

            .lblRep {
                margin: 0;
                font-size: 0.9rem;
                font-family: verdana;
                margin-left: 7%;
            }

            .lblRepData {
                margin: 0;
                font-size: 1.5rem;
                text-align: center;
                font-weight: bold;
            }

            /* ward ......................*/
            .m2WardSep {
                /*border: 1px solid;*/
                float: left;
                width: 40%;
                height: 100%;
            }

            .m2SinCon {
                border: 1px solid goldenrod;
                height: 10vh;
                color: black;
                background-color: white;
                margin-top: 3%;
                width: 90%;
                margin-left: 10%;
                border-radius: 3px
            }

            .lblRep2 {
                margin: 0;
                font-size: 1rem;
                font-family: verdana;
                margin-left: 7%;
                margin-top: 5%;
            }

            .lblRepData2 {
                margin: 0;
                font-size: 1.5rem;
                text-align: center;
                font-weight: bold;
                margin-top: 6%;
            }

            .bed {

                height: 9vh;
                width: 10%;
                margin-left: 5%;
                margin-top: 5%;
                float: left;
            }

            .bedNo {
                text-align: center;
                margin-top: 11%;
            }

            .detLbl {
                padding: 0.3%;
                font-size: 0.8rem;
                width: 20%;
                text-align: center;
                float: left;
                margin-left: 2%;
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
            /* .......................................................................................*/

            .onlineDiv{
                /*  border: 1px solid;*/
                height: 8vh;
                width: 80%;
                margin-left: 10%;
            }
            .sepOn{
                /*border: 1px solid;*/
                width: 49%;
                float: left;
                height: 100%;
            }
            .pLbl{
                margin: 0;
                font-family: verdana;
                font-size: 0.8rem;
                margin-bottom: 4%;
            }
            .pinp{
                padding: 1%;
                width: 70%;
                font-size: 0.8rem
            }

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
        <div class="uperPanel">
            <div class="upSep">
                <form action="">
                    <p class="lbldp">Ward :</p>
                    <select name="wd" id="" class="patDp">
                        <option>All</option>
                        <%
                            DBConnect dbWard = new DBConnect();
                            String queryWard = "select * from ward";
                            ResultSet resWard = dbWard.readData(queryWard);
                            try{
                                while(resWard.next()){
                        %>
                        <option> <%= resWard.getString("WID") %></option>
                        <%
                    }
                }catch(Exception e){
                            
                }
                        
                        %>
                    </select>

                    <button class="loadBtn" value="Load" name="Load">Load</button>
                    <%
                        String getLoad = request.getParameter("Load");
                    %>
                </form>
            </div>
            <div class="upSep" style="width: 46%">
                <%
                    int nob = 0;
                    String WdID = "";
                    DBConnect dbWUP = new DBConnect();
                    String queryWUP = "";
                    ResultSet resWUP = null;
                    if("Load".equals(getLoad)){
                        queryWUP = "select * from ward where WID ='"+request.getParameter("wd")+"';";
                        resWUP = dbWUP.readData(queryWUP);
                        try{
                            while(resWUP.next()){
                                nob = Integer.parseInt(resWUP.getString("NofB"));
                                WdID=resWUP.getString("WID");
                            }
                        }catch(Exception e){}
                    }
                %>
                <p class="lbldp">Number of Beds:</p>
                <form action="Servelet_UpdateWard">
                    <input name="bn" id="bn" type="text" class="tb" value=<%=nob%>>
                    <input name="wdTb" type="text" class="tb" readonly="" value=<%=WdID%>>
                    
                    <input type="submit" class="svBtn" id="subB">
                </form>
                <script src="JavaScript/jquery-3.3.1.js"></script>
                       <script>
                           $(document).ready(function () {                     
                               //alert("hi")
                               var cl = $("#subB").click(function () {
                                   var retVal = 0;
                                   if ($("#bn").val().length == 0) {
                                       retVal = 1;
                                       alert("Bed Cannot be blank !");
                                       return false;
                                   }                                  
                               });
                           });
                       </script>
            </div>

            <div style="clear: both;"></div>
        </div> <br>
        <div class="m2Con">
            <%
                           DBConnect dbW = new DBConnect();
                           ResultSet resW ;
                           String queryW;
                
                           DBConnect dbP = new DBConnect();
                           ResultSet resP ;
                           String queryP;
                
                            DBConnect dbS = new DBConnect();
                           ResultSet resS ;
                           String queryS;
                           
                           DBConnect dbDoc = new DBConnect();
                           ResultSet resDoc ;
                           String queryDoc;
                           
                           DBConnect dbNur = new DBConnect();
                           ResultSet resNur ;
                           String queryNur;
                           
                           int totWdPat = 0;
                           int totCriPat = 0;
                           int totDoc = 0;
                           int totNur = 0;
                           String wd = request.getParameter("wd");
                           if("Load".equals(getLoad)){
                               if("All".equals(wd)){
                                   queryW = "select * from ward;";
                                   resW = dbW.readData(queryW);
                                   try{
                                       while(resW.next()){
                                           totWdPat = 0;
                                              queryP = "select * from patient where Ward = '"+resW.getString("WID")+"' && STS='Discharged';";
                                              resP = dbP.readData(queryP);
                                              try{
                                                  while(resP.next()){
                                                      totWdPat = totWdPat + 1;
                                                  }
                                              }catch(Exception e){
                                       
                                              }
 
            %>
            <div class="allDetCon">
                <h1 class="m2ConHed" style="margin-bottom: 2%; margin-top: 2%;"><%= resW.getString("WID") %></h1>
                <div class="m2RepCon">
                    <div class="repConSep">
                        <p class="lblRep">Number of Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData"><%= resW.getString("NofB") %></p>
                    </div>
                </div>
                <div class="m2RepCon">
                    <div class="repConSep">
                        <p class="lblRep">Number of Patients</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData"><%= totWdPat %></p>
                    </div>
                </div>
                <div class="m2RepCon">
                    <div class="repConSep">
                        <p class="lblRep">Available Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData"><%= Integer.parseInt(resW.getString("NofB"))-totWdPat %></p>
                    </div>
                </div>
            </div>
            <%
            }
        }catch(Exception e){

        }
   }else{
// Load but Select **** Down  ***** >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
               queryW = "select * from ward where WID='"+wd+"';";
               resW = dbW.readData(queryW);
               try{
                   while(resW.next()){
                       totWdPat = 0;
                       totCriPat = 0;
                       totDoc = 0;
                       totNur = 0;
                          queryP = "select * from patient where Ward = '"+resW.getString("WID")+"' && STS !='Discharged' ;";
                          resP = dbP.readData(queryP);
                          try{
                              while(resP.next()){
                                  totWdPat = totWdPat + 1;
                                   if("Very_Bad".equals(resP.getString("STS"))){
                                        totCriPat = totCriPat + 1;
                                    }
                              }
                          }catch(Exception e){
                                       
                          }
                          queryS = "select * from staff where Ward = '"+resW.getString("WID")+"';";
                          resS = dbS.readData(queryS);                        
                          try{
                                while(resS.next()){
                                    if("Doctor".equals(resS.getString("STS"))){
                                        totDoc = totDoc + 1;
                                    }
                                    if("Nurse".equals(resS.getString("STS"))){
                                        totNur = totNur + 1;
                                    }
                                }
                          }catch(Exception e){

                          }
 
            %>
            <div class="m2WardSep ">
                <div class="onlineDiv">

                    <div class="sepOn">
                        <p class="pLbl">Online Doctors</p>
                        <select name="" id="" class="pinp">
                            <%
                            queryDoc = "select * from staff where STS='Doctor' && Ward = '"+wd+"' && Avai = 'Online';";
                            resDoc = dbDoc.readData(queryDoc);
                            try{
                                while(resDoc.next()){
                            %>
                            <option> <%= resDoc.getString("STID") %></option>
                            <%
                        }
                    }catch(Exception e){}
                            %>
                        </select>
                    </div>
                    <div class="sepOn">
                        <p class="pLbl">Online Nurses</p>
                        <select name="" id="" class="pinp">
                            <%
                       queryDoc = "select * from staff where STS='Nurse' && Ward = '"+wd+"' && Avai = 'Online';";
                       resDoc = dbDoc.readData(queryDoc);
                       try{
                           while(resDoc.next()){
                            %>
                            <option> <%= resDoc.getString("STID") %></option>
                            <%
                        }
                    }catch(Exception e){}
                            %>
                        </select>
                    </div>
                </div>
                <br>
                <div class="m2RepCon m2SinCon" style="margin-top: 2%;">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2"><%= resW.getString("NofB") %></p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2"> Available Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2"><%= Integer.parseInt(resW.getString("NofB"))-totWdPat %></p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Patients</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2"><%= totWdPat %></p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Critical Patients</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2"><%= totCriPat %></p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Doctors</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2"><%= totDoc %></p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Nurses</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2"><%= totNur %></p>
                    </div>
                </div>
            </div>
            <div class="m2WardSep" style="width: 55%; overflow-y: scroll;">
                <div style="margin-left: 3%; clear: both; font-family: verdana; clear: both; margin-top: 2%;">
                    <div class="detLbl" style="background-color: crimson; color: white">Reserved</div>
                    <div class="detLbl" style="background-color: greenyellow">Available</div>
                    <div style="clear: both;"></div>
                </div>
                <%
                    
                    int count = 1;
                    String tst ;
                    boolean hasPatient = false;
                    int bedNo;
                    for(count = 1; count <= Integer.parseInt(resW.getString("NofB")); count++){
                        hasPatient = false;
                       try{
                            DBConnect dbB = new DBConnect();
                           ResultSet resB ;
                           String queryB;
                           queryB = "select * from patient where Ward = '"+wd +"' && STS != 'Discharged';";
                           resB = dbB.readData(queryB);
                    
                            while(resB.next()){
                                  
                               bedNo = Integer.parseInt(resB.getString("BedNo"));
                                 
                                if(bedNo == count){
                                   
                                    
                                    hasPatient = true;                          
                                }
                         }
                     }catch(Exception e){
                        
                     }
                     if(hasPatient){
                %>
                <div class="bed" style="background-color: crimson; color: white">
                    <h1 class="bedNo"><%= count %></h1>
                </div>
                <%
           }else{
                %>
                <div class="bed" style="background-color: greenyellow">
                    <h1 class="bedNo"><%= count %></h1>
                </div>
                <%
         }
   }
                
                %>



            </div>
            <%
            }
        }catch(Exception e){

        }
                
// Load but Select **** UP  ***** >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   }
}else{
// Load ..................................................................................................
       queryW = "select * from ward;";
               resW = dbW.readData(queryW);
               try{
                   while(resW.next()){
                       totWdPat = 0;
                          queryP = "select * from patient where Ward = '"+resW.getString("WID")+"' && STS !='Discharged' ;";
                          resP = dbP.readData(queryP);
                          try{
                              while(resP.next()){
                                  totWdPat = totWdPat + 1;
                              }
                          }catch(Exception e){
                                       
                          }
 
            %>
            <div class="allDetCon">
                <h1 class="m2ConHed" style="margin-bottom: 2%; margin-top: 2%;"><%= resW.getString("WID") %></h1>
                <div class="m2RepCon">
                    <div class="repConSep">
                        <p class="lblRep">Number of Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData"><%= resW.getString("NofB") %></p>
                    </div>
                </div>
                <div class="m2RepCon">
                    <div class="repConSep">
                        <p class="lblRep">Number of Patients</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData"><%= totWdPat %></p>
                    </div>
                </div>
                <div class="m2RepCon">
                    <div class="repConSep">
                        <p class="lblRep">Available Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData"><%= Integer.parseInt(resW.getString("NofB"))-totWdPat %></p>
                    </div>
                </div>
            </div>
            <%
            }
        }catch(Exception e){

        }
}
            %>      


            <!--
            
            <div class="m2WardSep ">
                <div class="m2RepCon m2SinCon" style="margin-top: 2%;">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2">100</p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2"> Available Beds</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2">100</p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Patients</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2">100</p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Critical Patients</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2">100</p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Doctors</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2">100</p>
                    </div>
                </div>
                <div class="m2RepCon m2SinCon">
                    <div class="repConSep">
                        <p class="lblRep lblRep2">Number of Nurses</p>
                    </div>
                    <div class="repConSep" style="width: 28%;">
                        <p class="lblRepData lblRepData2">100</p>
                    </div>
                </div>
            </div>
            <div class="m2WardSep" style="width: 55%; overflow-y: scroll;">
                <div style="margin-left: 3%; clear: both; font-family: verdana; clear: both; margin-top: 2%;">
                    <div class="detLbl" style="background-color: crimson; color: white">Reserved</div>
                    <div class="detLbl" style="background-color: greenyellow">Available</div>
                    <div style="clear: both;"></div>
                </div>
                <div class="bed" style="background-color: crimson; color: white">
                    <h1 class="bedNo">1</h1>
                </div>
                <div class="bed" style="background-color: greenyellow">
                    <h1 class="bedNo">2</h1>
                </div>

            </div>
            
            -->
        </div>
    </body></html>
