<%-- 
    Document   : fileupload
    Created on : Feb 25, 2024, 9:04:56 AM
    Author     : shwet
--%>

<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>form upload</title>
    </head>
    <body>
        <%
   
         
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phoneno = request.getParameter("phoneno");
            
            String address = request.getParameter("address");
            String links = request.getParameter("links");
            String objective = request.getParameter("objective");
            
            String education = request.getParameter("education");
            String experience= request.getParameter("experience");
            String skills = request.getParameter("skills");
            
            String certificates= request.getParameter("certificates");
            String projects = request.getParameter("projects");
            
             String jid=(String)session.getAttribute("jid"+"");
//            String jid = request.getParameter("jid");
            out.print(jid);
             
            try{
                 String uid=(String)session.getAttribute("rid"+"");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
               
     
                     PreparedStatement ps = con.prepareStatement("insert into a_jobs(fullname,email,phoneno,address,links,objective,quli,expe,skills,certificate,project,jobid,uid) values(?,?, ?, ?, ?, ?,?,?,?,?,?,?,?)");
                ps.setString(1, fullname);
                ps.setString(2, email);
                ps.setString(3, phoneno);
                ps.setString(4, address);
                ps.setString(5, links);
                ps.setString(6, objective);
                  ps.setString(7,education);
                ps.setString(8, experience);
                ps.setString(9,skills);
                  ps.setString(10,certificates);
                ps.setString(11, projects);
                ps.setString(12, jid);
                 ps.setString(13, uid);
                int i = ps.executeUpdate();
                
                if(i>0){
            
                    session.setAttribute("applymsg","job  applied  successfully!");
                       response.sendRedirect("resume.jsp");
                }
               
                    
                
                con.close();
                
                
              
            }catch(Exception e){
                out.print(e);
                
            }
          
           
        %>
    </body>
</html>
