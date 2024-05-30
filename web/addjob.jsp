<%-- 
    Document   : addjob
    Created on : Dec 13, 2023, 8:09:01 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title> Add jobs </title>
   <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/loginstyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- google fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Lora:wght@400;500&family=Montserrat:wght@300;400;500;600;800;900&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
<style>
     #success{
    color: blue;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 2rem;
 }  
</style>


</head>


<body>

<%@include file="recruiternavbar.jsp" %>

<!--jobs start--> 

    <div class="container">
        <%
                   try{
                       String data = session.getAttribute("msg").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("msg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
         
        <div class="title" >Post jobs</div>
         
        <div class="content">
            <form action="addjobcode.jsp">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Enter Title</span>
                        <input type="text" required  name="title">
                    </div>
                   

                    <div class="input-box">
                        <span class="details">Location</span>
                        <select name="location" >
                            <option value="Choose">Choose...</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Bangalore">Bangalore</option>
                            <option value="Hyderabad">Hyderabad</option>
                            <option value="Chennai">Chennai</option>
                            <option value="Kolkata">Kolkata</option>
                            <option value="Pune">Pune</option>
                            <option value="Nagpur">Nagpur</option>
                            <option value="Solapur">Solapur</option>
                        </select>
                    </div>

                    <div class="input-box">
                        <span class="details">Category</span>
                        <select name="category">
                            <option value="choose">Choose</option>
                            <option value="IT">IT</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Nurse">Nurse</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Electrician">Electrician</option>
                            <option value="Data Architect">Data Architect</option>
                            <option value="Accountant">Accountant</option>
                            <option value="Finance">Finance</option>
                            <option value="Marketing">Marketing</option>
                           
                        </select>
                    </div>
                    <div class="input-box" >
                        <span class="details">Status</span>
                        <select name="status">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    
                   

                    
                </div>
                <div class="message">
                    <span class="details" >Enter Description</span>
                        <textarea class="message-box" id="" cols="0" rows="0"  required name="description" spellcheck="false"></textarea>
                    
                </div>
                
                <div class="button">
                    <input type="submit" value="Add Jobs">
                </div>
                
             
            </form>
        </div>
    </div>

   <!-- profile start  -->

 <%@include file="profile.jsp" %>
<!-- js link  -->
    <script src="js/script.js"></script>

</body>

</html>