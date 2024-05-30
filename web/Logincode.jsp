<%-- 
    Document   : Logincode
    Created on : Dec 15, 2023, 6:43:05 PM
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
            String action=request.getParameter("action");
            if(action.equals("login")){
                String email = request.getParameter("email");
                String password= request.getParameter("password");
                String role = request.getParameter("role");
                  
                
                try{
                String id="";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
               Statement st =con.createStatement();
               
               ResultSet rs=st.executeQuery("select * from register where email= "+ "'"+email+"'");
               while(rs.next())
                   id=rs.getInt(1)+"";
               session.setAttribute("rid",id);
               
               
               
              
              
            }catch(Exception e1){
                out.print(e1);
                
            }
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from register where email='"+email+"' and password='"+password+"' and role='"+role+"'");
                    
                    if(rs.next()){
                         String r = request.getParameter("role");
                         
                        if(r.equals("admin")){
                            
                             response.sendRedirect("adminindex.jsp");
                        }else if(r.equals("user")){
                           response.sendRedirect("user.jsp"); 
                        }else if(r.equals("recruiter")){
                        response.sendRedirect("recruiter.jsp");
                        }
                       
                    }
                    else{
                      

                      session.setAttribute("loginmsg","Email and password OR User Type donot match");
                       response.sendRedirect("login.jsp");
                    }
                }catch(Exception e){
                    out.print(e);
                }
            }
            %>
    </body>
</html>
