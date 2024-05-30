<%-- 
    Document   : logout
    Created on : Dec 25, 2023, 12:44:24 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout page</title>
    </head>
    <body>
       <%
//           int id =(int) session.getAttribute("rid");
           session.invalidate();
           response.sendRedirect("login.jsp");
           
       %>
    </body>
</html>
