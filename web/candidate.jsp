<%-- 
    Document   : candidate
    Created on : Jan 3, 2024, 3:52:46 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view candidate </title>
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

    <h1>Applied Jobs</h1>
    <table class="table">
        <thead>
            <tr>
                <th>Job Title </th>
                <th >Candidate</th>
                <th >Total Candidate</th>
                
            </tr>
        </thead>

        <tbody>
            <%!   int jid;%>
             <%
        try{
            
            int id=Integer.parseInt((String)session.getAttribute("rid"));
               

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String str = "select * from jobs where rid="+id ;
                 
                ResultSet rs = st.executeQuery(str);
                
                 
                
               
                while(rs.next()){
                   
                    jid=rs.getInt(1);
                     Statement st1 = con.createStatement();
                String str1 ="select count(jobid) from a_jobs where jobid="+jid;

                 ResultSet rs1 = st1.executeQuery(str1);
               
                while(rs1.next()){
                
                    %>
            <tr>
                <td  data-lable="Job Title"><%=rs.getString(2)%> </td>
                <td data-lable="Candidate">
                    <div class="button">
                        <%
                            
                            
                     out.print("<a href=candidatedetails.jsp?jid="+jid+"> <input type=submit value=view class=btn> </a>");
                                %>
                    </div>
                </td>
                <td data-lable="Total Candidate"> <%=rs1.getString(1)%></td>
              
            </tr>

           

        </tbody>
         <%}
    }}
    catch(Exception e){
    out.print(e);
    }
    %>
    </table>
  <%@include file="profile.jsp" %>  
</body>
</html>
