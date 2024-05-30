<%-- 
    Document   : recruiternavbar
    Created on : Dec 19, 2023, 10:11:13 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- custome css link  -->
    <link rel="stylesheet" href="css/style.css">
   
    </head>
    <body>
         <%
        try{
                
            int id=Integer.parseInt((String)session.getAttribute("rid"));
           
//            out.print(id);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
//                String jid = (String)request.getParameter("jid");
                String str = "select * from register where id="+id;
                
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>
       
               <header>
            <a href="index.jsp" class="logo"><i class='bx bxs-briefcase'></i>JobHub</a>

            <ul class="navbar">
                <li ><a href="recruiter.jsp">Home</a></li>
                <li ><a href="addjob.jsp">Post jobs</a></li>
                <li ><a href="viewjobsrecruiter.jsp">view jobs</a></li>
                <li ><a href="candidate.jsp">candidate list</a></li>
                <li ><a href="contact.jsp">Contact</a></li>
            </ul>
            <div class="header-icons">
                <a href="#" class="btn" onclick="openPopup()" >Profile</a>
            <a href="logout.jsp" class="btn">Logout</a>

            </div>
            
   
       
                 <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>
   </header>
             
        <!--     start header  -->
       
        <!--end header--> 
        
        
        <!-- custom js link  -->
<script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
