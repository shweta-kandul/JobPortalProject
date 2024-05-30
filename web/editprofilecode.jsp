<%-- 
    Document   : editprofilecode
    Created on : Dec 25, 2023, 3:42:11 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" include="java.sql.*">
        <title>editprofilecode</title>
    </head>
    <body>
        <%
             String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String qualification= request.getParameter("qualification");

                 int id = Integer.parseInt(request.getParameter("id"));
          
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                                Statement st=con.createStatement();

                ResultSet rs=st.executeQuery("select * from register where email='"+email+"'");
               int count=0;
               while(rs.next()){
                    count++;
                }
                if(count>1){
             
                   session.setAttribute("existsmsg","Email is already exists");
                       response.sendRedirect("editprofile.jsp");
                   
                }
                else{
                     Statement st1=con.createStatement();

                    st1.executeUpdate("update register set fullname='"+fullname+"' , email='"+email+"' , qualification='"+qualification+"' where id="+id);
                    out.print("updated sucessfully");

                    session.setAttribute("profileUpdate","profile Updated Successfully");
                       response.sendRedirect("login.jsp");             
                }
                   
          
            
            
             
            }catch(Exception e){
                out.print(e);
            }
        
        %>
    </body>
</html>
