<%-- 
    Document   : profile
    Created on : Dec 23, 2023, 8:36:00 AM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile Page</title>
         <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
          <%
        try{
                
            int id=Integer.parseInt((String)session.getAttribute("rid"));

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();

                String str = "select * from register where id="+id;
                
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>
         <!-- profile start  -->
  <div class="container-profile">
 
    <div class="popup" id="popup">
        <img src="img/profile-1.jpg" alt="">
        <h3> <%=rs.getString(2)%></h3>
        <p> <%=rs.getString(5)%></p>
        <p> <%=rs.getString(3)%></p>

        <a href="#" class="btn" onclick="closePopup()">close</a>
        <a href="editprofile.jsp?id=<%=rs.getString("id")%>" class="btn">Edit</a>
        <br>
        

             <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>

    </div>
</div>
<script>
let popup = document.getElementById("popup");

function openPopup(){
    popup.classList.add("open-popup");
}

function closePopup(){
    popup.classList.remove("open-popup");
}
</script>
    </body>
</html>
