<%-- 
    Document   : recruiter
    Created on : Dec 14, 2023, 6:19:59 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruiter Page</title>

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

<%@include file="recruiternavbar.jsp" %>

        <!--end header-->  


        <!-- home section starts  -->
        <section class="home" id="home">
            <div class="home-text">
                <h6>Looking for new talent for your team?</h6>
                <h1>Hire Smarter and Scale Faster</h1>
                <p>Find your Future Leaders</p>
               
               
            </div>
       

         <div class="home-img">
            <img src="img/hero1.webp" alt="">
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
                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='IT' AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Engineering' AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Nurse' AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Teacher'AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='finance' AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Data Architect' AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Accountant'AND rid="+id;
               
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
                                           int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Marketing' AND rid="+id;
               
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
                <li><a href="#home">All Jobs</a></li>
                <li><a href="#home">About us</a></li>
                <li><a href="#home">Contact</a></li>
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
        &copy; 2023 TalentTrack . All rights reserved
        
    </div>
</section>
   
   
  

  <!-- footer section ends  -->

  
 <%@include file="profile.jsp" %>

</body>
</html>