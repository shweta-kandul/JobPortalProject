<%-- 
    Document   : jobtable
    Created on : 22 Dec, 2023, 10:33:52 AM
    Author     : 91915
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        crossorigin="anonymous" />
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
                String  s="select count(*) from jobs where category='IT'";
               
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
                        <div class="cardName">IT</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-laptop-code"aria-hidden="true"></i>

                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Engineering'";
               
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
                        <div class="cardName">Engineering</div>
                    </div>
                    <div class="iconBox">
                         <i class="fa fa-wrench" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Nurse'";
               
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
                        <div class="cardName">Nurse</div>
                    </div>
                    <div class="iconBox">
                  <i class="fa-solid fa-user-nurse"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">
                            
                            <%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Teacher'";
               
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
                        <div class="cardName">Teacher</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-chalkboard-teacher" aria-hidden="true"></i> 

                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Electrician'";
               
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
                        <div class="cardName">Electrician</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-plug" aria-hidden="true"></i>

                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Data Architect'";
               
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
                        <div class="cardName">Data Architect</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-database" aria-hidden="true"></i>

                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Accountant'";
               
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
                        <div class="cardName">Accountant</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-book"aria-hidden="true"></i>

                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Finance'";
               
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
                        <div class="cardName">Finance</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-landmark" aria-hidden="true"></i>

                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers"><%
                    try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                String  s="select count(*) from jobs where category='Marketing'";
               
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
                        <div class="cardName">Marketing</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-chart-line" aria-hidden="true"></i>

                    </div>
                </div>
            </div>
    
   
 <script src="js/script.js"></script>
    </body>
    </html>
