<%-- 
    Document   : adminindex
    Created on : 21 Dec, 2023, 6:26:23 PM
    Author     : 91915
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Admin Dashboard</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="css/adminstyle.css" />
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
    <div class="container">
      <div class="navigation">
        <ul>
          <li>
            <a href="admin.jsp" >
              <span class="icon">
                <!--<i class="fa-solid fa-briefcase" aria-hidden="true"></i>-->
              </span>
              <span class="title"><h2>Admin </h2></span>
            </a>
          </li>
          
          <li>
            <a href="adminindex.jsp">
              <span class="icon">
                <i class="fa fa-home" aria-hidden="true"></i>
              </span>
              <span class="title">Dashboard</span>
            </a>
          </li>
          
          <li>
            <a href="jobtypes.jsp">
              <span class="icon">
                <i class="fa fa-briefcase" aria-hidden="true"></i>
              </span>
              <span class="title">Total Jobs</span>
            </a>
          </li>
          
          <li>
            <a href="recruitertable.jsp">
              <span class="icon">
                <i class="fa fa-list-alt" aria-hidden="true"></i>
              </span>
              <span class="title">Recruiter List</span>
            </a>
          </li>
          
          
          
          <li>
            <a href="usertable.jsp">
              <span class="icon" >
                <i class="fa fa-user" aria-hidden="true"></i>
              </span>
              <span class="title" id="view">
                User List
              </span>
            </a>
          </li>
          
           <li>
            <a href="contactlist.jsp">
              <span class="icon">
              
                <i class="fa  fa-address-book" aria-hidden="true"></i>
              </span>
              <span class="title">Contact List</span>
            </a>
          </li>
          
          
          <li>
            <a href="joblist.jsp">
              <span class="icon">
              
                <i class="fa fa-briefcase" aria-hidden="true"></i>
              </span>
              <span class="title">Job List</span>
            </a>
          </li>
          
          
          
          <li>
               <a href="admin.jsp"  >
<!--            <a href="admin.jsp"  >-->
              <span class="icon">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
              </span>
              <span class="title" id="con">Profile</span>
               </a>
          </li>
          <li>
            <a href="changepassword.jsp">
              <span class="icon">
                <i class="fa fa-lock" aria-hidden="true"></i>
              </span>
              <span class="title"> Change Password</span>
            </a>
          </li>
          <li>
            <a href="logout.jsp">
              <span class="icon">
                <i class="fa fa-sign-out" aria-hidden="true"></i>
              </span>
              <span class="title">Sign Out</span>
            </a>
          </li>
        </ul>
      </div>

<%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>



      
      <div class="main">
        <div class="topbar">
          <div class="toggle" onclick="toggleMenu()"></div>
          <div class="title">
            
              <span class="icon" style="font-size: 30px">
                <i class="fa fa-briefcase" aria-hidden="true"></i>
              </span>          
             <label>JobHub</label> 
          </div>
          <div class="user"></div>
          
        </div>
        <script src="js/script.js"></script>
       
      </body>
</html>