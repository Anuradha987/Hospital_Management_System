
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
        <style>
            body{
                margin: 0;
            }
               input {
                font-size: 0.9rem;
                padding: 1.2%;
                width: 80%;
                margin-left: 8%;
                margin-top: 1.2%;
            }


            .btnSub {margin-left:150px;
                border: none;
                padding: 2.3%;
                width: 40%;
                background-color: blue;
                color: white;
                border-radius: 3px;
            }
            .label {
                margin: 0;
                font-size: 0.8rem;
                margin-left: 8%;
                font-family: verdana;
                margin-top: 3%;
            }

             .lgHed {
                font-size: 2rem;
                margin: 0;
                text-align: center;
                margin-top: 5%
            }
            hr {
                border-color: lightgrey
            }

            .form {
                 border: 4px solid lightgrey;
                width: 35%;
                margin-left: 35%;
                margin-top: 8%;
                
            }

            .div {
                /* border: 1px solid;*/
                height: 35vh;
                /*  overflow-y: scroll;*/
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
        <form action="Servelet_AddWard" class="form" onsubmit="" name="form" id="form" method="post">
            <h3 class="lgHed">Add New Ward</h3>
            <hr><br>
            <div class="div">
                <p class="label">Ward Name</p>
                <input type="text" placeholder="ex :- 1,5,ICU" name="wid" id="wid"><br>
                <p class="label">No of Beds</p>
                <input type="text" placeholder="ex :- 15" name="nob" id="nob"><br>

                <br><br>
                <input type="submit"  class="btnSub" value="Submit" id="subB">
                <!--<p id="p">adfasdfasdf</p>-->
                <br><br><br>
            </div>
        </form>
        <script src="jquery-3.3.1.js"></script>
        <script>
            $(document).ready(function () {

                var cl = $("#subB").click(function () {
                    var retVal;
                    if ($("#wid").val().length == 0) {
                        alert("Please enter the Ward ID" );
                        retVal = 1;
                        return false;
                    }
                    if ($("#nob").val().length == 0) {
                        alert("Please enter the number of Beds  !");
                        retVal = 0;
                        return false;
                    }else{
                        if(Math.floor($("#nob").val()) == $("#nob").val() && $.isNumeric($("#nob").val())){
                            return true;
                        }else{
                            alert("Number of beds should be an integer!")
                            return false;                           
                        }
                    }
                   // alert(retVal)
                });
            });
        </script>

    </body></html>
