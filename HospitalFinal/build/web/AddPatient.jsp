
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Clases.DBConnect"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Patient</title>
        <style>
            body{
                margin: 0;
                padding:0;
            }
            input {
                font-size: 0.9rem;
                padding: 1.2%;
                width: 70%;
                margin-left: 8%;
                margin-top: 1.2%;
            }
            select{
                font-size: 0.9rem;
                padding: 1.2%;
                width: 74%;
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
                margin-bottom: 5%
            }

            hr {
                border-color: lightgrey
            }

            .form {
                /*border: 1px solid;*/
                border: 5px solid;
                width: 35%;
                margin-left: 35%;
                margin-top: 2%;
            }

            .div {
                /* border: 1px solid;*/
                height: 60vh;
                overflow-y: scroll;
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
                    <a href="AddPatient.jsp" class="naBtn">Add Patient</a>
                    <a href="Suggestions.jsp" class="naBtn">Suggestions</a>
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
            <form action="Servelet_AddPatient" class="form" method="post">
                <h3 class="lgHed">Add Patient</h3>
                <hr><br>
                <div class="div">
                    <p class="label">Patient ID</p>
                    <input type="text" placeholder="ID" name="pid" id="pid"><br>
                    <p class="label">First Name</p>
                    <input type="text" placeholder="First Name" name="fn" id="fn"><br>
                    <p class="label">Last Name</p>
                    <input type="text" placeholder="Last Name" name="ln" id="ln"><br>
                    <p class="label">Patient Type</p>
                    <select id="pType" name="pTy">
                        <option value="none">--Select the patient type</option>
                        <option>Non Admit</option>
                        <option>Admit</option>
                    </select>
                    <p class="ld" style="
                       width:20%; 
                       padding:0.5%; 
                       background-color: red; 
                       margin-left: 8%; 
                       color: white; 
                       text-align: center" 
                           >load</p>
                       <div id="nonAdmit">
                           <p class="label">Doctor ID ( Available Right Now )</p>                   
                           <select name="doc" id="doc"> <option value="none">--Select a doctor--</option>
                               <% 
                        
                                    DBConnect db1 = new DBConnect();         
                                   String query1 = "select * from staff where STS = 'Doctor' && Avai = 'Online';";   
                                   ResultSet res1 = null;
                                   res1 = db1.readData(query1);
                                   try{
                                       while(res1.next()){
                               %>
                               <option><%= res1.getString("STID").toString() %></option>
                               <%
                               }
                            }catch(Exception ex){
                            
                          }
                               %>
                           </select>
                       </div>
                       <div id="Admit">
                           <p class="label">Ward</p>                   
                           <select name="wd" id="wd">
                               <!--<option value="none">--Select the ward</option>-->
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
                           <p class="label">Bed No</p>
                           <input type="text" placeholder="Bed No" name="bn"><br>
                           <!--  <p class="label">Admitted Date</p>
                             <input type="text" placeholder="dd / mm / yyyy" name="dt"><br> -->

                       </div>
                       <p class="label">Reason</p>
                       <input type="text" placeholder="Reason" name="rs" id="rs"> 
                       <p class="label">Contact No</p>
                       <input type="text" placeholder="" name="cn" id="cn"><br>
                       <p class="label">Email</p>
                       <input type="text" placeholder="" name="em" id="em"><br>
                       <p class="label">Status</p>
                       <!-- <input type="text" placeholder="" name="st"><br> -->
                       <select name="st">
                           <option>Very Bad</option>
                           <option>Bad</option>
                           <option>Normal</option>
                       </select>
                       <br><br>
                       <input type="submit" class="btnSub" value="Submit" id="subB">
                       <br><br><br>
                       <script src="JavaScript/jquery-3.3.1.js"></script>
                       <script>
                           $(document).ready(function () {
                           

                               $("#Admit").hide();
                               var valType;
                               $(".ld").click(function () {
                                   valType = $("#pType option:selected").text();
                                   if (valType == "Admit") {
                                       //alert("hi");
                                       // $("#Admit").css({visibility:"visible"})
                                       // $("#nonAdmit").css({visibility: "hidden"});
                                       $("#Admit").show();
                                       $("#nonAdmit").hide();
                                   } else {
                                       //$("#Admit").css({visibility: "hidden"});
                                       //$("#nonAdmit").css({visibility: "visible"});
                                       $("#Admit").hide();
                                       $("#nonAdmit").show();
                                   }
                               });

                               var cl = $("#subB").click(function () {
                                   var retVal = 0;
                                   if ($("#pid").val().length == 0) {
                                       retVal = 1;
                                       alert("Please enter the Patient ID !");
                                       return false;
                                   }
                                   
                                   
                                   if ($("#fn").val().length == 0) {
                                       retVal = 1;
                                       alert("First Name Cannot be blank !");
                                       return false;
                                   }
                                   else{
                                        if($.isNumeric($("#fn").val())){
                                           retVal = 1;  
                                             alert("Invalid first name!");  
                                             return false;
                                            }                    
                                    }
                                    
                                    
                                   if ($("#ln").val().length == 0) {
                                       retVal = 1;
                                       alert("Last Name Cannot be blank !");
                                       return false;
                                   }
                                   else{
                                        if($.isNumeric($("#ln").val())){
                                           retVal = 1;  
                                             alert("Invalid last name!");  
                                             return false;
                                            }                    
                                    }
                                    
                                       if ($("#pType").val()=="none") {
                        retVal = 1; 
                       alert("Please select the Patient type.")
                        return false;
                    }
                    
                     /*if ($("#wd").val()=="none") {
                        retVal = 1; 
                       alert("Please select the ward.")
                        return false;
                    }*/
                                    
                                       if ($("#doc").val()=="none") {
                        retVal = 1; 
                       alert("Please select the doctor.")
                        return false;
                    }
                    
                                   if ($("#rs").val().length == 0) {
                                       alert("Reason Cannot be blank !");
                                       retVal = 1;
                                       return false;
                                   }
                                   
                                 
                                      /*  if{
                                       function ValidateEmail("#em")
                               {
                                   if (/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(myForm.emailAddr.value))
                                   {
                                       return (true);
                                   }
                                   alert("You have entered an invalid email address!")
                                   return (false);
                               }
                                   }*/
          if ($("#em").val().length == 0) {
                                       alert("Email Cannot be blank !");
                                       retVal = 1;
                                       return false;
                                   }
                     /*             else{
                              
                        if($("#em").val().match("/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})$")){
                             //   return true;   
                                alert("valid email address");
                            }
                            else{
                             //  return false;
                                alert("Invalid email address");
                            }
                                   }

                 */
                 
                                  
                                  if ($("#cn").val().length == 0 || $("#cn").val().length<10) {
                        retVal = 0; 
                      alert("Please enter the correct phone number!")
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
                    </div>
                </form>
            </body>
        </html>
