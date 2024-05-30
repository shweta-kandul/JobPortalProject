<%-- 
    Document   : index
    Created on : Dec 13, 2023, 8:04:03 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobHub</title>

    <!-- custome css link  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- bxicon icons  -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

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
    font-size: 1.3rem;
    font-weight: 5px
 } 

</style>
</head>
<body>

    <!-- start header  -->
        <header>
            <a href="index.html" class="logo"><i class='bx bxs-briefcase'></i>JobHub</a>

            <ul class="navbar">
                <li class="menu_item "><a href="#home" class="menu_link active-link ">Home</a></li>
                <li class="menu_item"><a href="#category" class="menu_link">All jobs</a></li>
                <li class="menu_item"><a href="#about" class="menu_link">About Us</a></li>
<!--                <li class="menu_item"><a href="contact.jsp" class="menu_link">Contact</a></li>-->
            </ul>

            <div class="header-icons">
                <a href="login.jsp"><i class='bx bx-user' ></i></a>
                <div class="bx bx-menu" id="menu-icon"></div>
            </div>
<%
                   try{
                       String data = session.getAttribute("msg").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("msg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>

   
        </header>
       <!-- end header  -->

       <!-- home section starts  -->
            <section class="home" id="home">
                <div class="home-text">
                    <h6>Here you can find your best job.</h6>
                    <h1>Find your Dream job & make your Goal</h1>
                    <p>Join with us and find your best dream job</p>
                    <a href="login.jsp" class="btn">Login</a>
                    <a href="register.jsp" class="btn">Registration</a>
                   
                </div>
           

             <div class="home-img">
                <img src="img/hero2.webp" alt="">
             </div>
            </section>
       <!-- home section ends  -->
    
       <!-- category section start -->
       <section class="category" id="category">

        <h1 class="heading">one Platform Many solution</h1>

        <div class="box-container">

            

            <a href="#" class="box">
                <i class='bx bx-code-alt' ></i>
                <div>
                    <h3>IT</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='IT'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>
            <a href="#" class="box">
<i class='bx bx-wrench'></i>
                <div>
                    <h3>Engineer</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Engineering'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>

            <a href="#" class="box">
<i class='bx bxs-injection'></i>                <div>
                    <h3>Nurse</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Nurse'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>

            <a href="#" class="box">
                <i class='bx bx-chalkboard' ></i>
                <div>
                    <h3>Teacher</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Teacher'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>

            <a href="#" class="box">
                <i class='bx bxs-bank'></i>
                <div>
                    <h3>Finance</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='finance'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>

            <a href="#" class="box">
                
<i class='bx bxs-data'></i>                <div>
                    <h3>Data Architect</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Data Architect'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>
            <a href="#" class="box">
                <i class='bx bx-trending-up'></i>
                <div>
                    <h3>Accountant</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Accountant'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>
            <a href="#" class="box">
                <i class='bx bx-trending-up'></i>
                <div>
                    <h3>Marketing</h3>
                    <span><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Marketing'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></span>
                </div>
            </a>
        </div>
       </section>
       <!-- category section ends-->

        <!-- company section starts  -->

        <section class="cta">
            <div class="center-text">
                <h1 class="heading">Top compaines highering now</h1>
            </div>
            <div class="cta-content">
                <div class="cta-img">
                    <img src="img/infosys.svg" alt="">
                </div>

                <div class="cta-img">
                    <img src="img/accenture.svg" alt="">
                </div>

                <div class="cta-img">
                    <img src="img/amezone.svg" alt="">
                </div>

                <div class="cta-img">
                    <img src="img/google.svg" alt="">
                </div>

                <div class="cta-img">
                    <img src="img/wipro.svg" alt="">
                </div>

                <div class="cta-img">
                    <img src="img/microsoft.svg" alt="">
                </div>
            </div>

        </section>
         <!-- company section ends  -->


       <!-- about section starts  -->

       <section class="about" id="about">
            <div class="about-img">
            <img src="img/hero3.png" alt="">
            </div>
            <div class="about-text">
                <h2>Connecting Job Seeker and Employers for Success</h2>
                <p>At TalentTrack, we understand that finding the right job can be a douting task. That's why we've built a user-friendly and intuitive llatform tha simplify the job seardh process</p>
                <a href="#" class="btn">Contact Us</a>
            </div>

       </section>
          <!-- about section ends  -->

          


        <!-- footer section start  -->
        
        <section class="contact">
            <div class="top">
                <div class="main-contact">
                    <div class="contact-content">
                        <!-- <a href="index.html" class="logo"><i class='bx bxs-briefcase'></i>TalentTrack</a> -->
                        <h4>Social links</h4>
                        <li><a href="#"><i class='bx bxl-facebook'></i>facebook</a></li>
                        <li><a href="#"><i class='bx bxl-instagram' ></i>instagram</a></li> 
                        <li><a href="#"><i class='bx bxl-twitter' ></i>twitter</a></li>
                        <li> <a href="#"><i class='bx bxl-linkedin-square' ></i>linkdin</a></li>
                    </div>
    
                    <div class="contact-content">
                        <h4>Company</h4>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#category">All Jobs</a></li>
                        <li><a href="#about">About us</a></li>
                        <li><a href="#">Contact</a></li>
                    </div>
    
                    <div class="contact-content">
                        <h4>For User</h4>
                        <li><a href="#">Browse Jobs</a></li>
                        <li><a href="#">Browse Category</a></li>
                        <li><a href="#">Employers</a></li>
                        <li><a href="#">Candidate Dashboard</a></li>
                    </div>
    
                    <div class="contact-content">
                        <h4>for Recruter</h4>
                        <li><a href="#">Browse users</a></li>
                        <li><a href="#">Recuriter Dashboard</a></li>
                        <li><a href="#">Add Jobs</a></li>
                        <li><a href="#">Seclect users</a></li>
                    </div>
                   
                </div>
                
            </div>
            
            
            
        </section>
        
        
        <section class="bottom">
             
            <div class="bottom-bar">
                &copy; 2023 JobHub . All rights reserved
                
            </div>
        </section>
       
          <!-- footer section ends  -->

    <!-- custom js link  -->
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>


