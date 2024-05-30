<%-- 
    Document   : resume
    Created on : Mar 2, 2024, 1:44:02 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resume Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
        }

        .container {
            max-width: 800px;
            margin: 5% auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        label, input, textarea {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"], textarea {
            width: calc(50% - 5px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            background-color: #8a2be2;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #8228ac;
        }

        .up, .section {
            background-color: #6d3eb8;
            color: #fff;
            padding: 10px;
            margin-top: 20px;
            border-radius: 3px;
        }
        .up label,
        .section label {
            font-weight: bold;
        }

        .section textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        #success {
            color: blue;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 2rem;
        }
    </style>
<script>
//function validateForm() {
//    var isValid = true;
//    var fullname = document.getElementById("fullname").value.trim();
//    var email = document.getElementById("email").value.trim();
//    var phoneno = document.getElementById("phoneno").value.trim();
//    var address = document.getElementById("address").value.trim();
//    var links = document.getElementById("links").value.trim();
//    var objective = document.getElementById("objective").value.trim();
//    var education = document.getElementById("education").value.trim();
//    var experience = document.getElementById("experience").value.trim();
//    var skills = document.getElementById("skills").value.trim();
//    var certificates = document.getElementById("certificates").value.trim();
//    var projects = document.getElementById("projects").value.trim();
//
//    document.getElementById("name-error").innerHTML = "";
//    document.getElementById("email-error").innerHTML = "";
//    document.getElementById("phone-error").innerHTML = "";
//    document.getElementById("address-error").innerHTML = "";
//    document.getElementById("links-error").innerHTML = "";
//    document.getElementById("objective-error").innerHTML = "";
//    document.getElementById("quli-error").innerHTML = "";
//    document.getElementById("exper-error").innerHTML = "";
//    document.getElementById("skills-error").innerHTML = "";
//    document.getElementById("certi-error").innerHTML = "";
//    document.getElementById("project-error").innerHTML = "";
//
//    if (fullname === "") {
//        document.getElementById("name-error").innerHTML = "Fullname is required";
//        isValid = false;
//    }
//
//    if (email === "") {
//        document.getElementById("email-error").innerHTML = "Email is required";
//        isValid = false;
//    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
//        document.getElementById("email-error").innerHTML = "Enter a valid email address";
//        isValid = false;
//    }
//
//    if (phoneno === "") {
//        document.getElementById("phone-error").innerHTML = "Please enter your mobile number";
//        isValid = false;
//    }
//
//    if (address === "") {
//        document.getElementById("address-error").innerHTML = "Please enter your address";
//        isValid = false;
//    }
//
//    if (links === "") {
//        document.getElementById("links-error").innerHTML = "Please enter your professional links";
//        isValid = false;
//    }
//
//    if (objective === "") {
//        document.getElementById("objective-error").innerHTML = "Please enter your career objective";
//        isValid = false;
//    }
//
//    if (education === "") {
//        document.getElementById("quli-error").innerHTML = "Please enter your academic qualifications";
//        isValid = false;
//    }
//
//    if (experience === "") {
//        document.getElementById("exper-error").innerHTML = "Please enter your experience";
//        isValid = false;
//    }
//
//    if (skills === "") {
//        document.getElementById("skills-error").innerHTML = "Please enter your skills";
//        isValid = false;
//    }
//
//    if (certificates === "") {
//        document.getElementById("certi-error").innerHTML = "Please enter your certificates";
//        isValid = false;
//    }
//
//    if (projects === "") {
//        document.getElementById("project-error").innerHTML = "Please enter your projects";
//        isValid = false;
//    }
//
//    return isValid;
//}
//
//</script>


</head>
<body>
<%@include file="usernavbar.jsp" %>
<%
try{
                 String uid=(String)session.getAttribute("rid"+"");
                 String jid = request.getParameter("jid");
                 session.setAttribute("jid",jid);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
               
                
                
                
                Statement st1=con.createStatement();
                ResultSet rs1=st1.executeQuery("select * from a_jobs where jobid="+jid+" AND uid="+uid);
                int count=0;
                while(rs1.next()){
                    count++;
                }
                if(count>0){
                 
                   session.setAttribute("existsmsg","job is already applied");
                       response.sendRedirect("showappliedjobsuser.jsp");
                   
                } else {
        // Fetch user's information from the register table
        String userQuery = "SELECT * FROM register WHERE id=" + uid;
          Statement st=con.createStatement();
        ResultSet rs = st.executeQuery(userQuery);
        if (rs.next()) {
        %>
        <div class="container">
             <%
                   try{
                       String data = session.getAttribute("applymsg").toString();
                       
                 %>
                 <p id="success"><%out.print(data);%></p>
                      <% session.removeAttribute("applymsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
            <h1>Submit Your Resume</h1>
        <form action="fileupload.jsp" id="resume-form" onsubmit="return validateForm();">

                <div  class="up">
                     <label for="fullname">Fullname:</label>
                    <input type="text" style="width: 100%;" id="fullname" spellcheck="false" name="fullname" placeholder="Full Name"
                           style="width: 48%;" value="<%=rs.getString(2)%>" required>
                    
                     <small id="name-error"></small>
                     
                     
                     <label for="Email">Email:</label>
                    <input type="text" style="width: 100%;" id="email" spellcheck="false" name="email" placeholder="Email"
                           style="width: 48%;" value="<%=rs.getString(3)%>" required>
                    
                     <small id="email-error"></small>
                </div>

                <div class="section">
                    <label for="mobile">Mobile no:</label>

                    <input type="text" id="phoneno" spellcheck="false" name="phoneno" style="width: 100%;"
                           placeholder="Mobile Number" style="width: 48%;" value="<%=rs.getString(6)%>" required>
                     <small id="phone-error"></small>

                    <label for="address">Address:</label>
                    <textarea id="address" name="address" spellcheck="false" placeholder="Address" requried></textarea>
                     <small id="address-error"></small>

                    <label for="links">Professional Links:</label>
                    <textarea id="links"   name="links" spellcheck="false" placeholder="Linkdin Github  links here..."
                             required ></textarea>
                     <small id="links-error"></small>
                </div>

                <div class="section">
                    <label for="objective">Career Objective:</label>
                    <textarea id="objective"   name="objective" spellcheck="false" placeholder="Career objective"
                             required ></textarea>
                     <small id="objective-error"></small>

                    <label for="education">Academic Qualifications:</label>
                    <textarea id="education"  name="education" spellcheck="false"
                              placeholder="10th,12th,Degree,Masters in Degree..." required ></textarea>
                     <small id="quli-error"></small>

                    <label for="experience">Experience:</label>
                    <textarea id="experience" required name="experience" spellcheck="false" placeholder="Experience"
                              ></textarea>
                     <small id="exper-error"></small>

                    <label for="skills">Skills:</label>
                    <textarea id="skills" required name="skills" spellcheck="false" placeholder="Skills" ></textarea>
                     <small id="skills-error"></small>

                    <label for="references">Certificates:</label>
                    <textarea id="certificates" required name="certificates" spellcheck="false" placeholder="Certificates"
                              ></textarea>
                     <small id="certi-error"></small>

                    <label for="projects">Projects:</label>
                    <textarea id="projects" required name="projects" spellcheck="false" placeholder="Projects"
                              ></textarea>
                     <small id="project-error"></small>
                </div>
                <input type="hidden" name="jid" value="<%=jid%>">
                <input type="submit" value="Submit">
            </form>
        </div>
    <% }
    }
}

catch(Exception e){
out.print(e);
}
%>
<%@include file="profile.jsp" %>
</body>
</html>
