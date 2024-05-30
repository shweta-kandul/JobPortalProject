<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Registration Form</title>
    <script>
        function validateForm() {
            var fullname = document.forms["registrationForm"]["fullname"].value.trim();
            var phonenumber = document.forms["registrationForm"]["phonenumber"].value.trim();
            var email = document.forms["registrationForm"]["email"].value.trim();
            var password = document.forms["registrationForm"]["password"].value.trim();
            var qualification = document.forms["registrationForm"]["qualification"].value.trim();
                        var role = document.forms["registrationForm"]["role"].value.trim();

            var gender = document.forms["registrationForm"]["gender"].value.trim();

            if (fullname === "") {
                alert("Fullname must be filled out");
                return false;
            }
            if (phonenumber === "") {
                alert("Phone number must be filled out");
                return false;
            }
            if (email === "") {
                alert("Email must be filled out");
                return false;
            }
            if (password === "") {
                alert("Password must be filled out");
                return false;
            }
            if (qualification === "") {
                alert("Qualification must be selected");
                return false;
            }
            
            if (role === "") {
                alert("role must be selected");
                return false;
            }
            if (gender === "") {
                alert("Gender must be selected");
                return false;
            }

            return true;
        }

        function submitForm() {
            if (validateForm()) {
                var formData = new FormData(document.getElementById("registrationForm"));
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "Registercode.jsp", true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            alert(xhr.responseText);
                            document.getElementById("registrationForm").reset(); // Reset form after successful submission
                        } else {
                            alert("An error occurred while processing your request.");
                        }
                    }
                };
                xhr.send(formData);
            }
        }
    </script>
</head>
<body>
    <h2>Registration Form</h2>
    <form id="registrationForm" onsubmit="event.preventDefault(); submitForm();">
        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname"><br><br>
        <label for="phonenumber">Phone Number:</label>
        <input type="text" id="phonenumber" name="phoneno"><br><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <label for="qualification">Qualification:</label>
        <select id="qualification" name="qualification">
            <option value="">Select</option>
            <option value="bachelor">Bachelor's Degree</option>
            <option value="master">Master's Degree</option>
            <option value="phd">PhD</option>
        </select><br><br>
        <label for="qualification">select role</label>

        <select name="role" id="role">
                        <option value="">Select</option>

                            <option value="user" name="user">user</option>
                            <option value="recruiter" name="recruiter">Recruiter</option>
                       
                        </select>
        <br><br>
        <label for="gender">Gender:</label>
        <input type="radio" id="male" name="gender" value="male"> Male
        <input type="radio" id="female" name="gender" value="female"> Female<br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
