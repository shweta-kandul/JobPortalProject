<%-- 
    Document   : viewjobr
    Created on : Dec 18, 2023, 8:15:20 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view job recruiter</title>
    
    <!-- custome css link  -->
    <link rel="stylesheet" href="css/jobstyle.css">
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

<%@include file="recruiternavbar.jsp" %>
 <%
                   try{
                       String data = session.getAttribute("jobmsg").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("jobmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
    
     <%
                   try{
                       String data = session.getAttribute("deletejob").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("deletejob");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
    
    <%
        try{
              
            int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String str = "select * from jobs where rid="+id ;
               
  
               
                           
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>

                    
    <div class="view-job">
      
        
        <div class="card-body" >
            <div class="jobicon">
                <i class='bx bx-clipboard'></i>
            </div>
            <h5>Title: <%=rs.getString(2)%></h5>
            <p name="description">Description: <%=rs.getString(3)%></p>
            <div class="row-group">
                <div class="row">
                    <input type="text" readonly placeholder="Location" value="Location: <%=rs.getString(6)%>">
                </div>
                <div class="row">
                    <input type="text" readonly placeholder="Category" value="Category: <%=rs.getString(4)%>" >
                </div>
                <div class="row">
                    <input type="text" readonly placeholder="Status" value="Status: <%=rs.getString(5)%>" >
                </div>
            </div>
           <h4>Posted date: <%=rs.getString(7)%></h4>
         
           <div class="button">
               <a href="Editjob.jsp?jid=<%=rs.getString("jid")%>"><input type="submit" value="Edit"> </a>
               <a href="deletejobcode.jsp?jid=<%=rs.getString("jid")%>"> <input type="submit" value="Delete"><a>
           </div>
        </div>
               
       
    </div>
           
                    <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>
                    
                    
                    

    <!-- profile start  -->


 <%@include file="profile.jsp" %>

    <script src="js/script.js"></script>
</body>
</html>