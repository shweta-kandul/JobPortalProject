<%-- 
    Document   : candidatedetails
    Created on : Jan 3, 2024, 4:03:32 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>candidate Details</title>
         <link rel="stylesheet" href="css/tablestyle.css">
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
 <form action="readdocument.jsp">
         <h1>Candidate Details</h1>
    <table class="table">
        <thead>
            <tr>
                <th>Full Name </th>
                <th >Email </th>
                <th >Phone no.</th>
                <th >Resume </th>
                
            </tr>
        </thead>

        <tbody><%! String a="";int no;%>
             <%
                 String a=request.getParameter("jid");
                 int jid=Integer.parseInt(a);
              
        try{
              
            int id=Integer.parseInt((String)session.getAttribute("rid"));
               

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String str = "select * from a_jobs where jobid="+jid;
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    no=rs.getInt(1);
                   // out.print(no);
                    a=no+"";
                    %>
            <tr>
                <td  data-lable="Full Name"> <%=rs.getString(2)%> </td>
                <td data-lable="Email"><%=rs.getString(3)%> </td>
                <td data-lable="Phone no."> <%=rs.getString(4)%> </td>
                
                    <td data-lable="Resume">
                        <div class="button">
                                               
                            <a href="viewresume.jsp?aid=<%=rs.getInt(1)%>" class="btn">view Resume</a>
                        </div>
                     
                    </td>
        
            </tr>

           
           


        </tbody>
         <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>
    </table>
     <%@include file="profile.jsp" %>  
        </form>
    </body>
</html>
