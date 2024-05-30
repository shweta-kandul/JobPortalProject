<%-- 
    Document   : addjob
    Created on : Dec 13, 2023, 8:09:01 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title> Edit jobs </title>
   <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/loginstyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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


<%@include file="recruiternavbar.jsp" %>
    <%! int a;%>
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
       
        <div class="title" >Edit jobs</div>
        
        <div class="content">
            <form action="editjobcode.jsp">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Enter Title</span>
                        <input type="text" required  name="title"  value="<%=rs.getString("title")%>">
                    </div>
                   

                    <div class="input-box">
                        <span class="details">Location</span>
                        <select name="location" >
                            <option value="<%=rs.getString("location")%>"><%=rs.getString("location")%></option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Delhi">Delhi</option>
                            <option value="Bangalore">Bangalore</option>
                            <option value="Hyderabad">Hyderabad</option>
                            <option value="Chennai">Chennai</option>
                            <option value="Kolkata">Kolkata</option>
                            <option value="Pune">Pune</option>
                            <option value="Nagpur">Nagpur</option>
                            <option value="Solapur">Solapur</option>
                        </select>
                    </div>

                    <div class="input-box">
                        <span class="details">Category</span>
                        <select name="category"">
                            <option  value="<%=rs.getString("category")%>"><%=rs.getString("category")%></option>
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
                    <div class="input-box" >
                        <span class="details">Status</span>
                        <select name="status" >
                            <option value="<%=rs.getString("status")%>"><%=rs.getString("status")%></option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    
                   

                    
                </div>
                <div class="message">
                    <span class="details" >Enter Description</span>
                        <textarea class="message-box" id="" cols="0" rows="0"  required name="description" ><%=rs.getString("description") %></textarea>
                  
                </div>
                       
                        
                <input type="hidden" name="jid" value="<%=a%>">
               
                
                <div class="button">
                    <input type="submit" value="Update Jobs">
                </div>
            </form>
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
<!-- js link  -->
    <script src="js/script.js"></script>

</body>

</html>