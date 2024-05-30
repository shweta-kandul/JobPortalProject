<%-- 
    Document   : editurcode
    Created on : Apr 8, 2024, 1:10:53 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit user code</title>
    </head>
    <body>
         <%
             
             String ur=(String)session.getAttribute("ur");

             String fullname = request.getParameter("fullname");
             
            String email = request.getParameter("email");
            
           
             String phoneno = request.getParameter("phoneno");
                        
                        

            String qualification= request.getParameter("qualification");

                 String gender = request.getParameter("gender");
          
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
                       response.sendRedirect("recruitertable.jsp");
                   
                }
                else{
                     Statement st1=con.createStatement();

                    st1.executeUpdate("update register set fullname='"+fullname+"' , email='"+email+"' , qualification='"+qualification+"' , phoneno='"+phoneno+"', gender='"+gender+"' where email='"+ur+"'");
                    
                    session.setAttribute("profileUpdate"," Updated Successfully");
                       response.sendRedirect("recruitertable.jsp");             
                }
                   
          
            
            
             
            }catch(Exception e){
                out.print(e);
            }
        
        %>
    </body>
</html>
