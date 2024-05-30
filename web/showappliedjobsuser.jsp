<%-- 
    Document   : showapplidjobs
    Created on : Dec 30, 2023, 7:07:56 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user Applied jobs</title>
         <link rel="stylesheet" href="css/tablestyle.css">
         
           <link rel="stylesheet" href="css/style.css">
           
            <!-- bxicon icons  -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- google fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Lora:wght@400;500&family=Montserrat:wght@300;400;500;600;800;900&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
<style>
    
 #failed{
     color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 }
</style> 
    </head>
   <body>
         <%@include file="usernavbar.jsp" %>
    <h1>Applied Jobs</h1>
     <%
                   try{
                       String data = session.getAttribute("existsmsg").toString();
                       
                 %>
                 <p id="failed"><%out.print(data);%></p>
                      <% session.removeAttribute("existsmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
              
    <table class="table">
        <thead>
            <tr>
                <th>Job Title </th>
                <th >Description </th>
                <th >Category</th>
                <th >Location </th>
                <th >Applied Date </th>
            </tr>
        </thead>

        <tbody>
             
    <%
        int jid;
        try{
              
            int id=Integer.parseInt((String)session.getAttribute("rid"));
  
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String str ="select * from a_jobs where uid="+id;
                
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    jid=rs.getInt(14);
                     Statement st1 = con.createStatement();
                String str1 ="select * from jobs where jid="+jid;
                 ResultSet rs1 = st1.executeQuery(str1);
                
      
                while(rs1.next()){
                %>

            <tr>
                <td  data-lable="Job Title"><%=rs1.getString(2)%> </td>
                <td data-lable="Description"><%=rs1.getString(3)%></td>
                <td data-lable="Category"> <%=rs1.getString(4)%></td>
                <td data-lable="Location"><%=rs1.getString(6)%></td>
             
                <td data-lable="Applied Date"><%=rs.getString(13)%></td>
              
            </tr>
                
               <%}
                 
  }
    }
    catch(Exception e){
    out.print(e);
    }
    %>
   
    </table>
    <%@include file="profile.jsp" %>
</body>
</html>
