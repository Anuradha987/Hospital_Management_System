
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="java.util.*"%>

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

            /* m2 ................................................................*/
            .m2 {
                /*  border: 1px solid;*/
                height: 89vh;
            }

            .m2Sep {
                /*border: 1px solid;*/
                height: 100%;
                width: 40%;
                float: left;
            }

            .lblM2 {
                margin: 0;
                margin-left: 7%;
                font-family: verdana;
                font-size: 0.9rem;
                margin-top: 1.5%;
                margin-bottom: 1%;
            }

            .inpM2 {
                padding: 1%;
                font-family: verdana;
                width: 60%;
                margin-left: 7%;
            }

            .btnRemove {
                border: none;
                background-color: crimson;
                color: white;
                padding: 1.5%;
                width: 18%;
                margin-left: 7%;
                margin-top: 2%;
            }

            .btnUpdate {
                border: none;
                background-color: greenyellow;
                color: black;
                padding: 1.5%;
                width: 44%;

            }

            .m2RSep {
                /*   border: 1px solid;*/
                height: 70%;
                margin-top: 3%;
                overflow-y: scroll;
            }

            .m2Psep {
                /*            border: 1px solid;*/
                float: left;
                width: 15%;

            }

            .lblM2R {
                font-size: 0.8rem;
                font-family: verdana;
                margin: 0;
            }

            .pContainer {

                clear: both;
                margin-bottom: 2.8%;
            }
            .m2UperPnl{
                /* border: 1px solid;*/
                width: 40%;
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
            <br>
            <div class="upSep">
                <form action="">
                    <p class="lbldp">Doctor ID:</p>
                    <select name="nid" id="" class="patDp">
                        <%
                       
                               DBConnect db1 = new DBConnect();
                               String query1 = "select * from staff where STS='Doctor';";
                               ResultSet res1 = db1.readData(query1);
                               try{
                                   while(res1.next()){
                        %>
                        <option><%= res1.getString("STID") %></option>
                        <%
                    }
                }catch(Exception ex){
                            
                }
                        %>
                    </select>
                    <!-- <input type="submit" class="loadBtn" value="Load"> -->
                    <button class="loadBtn" name="load" value="Load">load</button>
                    <%
                            String getNLoad = request.getParameter("load");
                    %>
                </form>
            </div>
                
                <%
                int non = 0;
                int noon = 0;
                int noofn = 0;
                
                DBConnect dbOnn = new DBConnect();
                String queryOnn = "select * from staff where STS = 'Doctor';";
                ResultSet resOnn = dbOnn.readData(queryOnn);
                try{
                    while(resOnn.next()){
                        non++;
                        if(resOnn.getString("Avai").equals("Online")){
                            noon++;
                        }
                        if(resOnn.getString("Avai").equals("Offline")){
                            noofn++;
                        }
                    }
                }catch(Exception e){}
            %>
            
            <div class="upSep" style="width: 69%">
                <div class="detCon lCon">
                    <div class="detConInSep dciL">
                        <p class="conLbl">No Of <br>Doctors</p>
                    </div>
                    <div class="detConInSep dciR">
                        <p class="conVal"><%= non %></p>
                    </div>
                </div>
                <div class="detCon mCon">
                    <div class="detConInSep dciL">
                        <p class="conLbl">No Of <br> Online Doctors</p>
                    </div>
                    <div class="detConInSep dciR">
                       <p class="conVal"><%= noon %></p>
                    </div>
                </div>
                <div class="detCon rCon">
                    <div class="detConInSep dciL">
                        <p class="conLbl">No Of <br> Offline Doctors</p>
                    </div>
                    <div class="detConInSep dciR">
                        <p class="conVal"><%= noofn %></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="m2">
            <div class="m2Sep">
                <br>
                <form action="Servelet_UpdateDoctor">
                    <%
                        String stid = request.getParameter("nid");
                        DBConnect dbDoc = new DBConnect();
                        ResultSet resDoc ;
                        String queryDoc = null;
                         if("Load".equals(getNLoad)){
                             queryDoc = "select * from staff where STID='"+stid+"';";
                             resDoc = dbDoc.readData(queryDoc);
                             try{
                                while(resDoc.next()){
                    %>
                    <p class="lblM2">Doctor ID</p>
                    <input type="text" class="inpM2" readonly="" name="stid" value=<%= resDoc.getString("STID")%>>
                    <p class="lblM2">First Name</p>
                    <input type="text" class="inpM2" id="fn" name="fn" value=<%= resDoc.getString("FN")%>>
                    <p class="lblM2">Last Name</p>
                    <input type="text" class="inpM2" name="ln" id="ln" value=<%= resDoc.getString("LN")%>>
                    <p class="lblM2">Ward</p>
                    <input type="text" class="inpM2" name="wd" id="wd" value=<%= resDoc.getString("Ward")%>>
                    <p class="lblM2">Lycen No</p>
                    <input type="text" class="inpM2" name="lcn" id="lcn" value=<%= resDoc.getString("LycNo")%>>
                    <p class="lblM2">Contact No</p>
                    <input type="text" class="inpM2" name="cn" id="cn" value=<%= resDoc.getString("CN")%>>
                    <p class="lblM2">Password</p>
                    <input type="text" class="inpM2" name="pw" id="pw" value=<%= resDoc.getString("PW")%> >
                    <p class="lblM2">Availability ( Now : <%= resDoc.getString("Avai") %> )</p>                                
                    <select class="inpM2" name="avai">
                        <%
                            if("Online".equals(resDoc.getString("Avai"))){
                        %>
                        <option>Offline</option>
                        <%
                    }else{
                        %>
                        <option>Online</option>
                        <%
                    }
                        %>                                      
                    </select>

                     <br/><br/>
                    <!--<input type="submit" class="btnRemove" value="Remove">-->
                    <input type="submit" class="btnUpdate" id="subB" value="Update" style="margin-left:6%">
                    
                     <script src="jquery-3.3.1.js"></script>
        <script>
            $(document).ready(function () {
                
                var cl = $("#subB").click(function () {
                    var retVal;
                    
                    if ($("#fn").val().length == 0) {
                        alert("First Name Cannot be blank !");
                        retVal = 1;
                        return false;
                    }
                    if ($("#ln").val().length == 0) {
                        alert("Last Name Cannot be blank !");
                        retVal = 1;
                        return false;
                    }
                    if ($("#lcn").val().length == 0) {
                        alert("Licen No Cannot be blank !");
                        retVal = 1;
                        return false;
                    }
                    if ($("#pw").val().length == 0) {
                        alert("Password Cannot be blank !");
                        retVal = 1;
                        return false;
                    }
                     if ($("#wd").val().length == 0) {
                        alert("Ward Cannot be blank !");
                        retVal = 1;
                        return false;
                    }
                    if ($("#cn").val().length == 0) {
                        alert("Contact No Cannot be blank !");
                        retVal = 0;
                        return false;
                    } else {
                        if (Math.floor($("#cn").val()) == $("#cn").val() && $.isNumeric($("#cn").val())) {
                            return true;
                        } else {
                            alert("( Contact No )Cannot convert String to integer!")
                            return false;
                        }
                    }
                   

                });

            });
        </script>
                    
                    
                    <%
                 }
                         }catch(Exception e){}
         }
                    
                    %>
                    <!--
                    <p class="lblM2">Doctor ID</p>
                    <input type="text" class="inpM2">
                    <p class="lblM2">First Name</p>
                    <input type="text" class="inpM2">
                    <p class="lblM2">Last Name</p>
                    <input type="text" class="inpM2">
                    <p class="lblM2">Ward</p>
                    <input type="text" class="inpM2">
                    <p class="lblM2">Lycen No</p>
                    <input type="text" class="inpM2">
                    <p class="lblM2">Contact No</p>
                    <input type="text" class="inpM2">
                    <p class="lblM2">Password</p>
                    <input type="text" class="inpM2"><br>
                    <!-- <p class="lblM2">Last Name</p>
                    <input type="text" class="inpM2">-->

                </form>
            </div>
            <div class="m2Sep" style="width: 59%;">
                <div class="m2RSep">
                    <h2 style="text-align: center; margin: 0">All Patient List</h2>
                    <div style="clear: both"></div>
                    <br>
                    <div class="pContainer">
                        <div class="m2Psep">
                            <h4 style="margin: 0;text-align: center">Date</h4>
                        </div>
                        <div class="m2Psep">
                            <h4 style="margin: 0;text-align: center">ID</h4>
                        </div>
                        <div class="m2Psep" style="width: 18%;">
                            <h4 style="margin: 0;">L.Name</h4>
                        </div>
                        <div class="m2Psep" style="width: 35%;">
                            <h4 style="margin: 0;">Reason</h4>
                        </div>
                        <div class="m2Psep">
                            <h4 style="margin: 0;">Status</h4>
                        </div>
                    </div><br>
                    <%
                        DBConnect dbN = new DBConnect();
                        String queryN ;
                        ResultSet resN ;
                        String nWard = "";
                    
                        DBConnect dbNP = new DBConnect();
                        String queryNP ;
                        ResultSet resNP ;
                        
//                        DBConnect dbNP = new DBConnect();
//                        String queryNP ;
//                        ResultSet resNP ;
                        
                        DBConnect dbDID = new DBConnect();
                        String queryDID ;
                        ResultSet resDID ;
                        String DidF = null;
                        
                        DBConnect dbPDD = new DBConnect();
                        String queryPDD ;
                        ResultSet resPDD ;
                       // String stid = request.getParameter("nid");
                    
                       List<String> listNP =new ArrayList<String>(); 
                   
                        if("Load".equals(getNLoad)){
                       
                            queryN = "select * from staff where STID='"+stid+"';";
                            resN = dbN.readData(queryN);
                            try{
                                while(resN.next()){
                                    nWard = resN.getString("Ward");
                                }
                            }catch(Exception e){}                       
                            queryNP = "select * from patient where Ward = '"+nWard+"' && STS != 'Discharged';";
                            resNP = dbNP.readData(queryNP);
                            try{
                                while(resNP.next()){
                                    listNP.add(resNP.getString("PID"));
                    %>
                    <div class="pContainer">
                        <div class="m2Psep">
                            <div class="lblM2R"><%= resNP.getString("ADDate") %></div>
                        </div>
                        <div class="m2Psep">
                            <div class="lblM2R"><%= resNP.getString("PID") %></div>
                        </div>
                        <div class="m2Psep" style="width: 18%;">
                            <div class="lblM2R"><%= resNP.getString("LN") %></div>
                        </div>
                        <div class="m2Psep" style="width: 35%;">
                            <div class="lblM2R"><%= resNP.getString("Reason") %></div>
                        </div>
                        <div class="m2Psep">
                            <div class="lblM2R"><%= resNP.getString("STS") %></div>
                        </div>
                    </div>
                    <%
                }
            }catch(Exception e){}
                        
        }else{
            queryDID = "select * from staff where STS='Doctor' limit 1;";
            resDID = dbDID.readData(queryDID);
            try{
                while(resDID.next()){
                    DidF = resDID.getString("Ward");
                }
            }catch(Exception e){}
            
            queryPDD = "select * from patient where Ward='"+DidF+"';";
            resPDD = dbPDD.readData(queryPDD);
            try{
                while(resPDD.next()){
                    %>
                    <div class="pContainer">
                        <div class="m2Psep">
                            <div class="lblM2R"><%= resPDD.getString("ADDate") %></div>
                        </div>
                        <div class="m2Psep">
                            <div class="lblM2R"><%= resPDD.getString("PID") %></div>
                        </div>
                        <div class="m2Psep" style="width: 18%;">
                            <div class="lblM2R"><%= resPDD.getString("LN") %></div>
                        </div>
                        <div class="m2Psep" style="width: 35%;">
                            <div class="lblM2R"><%= resPDD.getString("Reason") %></div>
                        </div>
                        <div class="m2Psep">
                            <div class="lblM2R"><%= resPDD.getString("STS") %></div>
                        </div>
                    </div>
                    <%
                }
            }catch(Exception e){}
            
        }
                
                    %>


                </div>
                
        </div>
    </body></html>