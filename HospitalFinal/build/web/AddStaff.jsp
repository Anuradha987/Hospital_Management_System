
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Patient</title>
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
            select{
                font-size: 0.9rem;
                padding: 1.2%;
                width: 83%;
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
                margin-top: 3%;
            }

            .div {
                /* border: 1px solid;*/
                height: 85vh;
               
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
                    <br/>
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
        <form action="Servelet_AddStaff" class="form" method="post">
            <h3 class="lgHed">Create Staff Account</h3>
            <hr><br>
            <div class="div">
                <p class="label">Staff ID</p>
                <input type="text" placeholder="ID" name="sid" id="sid"><br>
                <p class="label">First Name</p>
                <input type="text" placeholder="First Name" name="fn" id="fn"><br>
                <p class="label">Last Name</p>
                <input type="text" placeholder="Last Name" name="ln" id="ln"><br>
                <p class="label">Ward</p>
                <!-- <input type="text" placeholder="Ward" name="wd"><br>-->
                <select name="wd" id="wd"> <option value="none">--Select the ward--</option>
                    <% 
                         DBConnect db = new DBConnect();         
                        String query = "select * from ward;";   
                        ResultSet res = null;
                        res = db.readData(query);
                        try{
                            while(res.next()){
                    %>
                    <option><%= res.getString("WID").toString() %></option>
                    <%
                    }
                 }catch(Exception ex){
                            
               }
                    %>
                </select>
                <p class="label">license No</p>
                <input type="text" placeholder="" name="lcn" id="lcn"><br>

                <p class="label">Password</p>
                <input type="password" placeholder="Password" name="pw" id="pw">
                <p class="label">Contact No</p>
                <input type="text" placeholder="" name="cn" id="cn"><br>
                <p class="label">User Role</p>
                <select name="st" id="st">
                     <option value="none">--Select the user role--</option>
                    <option>Admin</option>
                    <option>Nurse</option>
                    <option>Doctor</option>
                    <option>Pharmacist</option>
                    <option>Receptionist</option>
                </select>
                <br><br>
                <input type="submit" class="btnSub" value="Submit" id="subB">
                <br><br><br>
            </div>
        </form>
        <script src="jquery-3.3.1.js"></script>
        <script>
            $(document).ready(function () {
            /*    function ValidateEmail(mail)
                {
                    if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(myForm.emailAddr.value))
                    {
                        return (true)
                    }
                    alert("You have entered an invalid email address!")
                    return (false)
                }*/
                var cl = $("#subB").click(function () {
                    var retVal;
                    
                  if ($("#sid").val().length == 0) {
                        retVal = 1; 
                        alert("Please enter the Staff ID.")
                        return false;
                    }
                    
                   if ($("#fn").val().length == 0) {
                        retVal = 1; 
                     alert("Please enter the first name.")
                        return false;
                    }
                    else{
                                if($.isNumeric($("#fn").val())){
                                   retVal = 1;  
                                     alert("Invalid first name!")  
                                     return false;
                            }                    
                    }
                 
                    if ($("#ln").val().length == 0) {
                        retVal = 1; 
                       alert("Please enter the last name.")
                        return false;
                    }
                    else{
                    
                     if($.isNumeric($("#ln").val())){
                       retVal = 1;  
                         alert("Invalid last name")  
                           return false;
                     }    
                 }
                 
                  if ($("#wd").val()=="none") {
                        retVal = 1; 
                       alert("Please select the ward.")
                        return false;
                    }
                    if ($("#lcn").val().length == 0) {
                        retVal = 1;
                       alert("Please enter the license Number")
                        return false;
                    }                    
                    if ($("#pw").val().length == 0){
                        retVal = 1;  
                       alert("Please enter the password.")
                        return false;
                    }
                    else{
                        if($("#pw").val().length<6){
                            alert("Password should contain at least 6 digits")
                            return false;
                        }
                    }
                    
                    
                    if ($("#cn").val().length == 0 || $("#cn").val().length<10) {
                        retVal = 0; 
                      alert("Please enter the correct phone number")
                        return false;
                    }
                    else{
                                if(Math.floor($("#cn").val()) == $("#cn").val() && $.isNumeric($("#cn").val())){
                                    return true;
                                }
                                else{
                                    alert("Contact No can't convert from String to integer!")
                                    return false;                           
                                }
                    }
                });

            });
        </script>
    </body>
</html>
