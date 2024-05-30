<%-- 
    Document   : editur
    Created on : Apr 6, 2024, 4:10:11 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EditRole Page</title>
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
   
    <script>
        function validateForm() {
            var fullname = document.forms["registrationForm"]["fullname"].value.trim();
            var email = document.forms["registrationForm"]["email"].value.trim();
            var quli = document.forms["registrationForm"]["qualification"].value.trim();
                var phonenumber = document.forms["registrationForm"]["phoneno"].value.trim();

            document.getElementById("name-error").innerHTML = "";
            document.getElementById("email-error").innerHTML = "";
            document.getElementById("quli-error").innerHTML = "";
                document.getElementById("phone-error").innerHTML = "";


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
            
             // Validate phone number
    var phonePattern = /^\d{10}$/;
    if (phonenumber === "") {
        document.getElementById("phone-error").innerHTML = "Phone number is required";
        return false;
    }
    if (!phonePattern.test(phonenumber)) {
        document.getElementById("phone-error").innerHTML = "Enter a 10-digit phone number";
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
    String ur = request.getParameter("ur");
                   session.setAttribute("ur",ur);

    //out.print(ur);
    //int id = Integer.parseInt((String)session.getAttribute("rid"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "acer");
    Statement st = con.createStatement();
    
    String str = "select * from register where email=?";
PreparedStatement pstmt = con.prepareStatement(str);
pstmt.setString(1, ur);
ResultSet rs = pstmt.executeQuery();

//    String str = "select * from register where email=" + ur;
//    ResultSet rs = st.executeQuery(str);
 if (rs.next()) {
%>
<div class="form-container">
    <form  action="editurcode.jsp" id="registrationForm" onsubmit="return validateForm();" autocomplete="off">
        
        
        <h3>Edit Profile</h3>
        <span>Fullname</span>
        <input type="text"  placeholder="Enter your fullname" value="<%=rs.getString("fullname")%>" id="fullname" name="fullname">
        <span id="name-error"></span>

        <span>Email</span>
        <input type="text" placeholder="Enter your email" value="<%=rs.getString("email")%>" id="email"  name="email">
        <span id="email-error"></span>

        <span>Qualification</span>
        <input type="text" placeholder="Enter your qualification" value="<%=rs.getString("qualification")%>" id="qualification" style='text-transform:uppercase' name="qualification" >
        <span id="quli-error"></span>
        
        <span>Phoneno</span>
        <input type="text"  placeholder="Enter your phoneno" value="<%=rs.getString("phoneno")%>" id="phoneno" name="phoneno">
        <span id="email-error"></span>

        
        <!--<span>Gender</span>-->
        <div class="gender-details" >
                    <input type="radio" name="gender" id="dot-1" value="male"  class="male" >
                    <input type="radio" name="gender" id="dot-2" value="female" class="female" >
                    <input type="radio" name="gender" id="dot-3" value="other" class="other" >
                    <span class="gender-title">Gender</span>
                    <div class="category">
                        <label for="dot-1">
                            <span class="dot one"></span>
                            <span class="gender">Male</span>
                        </label>
                        <label for="dot-2">
                            <span class="dot two"></span>
                            <span class="gender">Female</span>
                        </label>
                        <label for="dot-3">
                            <span class="dot three"></span>
                            <span class="gender">other</span>
                        </label>
                    </div>
                      <small id="gender-error"></small>

                </div>
        <div class="button">
    <input type="submit" value="Update" onclick="submitForm()">
</div>


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
