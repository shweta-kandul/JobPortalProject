<%-- 
    Document   : applyjob
    Created on : Dec 26, 2023, 1:50:30 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>


<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title> Apply jobs </title>
   <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/loginstyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    font-size: 2rem;
 }  
</style>


</head>

<body>


<%@include file="usernavbar.jsp" %>

    <%! int a;%>
       <%! int count;%>
  
  <%
        try{
                
//            int id=Integer.parseInt((String)session.getAttribute("rid"));
           
//            out.print(id);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String jid = (String)request.getParameter("jid");
//                String str="select * from jobs where jid=jid";
                
              

                 a=Integer.parseInt(jid);
                ResultSet rs = st.executeQuery("select * from jobs where jid="+a);
                
         
                while(rs.next()){
           
                 %>                
  
                        
    <div class="container">
        
           
       
               
        <div class="title" > job Details</div>
        
        <div class="content">
            <form  action="resume.jsp">
                
                
                <div class="user-details">
                    <div class="input-box">
                        <span class="details"> Title</span>
                        <input type="text" required  name="title" readonly  value="<%=rs.getString("title")%>">
                    </div>
                   

                    <div class="input-box">
                      <span class="details">Location</span>
                     

                         <input type="text" required  name="location" readonly  value="<%=rs.getString("location")%>">
                    </div>

                    <div class="input-box">
                        <span class="details" readonly>Category</span>

                      <input type="text" required  name="category" readonly  value="<%=rs.getString("category")%>">
                        
                    </div>
                    <div class="input-box" >
                        <span class="details" readonly>Date</span>

                          <input type="text" required  name="date" readonly  value="<%=rs.getString("pdate")%>">
                    </div>
                    
                   

                    
                </div>
                <div class="message">
                    <span class="details" readonly> Description</span>
                        <textarea class="message-box" id="" cols="0" rows="0"  required name="description" readonly  ><%=rs.getString("description") %></textarea>
                  
                </div>
                        
                        
                    <input type="hidden" name="jid" value="<%=jid%>">

                     <div class="button">

                        <a href="#" ><input type="submit" value="Apply Job" ></a>
                    </div>
                        
                  
        </div> 

    </form>
                        

    </div>
  

       <%}
    }
    
    catch(Exception e){
    out.print(e);
    }
    %>
    
                    
   <!-- profile start  -->


 <%@include file="profile.jsp" %>
<!-- js link  -->
    <script src="js/script.js"></script>

</body>

</html>