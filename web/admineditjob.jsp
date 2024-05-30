<%-- 
    Document   : admineditjob
    Created on : Apr 9, 2024, 8:17:22 PM
    Author     : shwet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title> Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {
    overflow-x: hidden;
}

.container {
    position: relative;
    width: 100%;
}

.navigation {
    position: fixed;
    width: 300px;
    height: 100%;
    background: linear-gradient(135deg, #71b7e6, #9b59b6);
    transition: 0.5s;
    overflow: hidden;
}

.navigation.active {
    width: 60px;
}

.navigation ul {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
}

.navigation ul li {
    position: relative;
    width: 100%;
    list-style: none;
}

.navigation ul li:hover {
    background: #03a9f4;
}

.navigation ul li:nth-child(1) {
    margin-bottom: 20px;
}

.navigation ul li:nth-child(1):hover {
    background: transparent;
}

.navigation ul li a {
    position: relative;
    width: 100%;
    display: flex;
    text-decoration: none;
    color: #fff;
}

.navigation ul li a .icon {
    position: relative;
    display: block;
    min-width: 60px;
    height: 60px;
    line-height: 60px;
    text-align: center;
}

.navigation ul li a .icon .fa {
    color: #fff;
    font-size: 24px;
}

.navigation ul li a .title {
    position: relative;
    display: block;
    padding: 0 10px;
    height: 60px;
    line-height: 60px;
    white-space: nowrap;
}

.main {
    position: absolute;
    width: calc(100% - 300px);
    left: 300px;
    min-height: 100vh;
    background: #f5f5f5;
    transition: 0.5s;
}

.main.active {
    width: calc(100% - 60px);
    left: 60px;
}

.main .topbar {
    width: 100%;
    background: #fff;
    height: 80px;
    padding: 0 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.toggle {
    position: relative;
    width: 60px;
    height: 60px;
    cursor: pointer;
}

.toggle::before {
    content: "\f0c9";
    font-family: fontAwesome;
    position: absolute;
    width: 100%;
    height: 100%;
    line-height: 60px;
    font-size: 24px;
    text-align: center;
    color: #111;
}

.search {
    position: relative;
    width: 400px;
    margin: 0 10px;
}

.title label {
    position: relative;
    font-size: 35px;
    color: #111;
    font-weight: 500;
    width: 100%;
}




.search label .fa {
    position: absolute;
    left: 15px;
    top: 4px;
}

.user {
    position: relative;
    min-width: 50px;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    overflow: hidden;
    cursor: pointer;
}

.user a .fa {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

  

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
   height: 600px;
   margin-top: 30px;
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

.input-box textarea,
.input-box select,
.input-box input{
   font-family: 'Montserrat', sans-serif;
   width: 95%;
   height: 40px;
   padding: 2px;
   margin-top: 5px;
   margin-bottom: 14px;
   font-size: 20px;
   /* font-weight: bold; */
   box-sizing: border-box;
   outline: none;
   border-radius: 5px;
   padding-left: 15px;
   border: 1px solid #ccc;
   border-bottom-width: 2px;
   transition: all 0.3s ease;

}
.input-box span{
   font-weight: bold;
   font-size: 20px;
}

/* Now, make it responsive */

@media (max-width: 992px) {
    .navigation {
        left: -300px;
    }

    .navigation.active {
        left: 0;
        width: 300px;
    }

    .main {
        left: 0;
        width: 100%;
    }

    .main.active {
        width: calc(100% - 300px);
        left: 300px;
    }

    .cardBox {
        grid-template-columns: repeat(2, 1fr);
    }

    .details.active {
        grid-template-columns: repeat(1, 1fr);
    }
}


.button{
    margin-top: 20px;
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
        font-size: 20px;
        margin: 0px 2px;
        transition-duration: 0.4s;
        margin-left: 45%;
    }

    .btn:hover {
        background-color: #A020F0;
        color: white;
    }


@media (max-width: 768px) {
    .details {
        grid-template-columns: repeat(1, 1fr);
    }

    .cardHeader h2 {
        font-weight: 600;
        font-size: 18px;
    }
}

@media (max-width: 480px) {
    .cardBox {
        grid-template-columns: repeat(1, 1fr);
    }

    .details .recentOrders {
        overflow-x: auto;
    }

    .details .recentOrders table {
        width: 600px;
    }

    .navigation {
        width: 100%;
        left: -100%;
        z-index: 1000;
    }

    .navigation.active {
        width: 100%;
        left: 0;
    }

    .toggle.active {
        z-index: 10000;
        right: 0;
        position: fixed;
        left: initial;
        transition: 1s;
    }

    .toggle.active::before {
        color: #fff;
    }

    .main,
    .main.active {
        width: 100%;
        left: 0;
    }
}

/* Delete button design */

.delete {
    padding: 8px 20px 8px 20px;
    background-color: rgb(147, 75, 213);
    border-radius: 5px;
    font-weight: 600;
    color: white;
    text-decoration: none;


}

.delete:hover {
    opacity: 70%;
    color: white;
}





        </style>
    </head>

    <body>
        <div class="container">
          <%@include file="adminsidebar.jsp" %>


            

              <form action="admineditjobcode.jsp">
                    <div class="container5">
                        <%! int a;%>
                        <%
        try{
                
//            int id=Integer.parseInt((String)session.getAttribute("rid"));
           
//            out.print(id);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","acer");
                Statement st = con.createStatement();
                String jid = (String)request.getParameter("jid");
//                String str="select * from jobs where jid=jid";
                
              

                 a=Integer.parseInt(jid);
                ResultSet rs = st.executeQuery("select * from jobs where jid="+a);
                

                while(rs.next()){
           
                 %>  
 
                        <div class="login">
                            <h1>Edit job</h1>
                            <div class="input-box">
                                <span class="details">Enter Title</span>
                                <input type="text" required  name="title"  value="<%=rs.getString("title")%>">
                            </div>
                           
                            <div class="input-box">
                                <span class="details">Select Location</span>
                                <select name="location" >
                                    <option value="<%=rs.getString("location")%>"><%=rs.getString("location")%></option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Bangalore">Bangalore</option>
                                    <option value="Hyderabad">Hyderabad</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Pune">Pune</option>
                                    <option value="Nagpur">Nagpur</option>
                                    <option value="Solapur">Solapur</option>
                                </select>
                            </div>
         
                            <div class="input-box">
                                <span class="details">Select Category</span>
                                <select name="category"">
                                    <option  value="<%=rs.getString("category")%>"><%=rs.getString("category")%></option>
                                    <option value="IT">IT</option>
                                    <option value="Engineering">Engineering</option>
                                    <option value="Nurse">Nurse</option>
                                    <option value="Teacher">Teacher</option>
                                    <option value="Electrician">Electrician</option>
                                    <option value="Data Architect">Data Architect</option>
                                    <option value="Accountant">Accountant</option>
                                    <option value="Finance">Finance</option>
                                    <option value="Marketing">Marketing</option>
                                   
                                </select>
                            </div>

                            <div class="input-box" >
                                <span class="details">Select Status</span>
                                <select name="status" >
                                    <option value="<%=rs.getString("status")%>"><%=rs.getString("status")%></option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            
                            <div class="input-box">
                                <div class="message">
                                    <span class="details" >Enter Description</span>
                                        <textarea class="message-box" id="" cols="0" rows="0"  required name="description" ><%=rs.getString("description") %></textarea>
                                  
                                </div>
                               
                            </div>
                                          <input type="hidden" name="jid" value="<%=a%>">

                            <div class="button">
                                <input type="submit" value="Edit" class="btn"> 
                                
                            </div>     
                       </div>
                    </div>
                         
                      
                     </form>
                    
                   </div>
                
           
       <%}
    }
    catch(Exception e){
    out.print(e);
    }
    %>

            
                <script >
                    function toggleMenu() {
                            let toggle = document.querySelector(".toggle");
                            let navigation = document.querySelector(".navigation");
                            let main = document.querySelector(".main");
                            let details = document.querySelector(".details");
                            toggle.classList.toggle("active");
                            navigation.classList.toggle("active");
                            main.classList.toggle("active");
                            details.classList.toggle("active");
                            function myfunction() {
                                document.getElementById("con")
                            }
                            function show() {
                                document.getElementById("view")
                            }
                        }

                    
                </script>
    </body>

    </html>