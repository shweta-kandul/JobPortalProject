<%-- 
    Document   : deleteur
    Created on : Apr 8, 2024, 2:38:21 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete user and recruiter</title>
    </head>
    <body>
         <%
        try{
                
           String ur = request.getParameter("ur");
                  


                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();

                st.executeUpdate("delete from register where email='"+ur+"'");
               
               

                  session.setAttribute("deleteur"," deleted Successfully");
                       response.sendRedirect("usertable.jsp");
        }
        catch(Exception e){
            out.print(e);
        }
        %>
       
    </body>
</html>
