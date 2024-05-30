<%-- 
    Document   : login
    Created on : Dec 13, 2023, 8:06:32 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login page</title>
    <!-- custome css link  -->
    <link rel="stylesheet" href="css/loginstyle.css">
    <style>
     #success{
    color: blue;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 } 

 #failed{
     color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="Logincode.jsp" method="post">
             <%
                   try{
                       String data = session.getAttribute("msg").toString();
                       
                 %>
                 <p id="success"><%out.print(data);%></p>
                      <% session.removeAttribute("msg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
               
               
               <%
                   try{
                       String data = session.getAttribute("loginmsg").toString();
                       
                 %>
                 <p id="failed"><%out.print(data);%></p>
                      <% session.removeAttribute("loginmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
               
                <%
                   try{
                       String data = session.getAttribute("profileUpdate").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("profileUpdate");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
            <h3>Welcome Back!!!</h3>
            <!-- <div class="title">Welcome Back!!!</div> -->
            <span>Email</span>
            <input type="email" name="email" id="" placeholder="Enter your email" required>
            <span>password</span>
            <input type="password" name="password" id="" placeholder="Enter your password" required>
            <span>login type</span>
            <select name="role" id="" required>
                <option value="admin">Admin</option>
                <option value="user">User</option>
                <option value="recruiter">Recruiter</option>
            </select>

           
            <div class="button">
                <a href="#"><input type="submit" value="login" name="action"></a>
            </div>
            <p>don't have an account? <a href="register.jsp">Register now</a></p>
            <p> <a href="changepassword.jsp">Forget Password</a></p>
        </form>
    </div>
</body>
</html>
