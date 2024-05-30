<%-- 
    Document   : usernavbar
    Created on : Dec 26, 2023, 3:36:20 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>usernavbar</title>
         <!-- custome css link  -->
    <link rel="stylesheet" href="css/style.css">
   
    </head>
    <body>
         <%
        try{
                
            int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();

                String str = "select * from register where id="+id;
                
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>
       
               <header>
            <a href="index.jsp" class="logo"><i class='bx bxs-briefcase'></i>JobHub</a>

            <ul class="navbar">
<!--                <li ><a href="#">Home</a></li>-->
            <li ><a href="user.jsp">view jobs</a></li>
            <li><a href="showappliedjobsuser.jsp">view Applyed jobs</a></li>
            <li><a href="contact.jsp">contact</a></li>
            </ul>
            <div class="header-icons">
                <a href="#" class="btn" onclick="openPopup()" >Profile</a>
            <a href="logout.jsp" class="btn">Logout</a>

            </div>
            
   
        </header>

                 <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>
             
     
        
        <!-- custom js link  -->
<script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
