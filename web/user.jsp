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
    <title>view job user</title>
    
    <!-- custome css link  -->
    <link rel="stylesheet" href="css/jobstyle.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- bxicon icons  -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- google fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Lora:wght@400;500&family=Montserrat:wght@300;400;500;600;800;900&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>



    <%@include file="usernavbar.jsp" %>
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
                         <option value="ca">Choose</option>
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
                   
                      <a href="#"><input type="submit" value="search" > </a>
                    
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
                String str = "select * from jobs where status = 'Active' order by jid desc";
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>

                    
    <div class="view-job">
        
        <div class="card-body">
            <div class="jobicon">
                <i class='bx bx-clipboard'></i>
            </div>
            <h5>Title: <%=rs.getString(2)%></h5>
            <p>Description: <%=rs.getString(3)%></p>
            <div class="row-group">
                <div class="row">
                 <input type="text" readonly placeholder="Location" value="Location: <%=rs.getString(6)%>">
                </div>
                <div class="row left">
                 <input type="text" readonly placeholder="Category" value="Category: <%=rs.getString(4)%>">
                </div>
                
            </div>
           <h4>Posted date: <%=rs.getString(7)%></h4>
           <div class="button">


            <a href="applyjob.jsp?jid=<%=rs.getString("jid")%>"><input type="submit"  value="Apply" > </a>
 

           </div>
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
 
 <!--custome js link--> 

    <script src="js/script.js"></script>
</body>
</html>