<%-- 
    Document   : admineditjobcode
    Created on : Apr 9, 2024, 8:31:25 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String title = request.getParameter("title");
            String description = request.getParameter("description");
            String location= request.getParameter("location");
            String category = request.getParameter("category");
            String status = request.getParameter("status");
            String pdate=request.getParameter("date");
            int jid = Integer.parseInt(request.getParameter("jid"));

            int check=0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                 Statement st=con.createStatement();
                 if(check==0){
                    st.executeUpdate("update jobs set title='"+title+"' , description='"+description+"' , location='"+location+"' , category='"+category+"', status='"+status+"' where jid="+jid);


                    session.setAttribute("jobmsg","Job Updated Successfully");
                       response.sendRedirect("joblist.jsp");
                 }
                 else{
                     out.print("failed to update");
                 
                 }

 
             
            }catch(Exception e){
                out.print(e);
            }
        
        %>
    </body>
</html>
