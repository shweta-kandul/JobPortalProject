<%-- 
    Document   : deletejobcode
    Created on : Dec 21, 2023, 7:43:40 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>deletejob Page</title>
        <style> 
        #success{
    color: blue;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 2rem;
 } 
 </style>
    </head>
    <body>
        <%
        try{
                
            String jid=request.getParameter("jid");

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();

                st.executeUpdate("delete from jobs where jid="+jid);
               
               

                  session.setAttribute("deletejob","Job deleted Successfully");
                       response.sendRedirect("viewjobsrecruiter.jsp");
        }
        catch(Exception e){
            out.print(e);
        }
        %>
       
    </body>
</html>
