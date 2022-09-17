

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="java.sql.ResultSet"%>

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

        .cmtBox {
            /*  border: 5px solid;*/
            border-color: rgb(45, 143, 181);
            height: 47vh;
            margin-top: 5%;
            width: 40%;
            border-radius: 5px;
            float: left;

        }

        h3 {
            text-align: center;
            font-size: 2rem;
            margin: 0;
            margin-top: 2%;

        }

        p {
            margin: 0;
            margin-left: 7%;
            font-family: verdana;
            font-size: 0.8rem;

        }

        input {
            margin-left: 7%;
            margin-top: 1%;
            padding: 0.4%;
            width: 50%;
        }

        textarea {
            margin-top: 1%;
            margin-left: 7%;
            width: 80%;
        }

        .button {
            border: none;
            background-color: crimson;
            padding: 1.5%;
            width: 25%;
            margin-left: 64%;
            color: white;
            cursor: pointer
        }

        /*...........................................................................................................*/
        .showCmt {
            border: 1px solid;
            border-color: rgb(45, 143, 181);
            /*height: 20vh;*/
            margin-top: 5%;
            width: 98%;

        }


        .hed {
            border: px solid;
            background-color: rgb(45, 143, 181);
            height: 4vh;
        }

        .hedC {
            margin: 0;
            color: white;
            margin-top: -2%;
            font-family: century gothic;
            font-size: 0.9rem;
            margin-left: 5%;

        }

        .sub {
            margin: 0;
            margin-left: 5%;
            margin-top: 2%;
            font-weight: bold;

        }

        .sugPara {
            margin: 0;
            margin-top: 2%;
            margin-left: 5%;

        }

        .dt {
            margin: 0;
            margin-top: 2%;
            margin-left: 80%;
            color: grey;
        }

        .right {
            /*border: 1px solid;*/
            float: left;
            width: 50%;
            margin-top: 10%;
            height: 75vh;
            overflow: hidden;
            overflow-y: scroll;
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
            String sts = sessionLog.getAttribute("_userstatus").toString();
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
             <%
                 if("Admin".equals(sts)){
                     %>
                        <a href="AdminWard.jsp" class="naBtn">Ward</a>
            <a href="AdminNurse.jsp" class="naBtn">Nurse</a>
            <a href="AdminDoctor.jsp" class="naBtn">Doctor</a>
            <a href="Patient.jsp" class="naBtn">Patient</a>
            <a href="AddMedecine.jsp" class="naBtn">Add Medicine</a>
            <a href="AddStaff.jsp" class="naBtn">Account</a>
            <a href="AddWard.jsp" class="naBtn">Add Ward</a>
                     <%
                 
                 }else if("Pharmacist".equals(sts)){
                    %>
                    <a href="Pharmacist.jsp" class="naBtn">Home</a>
                        <a href="Suggestions.jsp" class="naBtn">Suggestions</a>
                    <%
                }else if("Receptionist".equals(sts)){
                    %>
                    <a href="AddPatient.jsp" class="naBtn">Add Patient</a>
                    <a href="Suggestions.jsp" class="naBtn">Suggestions</a>
                    <%
                }else if("Doctor".equals(sts)){
                    %>
                        <a href="DoctorAndNurse.jsp" class="naBtn">Home</a>
                         <a href="AddMedication.jsp" class="naBtn">Add Medicine</a>
                        <a href="AddDailyReport.jsp" class="naBtn">Add Daily Report</a>
                        <a href="Suggestions.jsp" class="naBtn">Suggestions</a>
                    <%
                }else if("Nurse".equals(sts)){
                    %>
                     <a href="DoctorAndNurse.jsp" class="naBtn">Home</a>
                     <a href="AddActivity.jsp" class="naBtn">Add Activity</a>  
                      <a href="Suggestions.jsp" class="naBtn">Suggestions</a>
                    <%
                }
             %>
            
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
    <div class="cmtBox">
        <h3>Suggestions</h3>
        <form action="Servelet_Suggestions" id="form-id">
            <p>Subject</p>
            <input type="text" placeholder="Subject" name="su" id="su">
            <br><br>
            <p>Suggestion</p>
            <textarea name="cn" id="des" cols="30" rows="7" ></textarea> <br>
            <input type="submit" value="Post" class="button" id="subB">
            
        </form>
          <script src="jquery-3.3.1.js"></script>
        <script>
            $(document).ready(function () {

                var cl = $("#subB").click(function () {
                    var retVal; 
                    
                    if ($("#su").val().length == 0) {
                        retVal = 1; 
                        alert("Please enter the Subject.")
                        return false;
                    }
                     if ($("#des").val().length == 0) {
                        retVal = 1; 
                        alert("Please enter your suggestion.")
                        return false;
                    }
                   // alert(retVal)
                });$('#form-id')[0].reset();
            });
        </script>
        
    </div>
        
    <div class="right">
    <%
        DBConnect db = new DBConnect();
        String query = "select * from suggestions;";
        ResultSet res = db.readData(query);
        try{
            while(res.next()){
                %>
      <div class="showCmt">
        <div class="hed"><br>
            <h4 class="hedC"><%= res.getString("STID") %> ( <%=res.getString("POST") %> ) </h4>
        </div>
        <p class="sub"> <%= res.getString("SB") %></p>
        <p class="sugPara"><%= res.getString("CN") %></p>
        <p class="dt"><%= res.getString("DT") %></p>
        <br>
    </div>
                <%
            }
        }catch(Exception e){}
    %>
    </div>
</body></html>
