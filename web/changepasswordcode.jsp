<%-- 
    Document   : changepasswordcode
    Created on : Dec 16, 2023, 7:39:17 AM
    Author     : shwet
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" include="java.sql.*">
        <title>changepasswordcode</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String newpassword= request.getParameter("newpassword");
            int check=0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from register where email='"+email+"'");
                while (rs.next())
                {
                    check=1;
                    st.executeUpdate("update register set password='"+newpassword+"' where email='"+email+"'");
                    response.sendRedirect("changepassword.jsp?msg=done");
                }
                if(check==0){
                    response.sendRedirect("changepassword.jsp?msg=invalid");
                }
            }catch(Exception e){
                out.print(e);
            }
        
        %>
    </body>
</html>
