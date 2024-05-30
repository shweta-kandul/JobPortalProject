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
    <div class="container">

<%@include file="adminsidebar.jsp" %>
        <div class="cardBox">
          <div class="card">
            <div>
              <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from register where role='user'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></div>
              <div class="cardName">Total Users</div>
            </div>
            <div class="iconBox">
            <i class="fa fa-user" aria-hidden="true"></i>
            </div>
          </div>
              
              
              
          <div class="card">
            <div>
              <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from register where role='recruiter'";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></div>
              <div class="cardName">Total Recruiters</div>
            </div>
            <div class="iconBox">
              <i class="fa fa-user" aria-hidden="true"></i>
            </div>
          </div>
              
            <div class="card">
            <div>
              <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></div>
              <div class="cardName">Total Jobs</div>
            </div>
            <div class="iconBox">
              <i class="fa fa-briefcase" aria-hidden="true"></i>
            </div>
          </div>
              
         
              
              
              
          <div class="card">
            <div>
              <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from a_jobs";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %></div>
              <div class="cardName">Applied Jobs</div>
            </div>
            <div class="iconBox">
              <i class="fa fa-check" aria-hidden="true"></i>
            </div>
          </div>
          <div class="card">
            <div>
              <div class="numbers">
                  <%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from contact";
               
                PreparedStatement ps = con.prepareStatement(s);
                ResultSet rs=ps.executeQuery();
                rs.next();
                int count=rs.getInt(1);
                out.print(count);
                con.close();
                
                    }
                    catch(Exception e)
                    {
                        out.print(e);
                    }
                    %>
              </div>
              <div class="cardName">Contacted Users</div>
            </div>
            <div class="iconBox">
              <i class="fa fa-comment" aria-hidden="true"></i>
            </div>
          </div>
        </div>
         </div>
      
       <%@include file="profile.jsp" %>
   <script src="js/script.js"></script>
  </body>
</html>
