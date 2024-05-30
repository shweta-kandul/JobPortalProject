<%-- 
    Document   : addjobcode
    Created on : Dec 17, 2023, 7:27:56 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>addjobcode</title>
    </head>
    <body>
        <% 
          
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String location= request.getParameter("location");
            String category = request.getParameter("category");
            String status = request.getParameter("status");
           
           int id=Integer.parseInt((String)session.getAttribute("rid"));
           
           // out.print(id);
            try{
              
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
            
                PreparedStatement ps = con.prepareStatement("insert into jobs(title,description,category,status,location,rid) values(?, ?, ?, ?, ?,?)");
                ps.setString(1,title );
                ps.setString(2,description );
                ps.setString(3,category);
                ps.setString(4,status);
                ps.setString(5, location);
                ps.setInt(6, id);
                
                
                int i = ps.executeUpdate();
                con.close();
                if(i>0){


                        session.setAttribute("msg","Job Added Successfully");
                       response.sendRedirect("addjob.jsp");
                }
              
            }catch(Exception e){
                out.print(e);
                
            }
        %>
    </body>
</html>
