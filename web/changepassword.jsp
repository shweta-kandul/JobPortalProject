<%-- 
    Document   : changepassword
    Created on : Dec 16, 2023, 7:33:22 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <!-- custom css link  -->
    <link rel="stylesheet" href="css/loginstyle.css">
     <script>
        function validateForm() {
            var confirmpassword = document.forms["registrationForm"]["confirmpassword"].value.trim();
            var newPassword = document.forms["registrationForm"]["newpassword"].value.trim();

            document.getElementById("pass-error").innerHTML = "";
            document.getElementById("newpass-error").innerHTML = "";

            // Validate password
            var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;

            if (newPassword === "") {
                document.getElementById("pass-error").innerHTML = "<span style='color:red'>New Password is required</span>";
                return false;
            }
            
             if (confirmpassword === "") {
                document.getElementById("newpass-error").innerHTML = "<span style='color:red'>Confirm Password is required</span>";
                return false;
            }
            
            
            if (!passwordPattern.test(newPassword)) {
                document.getElementById("pass-error").innerHTML = "<span style='color:red'>New Password must be at least 8 characters and contain at least one uppercase letter, one lowercase letter, one number, and one special character</span>";
                return false;
            }

            // Validate password and newPassword match
            if (confirmpassword != newPassword) {
                document.getElementById("newpass-error").innerHTML = "<span style='color:red'>New Password must be different from the confirm password</span>";
                return false;
            }

            return true;
        }

        function submitForm() {
            if (validateForm()) {
                document.getElementById("registrationForm").submit();
            }
        }
    </script>
</head>
<body>
     <%
        try{
            int id=Integer.parseInt((String)session.getAttribute("rid"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select * from register where id="+id);
            while(rs.next()){
    %>  
    <div class="form-container">
        <form action="changepasswordcode.jsp" id="registrationForm" onsubmit="return validateForm();" autocomplete="off">
            <h3>Change Password</h3>
           
            <span>Email</span>
            <input type="email" name="email" id=""  value="<%=rs.getString("email")%>" readonly >
             

            
            <span>New Password</span>
            <input type="password" name="newpassword" id="" placeholder="Enter new password" >
            <span id="pass-error"></span>
            
            
            <span>Confirm New Password</span>
            <input type="password" name="confirmpassword" id="" placeholder="Confirm new password" >

            <span id="newpass-error"></span>
           
            <div class="button">
                <a href="#"><input type="submit" value="Save" name="action"></a>
            </div>
            
            <% String msg=request.getParameter("msg");
            if("done".equals(msg)) {
                session.setAttribute("msg","Password changed successfully");
                response.sendRedirect("login.jsp");
            } %>
            
            <% if("invalid".equals(msg)) { %>
            <h2 style="color:red;">Something Went Wrong! Please try again!</h2>
            <% } %>
        </form>
    </div>
    <% }
    }
    catch(Exception e){
        out.print(e);
    } %>
</body>
</html>
