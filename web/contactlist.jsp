<%-- 
    Document   : contactlist
    Created on : Feb 25, 2024, 3:30:45 PM
    Author     : shwet
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
    <style>
         
 h1{
     margin-left: 40%;
     color:blue;
 }
        </style>
</head>

<body>
    <div class="container">

<%@include file="adminsidebar.jsp" %>

            <div >
                <h1 class="heading">Contact List</h1>
                <table class="table">
                    <thead>
                 <tr>
                    <th>No.</th>
                    <th>FullName</th>
                    <th>Email</th>
                    <th style="width: 200px;">Message</th>
                  
                 </tr>
                 
                    </thead>
                    <tbody>
 <%
           
                  try{
               String id="";
               Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
               String s="select * from contact";
               PreparedStatement ps  =con.prepareStatement(s);
               
               ResultSet rs=ps.executeQuery();
               while(rs.next()) 
               {
         %>
                     

            <tr>       
                     
                     
                     <td><%= rs.getString(1) %></td>
                     <td><%= rs.getString(2) %></td>
                     <td><%= rs.getString(3) %></td>
                     <td style="word-wrap: break-word;"><%= rs.getString(4) %></td>
                   


     
     
             </tr>
             <%}
             
               }
                
                  catch(Exception e1){
                out.print(e1);  
                   }
 %>
 
                 </tbody>
        </table>
    </div>
 <script src="js/script.js"></script>
                      
</body>

</html>