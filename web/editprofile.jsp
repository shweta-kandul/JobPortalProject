<%-- 
    Document   : editprofile
    Created on : Dec 25, 2023, 3:27:55 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EditProfile Page</title>
    <link rel="stylesheet" href="css/loginstyle.css">
    <style>
        
 #failed{
     color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 }
</style>
    </style>
    <script>
        function validateForm() {
            var fullname = document.forms["registrationForm"]["fullname"].value.trim();
            var email = document.forms["registrationForm"]["email"].value.trim();
            var quli = document.forms["registrationForm"]["qualification"].value.trim();

            document.getElementById("name-error").innerHTML = "";
            document.getElementById("email-error").innerHTML = "";
            document.getElementById("quli-error").innerHTML = "";

            if (fullname === "") {
                document.getElementById("name-error").innerHTML = "<span style='color:red'>Fullname is required</span>";
                return false;
            }
            if (!/^[a-zA-Z]+\s+[a-zA-Z]+$/.test(fullname)) {
                document.getElementById("name-error").innerHTML = "<span style='color:red'>Enter your full name (e.g., Firstname Lastname)</span>";
                return false;
            }

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === "") {
                document.getElementById("email-error").innerHTML = "<span style='color:red'>Email is required</span>";
                return false;
            }
            if (!emailPattern.test(email)) {
                document.getElementById("email-error").innerHTML = "<span style='color:red'>Enter a valid email address</span>";
                return false;
            }

            if (quli === "") {
                document.getElementById("quli-error").innerHTML = "<span style='color:red'>Qualification is required</apan>";
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
try {
    int id = Integer.parseInt((String)session.getAttribute("rid"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "acer");
    Statement st = con.createStatement();
    String str = "select * from register where id=" + id;
    ResultSet rs = st.executeQuery(str);
    if (rs.next()) {
%>
<div class="form-container">
    <form action="editprofilecode.jsp" id="registrationForm" onsubmit="return validateForm();" autocomplete="off">
        <%
                   try{
                       String data = session.getAttribute("existsmsg").toString();
                       
                 %>
                 <p id="failed"><%out.print(data);%></p>
                      <% session.removeAttribute("existsmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
     
        
        <h3>Edit Profile</h3>
        <span>Fullname</span>
        <input type="text" name="fullname" placeholder="Enter your fullname" value="<%=rs.getString("fullname")%>" id="fullname">
        <span id="name-error"></span>

        <span>Email</span>
        <input type="text" name="email" placeholder="Enter your email" value="<%=rs.getString("email")%>" id="email">
        <span id="email-error"></span>

        <span>Qualification</span>
        <input type="text" name="qualification" placeholder="Enter your qualification" value="<%=rs.getString("qualification")%>" id="qualification" style='text-transform:uppercase'>
        <span id="quli-error"></span>

        <div class="button">
            <input type="button" value="Update Profile" onclick="submitForm();" name="action">
        </div>

        <input type="hidden" name="id" value="<%=id%>">
        <p>If you want to change Password <a href="changepassword.jsp">click here</a></p>
    </form>
</div>
<%
    }
} catch (Exception e) {
    out.print(e);
}
%>
</body>
</html>
