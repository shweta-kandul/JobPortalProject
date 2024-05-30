<%-- 
    Document   : viewresume
    Created on : Mar 2, 2024, 3:12:58 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Resume Form</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 800px;
        margin: 20px auto;
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
        width: calc(50% - 5px); /* 50% width with a small gap between inputs */
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
    .up,
    .section {
        background-color: #6d3eb8; /* Purple background color */
        color: #fff;
        padding: 10px;
        margin-top: 20px;
        border-radius: 3px;
    }
    .section label {
        font-weight: bold;
    }
    .section textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box; /* Ensures the padding is included in the width */
    }
</style>
</head>
<body>
    <div class="container">
        <h1> Resume</h1>
         <%
        try{
                
            int id=Integer.parseInt((String)session.getAttribute("rid"));
           String aid = request.getParameter("aid");
//            out.print(id);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String jid = (String)request.getParameter("jid");
                String str = "select * from a_jobs where aid="+aid;
                
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>
        <form id="resume-form" action="downloadfile.jsp">
            
            <div style="display: flex; gap: 10px;" class="up">
                <input type="text" id="first-name" name="fullname" readonly  style="width: 48%;" value=" <%=rs.getString(2)%>">
                <input type="text" id="last-name" name="email" readonly style="width: 48%;" value=" <%=rs.getString(3)%>">
            </div>

            <div class="section">
                <label for="Mobile">Mobile no:</label>
                <input type="text" id="Mobile" name="phoneno" readonly   style="width: 97%;" value=" <%=rs.getString(4)%>">

                <label for="address">Address:</label>
                <textarea id="address" name="address" readonly ><%=rs.getString(5)%></textarea>

                <label for="links">Professional Links:</label>
                <textarea id="links" name="links" readonly  > <%=rs.getString(6)%></textarea>
            </div>

            <div class="section">
                <label for="objective">Career Objective:</label>
                <textarea id="objective" name="objective"readonly  ><%=rs.getString(7)%></textarea>

                <label for="education">Academic Qualifications:</label>
                <textarea id="education" name="education"  ><%=rs.getString(8)%></textarea>

                <label for="experience">Experience:</label>
                <textarea id="experience" name="experience" readonly  ><%=rs.getString(9)%></textarea>

                <label for="skills">Skills:</label>
                <textarea id="skills" name="skills" readonly  > <%=rs.getString(10)%></textarea>

                <label for="references">Certificates:</label>
                <textarea id="references" name="certificates" readonly  ><%=rs.getString(11)%></textarea>

                <label for="projects">Projects:</label>
                <textarea id="projects" name="projects" readonly  > <%=rs.getString(12)%></textarea>
            </div>

            <input type="submit" value="Download">
             <%}
    }

    catch(Exception e){
    out.print(e);
    }
    %>
        </form>
    </div>

   
</body>

</html>
