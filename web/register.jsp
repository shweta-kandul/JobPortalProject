<%-- 
    Document   : register
    Created on : Dec 14, 2023, 7:22:27 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>  Registration Form </title>
   
  
    <link rel="stylesheet" href="css/loginstyle.css">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    var role = document.forms["registrationForm"]["role"].value.trim();
    var email = document.forms["registrationForm"]["email"].value.trim();
    var password = document.forms["registrationForm"]["password"].value.trim();
    var qualification = document.forms["registrationForm"]["qualification"].value.trim();
    var phonenumber = document.forms["registrationForm"]["phoneno"].value.trim();
    var gender = document.forms["registrationForm"]["gender"].value.trim();

    // Reset error messages
    document.getElementById("name-error").innerHTML = "";
    document.getElementById("role-error").innerHTML = "";
    document.getElementById("email-error").innerHTML = "";
    document.getElementById("pass-error").innerHTML = "";
    document.getElementById("quli-error").innerHTML = "";
    document.getElementById("phone-error").innerHTML = "";
    document.getElementById("gender-error").innerHTML = "";

    // Validate full name
    if (fullname === "") {
        document.getElementById("name-error").innerHTML = "Fullname is required";
        return false;
    }
    if (!/^[a-zA-Z]+\s+[a-zA-Z]+$/.test(fullname)) {
        document.getElementById("name-error").innerHTML = "Enter your full name (e.g., Firstname Lastname)";
        return false;
    }

    // Validate role
    if (role === "") {
        document.getElementById("role-error").innerHTML = "Role is required";
        return false;
    }

    // Validate email
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        document.getElementById("email-error").innerHTML = "Email is required";
        return false;
    }
    if (!emailPattern.test(email)) {
        document.getElementById("email-error").innerHTML = "Enter a valid email address";
        return false;
    }

    // Validate password
    var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;
    if (password === "") {
        document.getElementById("pass-error").innerHTML = "Password is required";
        return false;
    }
    if (!passwordPattern.test(password)) {
        document.getElementById("pass-error").innerHTML = "Password must be at least 8 characters and contain at least one uppercase letter, one lowercase letter, one number, and one special character";
        return false;
    }

    // Validate qualification
    if (qualification === "Choose..") {
        document.getElementById("quli-error").innerHTML = "Qualification is required";
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

    // Validate gender
    if (gender === "") {
        document.getElementById("gender-error").innerHTML = "<span style='color:red'>Gender is required</span>";
        return false;
    }

    // If all validations pass, return true to submit the form
    return true;
}

// Submit form and store data in the database
function submitForm() {
    if (validateForm()) {
        var formData = new FormData(document.getElementById("registrationForm"));
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "Registercode.jsp", true);
        xhr.send(formData);
    }
}

    </script>
    
</head>

<body>
    <div class="container">
        <%
                   try{
                       String data = session.getAttribute("existsmsg").toString();
                       
                 %>
                 <p id="failed"><%out.print(data);%></p>
                      <% session.removeAttribute("existsmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
        <div class="title">Registration</div>
        <div class="content">
            <form action="Registercode.jsp" id="registrationForm" onsubmit="return validateForm();" autocomplete="off" >
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Full Name</span>
                        <input type="text" placeholder="Enter your name"  name="fullname" id="fullname">
                         <small id="name-error"></small>
                    </div>
                    

                    <div class="input-box">
                        <span class="details">Registration Type</span>
                        <select name="role" id="role">
                             <option value="">Select</option>

                            <option value="user" name="user">user</option>
                            <option value="recruiter" name="recruiter">Recruiter</option>
                       
                        </select>
                        <small id="role-error"></small>
                    </div>
                   
                    

                    <div class="input-box">
                        <span class="details">Email</span>
                        <input type="email" placeholder="Enter your email"  name="email" autocomplete="off" id="email">
                         <small id="email-error"></small>
                    </div>
                    
                    <div class="input-box">
                        <span class="details">Password</span>
                        <input type="password" placeholder="Enter your password"  name="password" autocomplete="off"  id="password">
                     <small id="pass-error"></small>
                    </div>
                    
                    <div class="input-box">
                        <span class="details">Qualification</span>
                        <select name="qualification" id="qualification">
                            <option value="Choose..">Choose...</option>
                            <option value="B_TECH">B_Tech</option>
                            <option value="B_PHARMA">B_PHARMA</option>
                            <option value="M_TECH">M_TECH</option>
                            <option value="MCA">MCA</option>
                            <option value="MBA">MBA</option>
                            <option value="M.COM">M.COM</option>
                            <option value="M.A">M.A</option>
                            <option value="BCA">BCA</option>
                            <option value="B.SCI">B.SCI</option>
                             <option value="12TH">12TH</option>
                             <option value="OTHER">OTHER</option>
                            
                        </select>
                          <small id="quli-error"></small>
                    </div>
                    
                    <div class="input-box">
                        <span class="details"> Phone no</span>
                        <input type="text" placeholder="Enter your phone number"  name="phoneno" id="phonenumber">
                        <small id="phone-error"></small>
                    </div>
                </div>

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
                    <a href="#"><input type="submit" value="Register" name="submit"  ></a> 
                     
                </div>
                <p>You have already an account? <a href="login.jsp">Login now</a></p>
            </form>
        </div>
    </div>


</body>

</html>
