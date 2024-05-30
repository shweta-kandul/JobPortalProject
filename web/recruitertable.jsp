<%-- 
    Document   : recruitertable
    Created on : 22 Dec, 2023, 10:30:25 AM
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
<style>
     #success{
    color: blue;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 } 
 h1{
     margin-left: 40%;
     color:blue;
 }
 #failed{
     color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 }
 
 
 .btn {
        padding: 8px 16px;
        background-color: #5C5CFF;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        text-decoration: none;
        display: inline-block;
        margin: 4px 2px;
        transition-duration: 0.4s;
    }

    .btn:hover {
        background-color: #A020F0;
        color: white;
    }
 
</style>

<body>
    <div class="container">

<%@include file="adminsidebar.jsp" %>

<div >
        <h1 class="heading">Recruiter List</h1>
         <%
                   try{
                       String data = session.getAttribute("existsmsg").toString();
                       
                 %>
                 <p id="failed"><%out.print(data);%></p>
                      <% session.removeAttribute("existsmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
               
               
                <%
                   try{
                       String data = session.getAttribute("profileUpdate").toString();
                       
                 %>
                 <p id="success"><%out.print(data);%></p>
                      <% session.removeAttribute("profileUpdate");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
     
        <%
                   try{
                       String data = session.getAttribute("deleteur").toString();
                       
                 %>
                 <p id="success"><%out.print(data);%></p>
                      <% session.removeAttribute("deleteur");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
     
     
       
        <table class="table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>FullName</th>
                    <th>Email</th>
                    <th>Qualification</th>
                    <th>Phone No</th>
                     <th>Gender</th>
                     <th>Edit</th>
                     <th>Delete</th>
                </tr>
               
            </thead>
            <tbody>
<%
int counter = 1;
try {
    String id =(String)session.getAttribute("rid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "acer");
    String s = "select fullname,email,qualification,phoneno,gender from  register where role='recruiter'";
    PreparedStatement ps = con.prepareStatement(s);
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
%>

<tr>
    <td><%= counter %></td>
    <td><%= rs.getString(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
    <td><a href="editre.jsp?ur=<%=rs.getString(2)%>"><input type="submit" value="Edit" class="btn"> </a></td>
    <td><a href="deletere.jsp?ur=<%=rs.getString(2)%>"><input type="submit" value="Delete" class="btn"></a></td>
    
</tr>

<%
        counter++;
    }
} catch (Exception e) {
    out.print(e);
}
%>
        </table>
    </div>
        <script src="js/script.js"> </script>
  
            
</body>
</html>
