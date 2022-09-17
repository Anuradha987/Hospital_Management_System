
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
               .label {
                margin: 0;
                font-size: 0.8rem;
                margin-left: 8%;
                font-family: verdana;
                margin-top: 3%;
            }
           input {
                font-size: 0.9rem;
                padding: 1.2%;
                width: 80%;
                margin-left: 8%;
                margin-top: 1.2%;
            }

        .btnSub {
            border: none;
            padding: 2.3%;
            width: 30%;
            background-color: blue;
            color: white;
            border-radius: 3px
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
                margin-top: 3%;
            }



        .div {
            /* border: 1px solid;*/
            height: 65vh;
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
    <form action="Servelet_AddMedecine" class="form" method="post" id="form" name="form">
      
        <h3 class="lgHed">Add New Medicine</h3>   <hr>
        <div class="div"> <br>
            <p class="label">Medicine ID</p>
            <input type="text" placeholder="" name="mid" id="mid"><br>
            <p class="label">Name</p>
            <input type="text" placeholder="" name="mn" id="mn"><br>
            <p class="label">Quantity</p>
            <input type="text" placeholder="" name="qn" id="qn"><br>
            <p class="label">Unit oF Measure</p>
            <input type="text" placeholder="" name="uom" id="uom"><br>
            <p class="label">Each Price</p>
            <input type="text" placeholder="" name="pri" id="pri"><br>
            <br><br>
            <input type="submit" class="btnSub" value="Submit" id="subB">
            <br><br><br>
        </div>
    </form>
 <script src="jquery-3.3.1.js"></script>
        <script>
            $(document).ready(function () {

                var cl = $("#subB").click(function () {
                    var retVal;
                    if ($("#mid").val().length == 0) {
                        alert("Medicine ID can not be blank !");
                        retVal = 1;
                        return false;
                    }
                    if ($("#mn").val().length == 0) {
                        alert("Please enter the medicine name.");
                        retVal = 1;
                        return false;
                    }
                    if ($("#qn").val().length == 0) {
                        alert("Please enter the quantity!");
                        retVal = 0;
                        return false;
                    }else{
                        if(Math.floor($("#qn").val()) == $("#qn").val() && $.isNumeric($("#qn").val())){
                            return true;
                        }else{
                            alert("Quantity should be a number");
                            return false;                           
                        }
                    }
                    
                    if ($("#uom").val().length == 0) {
                        alert("Please enter the UOM");
                        retVal = 1;
                        return false;
                    }
                    
                    
                    if ($("#pri").val().length == 0) {
                        retVal = 0;
                        return false;
                    }else{
                        if(Math.floor($("#pri").val()) == $("#pri").val() && $.isNumeric($("#pri").val())){
                            return true;
                        }else{
                            alert(" ( Price ) Cannot convert String to integer!");
                            return false;                           
                        }
                    }
                   // alert(retVal)
                });
                $("#form")[0].reset();
            });
        </script>
</body></html>
