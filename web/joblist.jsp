<%-- 
    Document   : joblist
    Created on : Apr 9, 2024, 3:17:24 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
        crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<style>
    .rtable {
  max-width: 100%;
  border: 1px solid #00bcd4;
  background-color: #4e8cc933;
  padding: 15px;
  overflow: auto;
  margin: auto;
  border-radius: 4px;
}

table {
  width: 100%;
  font-size: 13px;
  color: #444;
  white-space: nowrap;
  border-collapse: collapse;
}

table>thead {
  background-color: rgb(176, 84, 215);
  color: #fff;
}

table>thead th {
  padding: 15px;
}

table th,
table td {
  border: 1px solid #00000017;
  padding: 10px 15px;
  align-items: center;
}

.action_btn {
  display: flex;
  justify-content: center;
  gap: 10px;
}

.delete>a {
  text-decoration: none;
  border: 1px solid;
  display: inline-block;
  padding: 7px 20px;
  font-weight: bold;
  border-radius: 3px;
  transition: 0.3s ease-in-out;
}

.delete>a:hover {
  box-shadow: 0 3px 8px #0003;
}

table>tbody>tr {
  background-color: #fff;
  transition: 0.3s ease-in-out;
}

table>tbody>tr:nth-child(even) {
  background-color: rgb(238, 238, 238);
}

table>tbody>tr:hover {
  filter: drop-shadow(0px 2px 6px #0002);
}


.card-body {
    display: flex;
    flex-direction: column;
    padding: 20px;
    margin: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-body .jobicon {
    font-size: 2rem;
    margin-bottom: 10px;
}

.card-body h5 {
    margin-bottom: 10px;
    font-size: 1.5rem;
}

.card-body p {
    margin-bottom: 10px;
    font-size: 1rem;
}

.card-body .row-group {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin-bottom: 10px;
}

.card-body .row {
    flex: 0 0 32%;
}

.card-body input[type="text"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 1rem;
}

.card-body h4 {
    margin-bottom: 10px;
    font-size: 1rem;
}

.card-body .button {
    display: flex;
    justify-content: flex-end;
    margin-top: 10px;
}

.card-body .button a {
    margin-left: 10px;
}

/* Responsive styles */
@media (max-width: 768px) {
    .card-body .row {
        flex: 0 0 100%;
    }
}






     #success{
    color: blue;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 } 

 #failed{
     color: red;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.3rem;
 }
 
 
 .btn {
        padding: 8px 16px;
        background-color: #5C5CFF;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        text-decoration: none;
        display: inline-block;
        margin: 4px 2px;
        transition-duration: 0.4s;
    }

    .btn:hover {
        background-color: #A020F0;
        color: white;
    }
 
</style>

<body>
    <div class="container">

<%@include file="adminsidebar.jsp" %>

<div >
        <h1 class="heading"></h1>
        <%
                   try{
                       String data = session.getAttribute("jobmsg").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("jobmsg");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
    
     <%
                   try{
                       String data = session.getAttribute("deletejob").toString();
                             
                 %>
                 <span id="success"><%out.print(data);%></span>
                      <% session.removeAttribute("deletejob");%>
                       
                   <%}catch(Exception e){
                    
                   }
               %>
    
    
 
        <%
        try{
              
            

                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String str = "select * from jobs " ;
               
  
               
                           
               
                ResultSet rs = st.executeQuery(str);
                while(rs.next()){
                    %>

                    
    <div class="view-job">
      
        
        <div class="card-body" >
            <div class="jobicon">
                <i class='bx bx-clipboard'></i>
            </div>
            <h5>Title: <%=rs.getString(2)%></h5>
            <p name="description">Description: <%=rs.getString(3)%></p>
            <div class="row-group">
                <div class="row">
                    <input type="text" readonly placeholder="Location" value="Location: <%=rs.getString(6)%>">
                </div>
                <div class="row">
                    <input type="text" readonly placeholder="Category" value="Category: <%=rs.getString(4)%>" >
                </div>
                <div class="row">
                    <input type="text" readonly placeholder="Status" value="Status: <%=rs.getString(5)%>" >
                </div>
            </div>
           <h4>Posted date: <%=rs.getString(7)%></h4>
         
           <div class="button">
               <a href="admineditjob.jsp?jid=<%=rs.getString(1)%>"><input type="submit" value="Edit" class="btn"> </a>
               <a href="admindeletejobcode.jsp?jid=<%=rs.getString(1)%>"> <input type="submit" value="Delete" class="btn"><a>
           </div>
        </div>
               
       
    </div>
           
                    <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>
                    
   
    
        <script src="js/script.js"> </script>
  
            
</body>
</html>
