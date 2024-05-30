<%-- 
    Document   : search_job
    Created on : Dec 22, 2023, 10:33:09 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <title>search jobs</title>
        
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
     #failed{
     color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
    margin-top: 50px
 }
    </style>
    
    </head>

<%@include file="usernavbar.jsp" %>
    <body>
         <form action="search_job.jsp">
    <div class="view-job">
        <div class="search">
            <div class="row-group">
                <div class="row">
                    <h3>Location</h3>
                    <select name="location" >
                        <option value="lo">Choose...</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Delhi">	Delhi</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Chenna">Chennai</option>
                        <option value="Kolkata">Kolkata</option>
                        <option value="Pune">Pune</option>
                        <option value="Nagpur">Nagpur</option>
                        <option value="Solapur">Solapur</option>
                    </select>
                </div>
                <div class="row">
                    <h3>Category</h3>
                    <select name="category">
                         <option value="ca">Choose...</option>
                            <option value="IT">IT</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Nurse">Nurse</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Electrician">Electrician</option>
                            <option value="Data Architect">Data Architect</option>
                            <option value="Accountant">Accountant</option>
                            <option value="Finance">Finance</option>
                            <option value="Marketing">Marketing</option>
                    </select>
                </div>
                <div class="button">
                   
                      <a href="#"><input type="submit" value="search"> </a>
                    
                  </div>
            </div>
            
        </div>
    </div>
    </form>       
         
         <%
        try{
                 Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
//                String jid = (String)request.getParameter("jid");
//
//                a=Integer.parseInt(jid);
                
                String location= request.getParameter("location");
                String category = request.getParameter("category");
                 
                ResultSet rs = st.executeQuery("SELECT * FROM jobs WHERE location = '"+location+"' AND category = '"+category+"'  ");
                while(rs.next()){
                    %>
                 
                    
    <div class="view-job">
        
        <div class="card-body" >
            <div class="jobicon">
                <i class='bx bx-clipboard'></i>
            </div>
            <h5>Title: <%=rs.getString(2)%></h5>
            <p >Description: <%=rs.getString(3)%></p>
            <div class="row-group">
                <div class="row">
                    <input type="text" readonly placeholder="Location" value="Location: <%=rs.getString(6)%>">
                </div>
                <div class="row left">
                    <input type="text" readonly placeholder="Category" value="Category: <%=rs.getString(4)%>" >
                </div>

            </div>
           <h4>Posted date: <%=rs.getString(7)%></h4>
         <div class="button">
                   
             <a href="applyjob.jsp?jid=<%=rs.getString("jid")%>"><input type="submit" value="Apply" > </a>
                    
                  </div>   
       
           
        </div>
            
    </div>
                           
           
                    <%}


    if ("lo".equals(location) && "ca".equals(category)) {
       %>
       <p id="failed" class="no-results"> Job Not found  </p>
       <%
           }

    if (!rs.next() && !"lo".equals(location) && !"ca".equals(category)) {
       %>
       <p id="failed" class="no-results"> Job Not found  </p>
       <%
           }


    
  else  if (("lo".equals(location) || "category".equals(category)) || ("location".equals(location) || "ca".equals(category))) {
       %>
       <p id="failed" class="no-results">Please select  both the field  </p>
       <%
           }




       

    }
    catch(Exception e){
    out.print(e);
    }
    %>
        <%@include file="profile.jsp" %>

    <script src="js/script.js"></script>
    </body>
</html>
