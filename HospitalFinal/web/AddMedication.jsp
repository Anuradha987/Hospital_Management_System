
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Clases.DBConnect"%>
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

        .div {
            /* border: 1px solid;*/
            height: 55vh;
            width: 60%;
            margin-left: 20%;
            margin-top: 8%;
        }

        .sep {
            /*border: 1px solid;*/
            height: 100%;
            width: 49.7%;
            float: left;
            border-radius: 3px;

        }

        .para {
            color: white;
            font-family: century gothic;
            font-size: 0.9rem;
            width: 80%;
            margin-left: 10%;
        }

        .left {
           border-left: 2px solid red;
            border-top: 2px solid red;
            border-bottom: 2px solid red;
        }
        .right {
           border-right: 2px solid red;
            border-top: 2px solid red;
            border-bottom: 2px solid red;
        }
        .lbl{
            margin: 0;
            margin-top: 4%;
            margin-left: 15%;
            font-family: verdana;
            font-size: 0.85rem;
        }
        select,.tb{
            padding: 1%;
            width: 70%;
            margin-left: 15%;
         
        }
        select{
            width: 73%;
            margin-top: 2%;
        }
        .btn{
            border: none;
            background-color: crimson;
            padding: 2%;
            margin-top: 5%;
            width: 30%;
            color: white;
            font-size: 1rem;
            margin-left: 15%;
            border-radius: 3px;
            cursor: pointer;
        }
        .img{
            background-image: url(CssImages/ssssss.png);
            height: 35vh;
            width: 90%;
            background-position: center;
            background-size: 100% 100%;
            margin-left: 5%;
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
    <div class="div">
        <div class="sep left">
            <br><br>
            <h1 style="text-align: center;">Add Medicine</h1>
           <hr>
            <div class="img">
                
            </div>
        </div>
        <div class="sep right">
           <br><br>
            <form action="Servelet_AddMedication" method="post" id="form-id">
                <p class="lbl">Patient ID :</p>
                <select name="pid" id="">
                     <%
                        DBConnect db1 = new DBConnect();
                        String query1 = "select * from patient where STS != 'Discharged';";
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
               <br>
               <p class="lbl">Medecine Name :</p>
                <select name="mid" id="">
                    <%
                        DBConnect db = new DBConnect();
                        String query = "select * from medicine;";
                        ResultSet res = db.readData(query);
                        try{
                            while(res.next()){
                                %>
                                <option><%= res.getString("NM") %></option>
                                <%
                            }
                        }catch(Exception ex){
                            
                        }
                    %>
                </select> 
               <br>
               <p class="lbl">Quantity</p>
               <input type="text" class="tb" name="qn" id="qn">
                  <br>
                  <input type="submit" class="btn" value="Add" id="subB">
            </form>
                 <script src="jquery-3.3.1.js"></script>
        <script>
            $(document).ready(function () {

                var cl = $("#subB").click(function () {
                    var retVal;                 
                    if ($("#qn").val().length == 0) {
                        alert("Quantity Cannot be blank !");
                        retVal = 0;
                        return false;
                    }else{
                        if(Math.floor($("#qn").val()) == $("#qn").val() && $.isNumeric($("#qn").val())){
                            return true;
                        }else{
                            alert("( Quantity ) Cannot convert String to integer!")
                            return false;                           
                        }
                    }
                   // alert(retVal)
                });
            });
        </script>
        </div>
    </div>
</body></html>
