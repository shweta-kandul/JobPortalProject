<%-- 
    Document   : admin
    Created on : Dec 15, 2023, 7:51:38 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>profile Page</title>
         <!--<link rel="stylesheet" href="css/style.css">-->
    <style>
  

.container5{
   
    width:100%;
    height:80vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top:2px;
}
.login{
    width:600px;
    height: 400px;
    padding: 10px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgb(0, 0, 0);
    cursor: pointer;
}
.login h1{
    padding-top: 20px;
    padding-bottom: 10px;
    text-align: center;
    font-family: 'Montserrat', sans-serif;

    
}
label{
    color:purple;
}
.input-box input{
    font-family: 'Montserrat', sans-serif;
    width: 95%;
    height: 40px;
    padding: 2px;
    margin-top: 5px;
    margin-bottom: 14px;
    font-size: 20px;
    font-weight: bold;
    box-sizing: border-box;
    outline: none;
    border-radius: 5px;
    padding-left: 15px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;

}
.input-box label{
    font-weight: bold;
    font-size: 20px;
}
button {
     height: 5vh;
    width: 95%;
    border-radius: 5px;
    
    border: none;
    color: #fff;
    font-size: 20px;
    font-weight: 500;
    letter-spacing: 1px;
    cursor: pointer;
    transition: all 0.3s ease;
    background: linear-gradient(135deg, #71b7e6, #9b59b6);
}

.btn {
    display: inline-block;
    padding: 8px 16px;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    background: linear-gradient(135deg, #71b7e6, #9b59b6);
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s;
    text-decoration: none;
    text-align: center;
      width: 95%;
}

.btn:hover {
    background: linear-gradient(135deg, #506ccf, #7f3c96);
}


    </style>
</head>

    

<body>
     
    <%@include file="adminsidebar.jsp" %>
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
     <form action="#">
    <div class="container5">
       
        <div class="login">
            <h1>Profile</h1>
            <div class="input-box">
                <label >Fullname</label>
                <input type="text" name="fullname" id="" readonly value="<%=rs.getString(2)%>">
            </div>
            <div class="input-box">
                <label >Email</label>
                <input type="email" name="email" id="" readonly value="<%=rs.getString(3)%>">
            </div>
            
             <div class="input-box">
                <label >Qualification</label>
                <input type="text" name="qualification" id="" readonly value="<%=rs.getString(5)%>">
            </div>
               <a href="editprofile.jsp?id=<%=rs.getString("id")%>" class="btn">Edit</a>
                
       </div>
    </div>
         
             <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>
     </form>
</body>
</html>