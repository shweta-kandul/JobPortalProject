const header=document.querySelector("header");

window.addEventListener("scroll",function(){
    header.classList.toggle("sticky",window.scrollY > 0);
});

let menu = document.querySelector('#menu-icon');
let navbar = document.querySelector('.navbar');

//menu.onclick = () =>{
//    menu.classList.toggle('bx-x');
//    navbar.classList.toggle('open');
//};
//
//window.onscroll = () =>{
//    menu.classList.remove('bx-x');
//    navbar.classList.remove('open');
//};
//
//menuLinks.forEach((menuLink) => {
//    menuLink.addEventListener('click', () => {
//        navbarMenu.classList.remove('active');
//    });
//});


//admin js link

function toggleMenu() {
        let toggle = document.querySelector(".toggle");
        let navigation = document.querySelector(".navigation");
        let main = document.querySelector(".main");
        let details = document.querySelector(".details");
        toggle.classList.toggle("active");
        navigation.classList.toggle("active");
        main.classList.toggle("active");
        details.classList.toggle("active");
        function myfunction(){
          document.getElementById("con")
        }
         function show() {
          document.getElementById("view")
        }
      }
      
      
      //validation js
      
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
