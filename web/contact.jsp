<%-- 
    Document   : contact
    Created on : Dec 13, 2023, 8:09:48 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact us</title>
    <!-- fontawesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- custom css link  -->
    <!-- <link rel="stylesheet" href="css/contactstyle.css"> -->
    <link rel="stylesheet" href="css/loginstyle.css">
    <!-- google fonts  -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Lora:wght@400;500&family=Montserrat:wght@300;400;500;600;800;900&family=Poppins:wght@400;500&display=swap" rel="stylesheet">


<script>
    
    function validateForm() {
    var fullname = document.forms["registrationForm"]["fullname"].value.trim();
   
    var email = document.forms["registrationForm"]["email"].value.trim();
    var msg = document.forms["registrationForm"]["msg"].value.trim();

    // Reset error messages
    document.getElementById("name-error").innerHTML = "";
    
    document.getElementById("email-error").innerHTML = "";
   document.getElementById("msg-error").innerHTML = "";

    // Validate full name
    if (fullname === "") {
        document.getElementById("name-error").innerHTML = "<span style='color:red'>Fullname is required</span>";
        return false;
    }
    if (!/^[a-zA-Z]+\s+[a-zA-Z]+$/.test(fullname)) {
        document.getElementById("name-error").innerHTML = "<span style='color:red'>Enter your full name (e.g., Firstname Lastname)</span>";
        return false;
    }

   

    // Validate email
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (email === "") {
        document.getElementById("email-error").innerHTML = "<span style='color:red'>Email is required</span>";
        return false;
    }
    if (!emailPattern.test(email)) {
        document.getElementById("email-error").innerHTML = "<span style='color:red'>Enter a valid email address</span>";
        return false;
    }


    //validate msg box
     if (msg === "") {
        document.getElementById("msg-error").innerHTML = "<span style='color:red'>Message is required</span>";
        return false;
    }
      if (msg.length > 100) {
        document.getElementById("msg-error").innerHTML = "<span style='color:red'>Message should not exceed 100 characters</span>";
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
    
 
    <div class="container-cont">
        <div class="content">
            <div class="left-side">
                <div class="address details">
                    <i class="fas fa-map-marker-alt"></i>
                    <div class="topic">Address </div>
                    <div class="text-one">Solapur,Maharashtra.</div>
                    <div class="text-two">solapur</div>
                </div>

               

                <div class="Phone details">
                    <i class="fas fa-phone-alt"></i>
                    <div class="topic">Phone </div>
                    <div class="text-one">+0096 3434 5678</div>
                    <div class="text-two">+0098 9893 5647</div>
                </div>

                <div class="Email details">
                    <i class="fas fa-envelope"></i>
                    <div class="topic">Email</div>
                    <div class="text-one">JobHub@gmail.com</div>
                    <div class="text-two">info.JobHub@gmail.com</div>
                </div>

            </div>

            <div class="right-side">
                <div class="topic-text">Send us a message</div>
                <p>You have any job related query,you can send me message from here.It's my pleasure to help you.</p>
          
            <form action="contactcode.jsp" id="registrationForm" onsubmit="return validateForm();" autocomplete="off">
                <div class="input-box">
                    <input type="text" placeholder="Enter your name" name="name" id="fullname" >
                     <small id="name-error"></small>
                </div>
                <div style="margin: 30px;"></div>
                <div class="input-box">
                    <input type="text" placeholder="Enter your email" name="email"  id="email" >
                     <small id="email-error"></small>
                </div>
                
                  <div style="margin: 30px;"></div>
                <div class="input-box message-box">
                    <textarea name="msg" id="" cols="0" rows="0" placeholder="Enter your Message" id="msg"></textarea>
                      <small id="msg-error"></small>
                </div>
              <div class="button">
                  <a href="#"><input type="submit" value="send now"></a>
                 </div>
               
            </form>
        </div>
        </div>
    </div>

    <%@include file="profile.jsp" %>
</body>
</html>
