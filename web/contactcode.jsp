<%-- 
    Document   : contactcode
    Created on : Feb 4, 2024, 7:13:02 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contact</title>
    </head>
    <body>
       
      <% 
          
            String name= request.getParameter("name");
            String email = request.getParameter("email");
            String msg= request.getParameter("msg");
          
           
            try{
              
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
            
                PreparedStatement ps = con.prepareStatement("insert into contact(name,email,msg) values(?, ?, ?)");
                ps.setString(1,name);
                ps.setString(2,email );
                ps.setString(3,msg);

                
                
                int i = ps.executeUpdate();
                con.close();
                if(i>0){
                 

                      session.setAttribute("msg","Contact has been successfull");
                      response.sendRedirect("index.jsp");
                }
              
            }catch(Exception e){
                out.print(e);
                
            }
        %>
    </body>
</html>
