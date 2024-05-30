<%-- 
    Document   : navbar
    Created on : Dec 17, 2023, 6:57:13 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruter Page</title>

    <!-- custome css link  -->
    <link rel="stylesheet" href="css/style.css">
   
    <!-- bxicon icons  -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- google fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Lora:wght@400;500&family=Montserrat:wght@300;400;500;600;800;900&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>

    <!-- start header  -->
        <header>
            <a href="index.jsp" class="logo"><i class='bx bxs-briefcase'></i>TalentTrack</a>
            <c:if test="{r.role equals 'recruiter'}">
                  <ul class="navbar">
                <li ><a href="recruiter.jsp">Home</a></li>
                <li ><a href="addjob.jsp">Post jobs</a></li>
                <li ><a href="viewjobsrecruiter.jsp">view jobs</a></li>
                <li ><a href="#">Apply job list</a></li>
                <li ><a href="contact.jsp">Contact</a></li>
            </ul>  
            </c:if>
            
        
            <div class="header-icons">
                <a href="#" class="btn" onclick="openPopup()" >profile</a>
            <a href="index.jsp" class="btn">Logout</a>

            </div>
            
   
        </header>
       <!-- end header  -->
       
       <script src="js/script.js"></script>
</body>
</html>
