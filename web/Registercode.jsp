<%-- 
    Document   : Registercode
    Created on : Dec 15, 2023, 11:10:56 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registercode</title>
    </head>
    <body>
        <%
        
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String password= request.getParameter("password");
            String qualification = request.getParameter("qualification");
            String phoneno = request.getParameter("phoneno");
            String gender = request.getParameter("gender");
            String role = request.getParameter("role");
           
            
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st=con.createStatement();

                ResultSet rs=st.executeQuery("select * from register where email='"+email+"'");
               int count=0;
               while(rs.next()){
                    count++;
                }
                if(count>0){
                   // out.print("job is already exists");
                   session.setAttribute("existsmsg","Email is already exists");
                       response.sendRedirect("register.jsp");
                   
                }
                else{
                PreparedStatement ps = con.prepareStatement("insert into register(fullname,email,password,qualification,phoneno,gender,role) values(?, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, fullname);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, qualification);
                ps.setString(5, phoneno);
                ps.setString(6, gender);
                ps.setString(7, role);
                
                int i = ps.executeUpdate();
                
                con.close();
                
                if(i>0){

                    session.setAttribute("msg","Your registration has been successfully!");
                       response.sendRedirect("login.jsp");
                }
                }
            }catch(Exception e){
                out.print(e);
                
            }
          
           
        %>
    </body>
</html>
