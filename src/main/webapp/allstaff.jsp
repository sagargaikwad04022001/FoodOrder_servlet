<%@page import="java.util.List"%>
<%@page import="com.ty.food_store_servlet.dao.UserDao"%>
<%@page import="com.ty.food_store_servlet.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
    margin: 0;
    padding: 0;
    height:700px;
    font-family: Arial, sans-serif;
    background: url("https://img.freepik.com/premium-photo/photo-indian-spices-background-with-copy-space_763111-23576.jpg?size=626&ext=jpg&ga=GA1.1.1206251887.1677519861&semt=ais");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* Style the navigation bar */
nav {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
}

.container {
    max-width: 1400px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

h1 {
    margin: 0;
    font-size: 24px;
}

/* Style the navigation links */
.nav-links {
    list-style-type: none;
    padding: 0;
    display: flex;
}

.nav-links li {
    margin: 0 15px;
    position: relative;
}

.nav-links a {
    text-decoration: none;
    color: #fff;
    font-size: 18px;
    transition: color 0.3s;
}

/* Hover effect */
.nav-links a:hover {
    color: #ff9900;
}

/* Add underline effect on hover */
.nav-links li::after {
    content: '';
    position: absolute;
    width: 0%;
    height: 2px;
    background-color: #ff9900;
    bottom: 0;
    left: 0;
    transition: width 0.3s ease-in-out;
}

.nav-links li:hover::after {
    width: 100%;
}

/* Mobile responsive */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
        text-align: center;
    }

    .nav-links {
        margin-top: 20px;
    }

    .nav-links li {
        margin: 10px 0;
        position: relative;
    }
}
.tab{
    margin-left:100px;
    text-shadow: 3px 3px 5px white;
    color: white;
    overflow-y: scroll;
}
.tab:hover{
 
 
 
}
td:hover{
  filter: brightness(200%);
  
  
  background-color:white;
  color:black;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  position: relative;
  transition: all 1s ease;
 
}
.ab{
     
     width: 800px;
     margin-left: 40px;
}
.abc{
     background-color: rgba(250,210,222, 0.4);
     width: 900px;
     height:600px;
     overflow-y:scroll;
     overflow:hidden;
     margin-left: 30px;
     border-radius: 25px;
     box-shadow: 4px 4px 4px white;
     text-shadow: 2px 2px 2px white;
}
</style>
 <script src="https://kit.fontawesome.com/35804de5f5.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
</head>
<body>
  <nav>
        <div class="container">
            <h1>Welcome Manager</h1>
            <ul class="nav-links">
                <li><a href="managerview.jsp">Home</a></li>
                <li><a href="menu.jsp">View Menu</a></li>
                <li><a href="allstaff.jsp">view staff</a></li>
                <li><a href="branch.jsp">view branch</a></li>
                <li><a href="menucreation.jsp">Create Food Product</a></li>
                <li><a href="registeruser.jsp">Create Staff</a></li>
                <li><a href="branchregister.jsp">Create Branch</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
    </nav>

    <%
    User u=(User) session.getAttribute("user");
    if(u==null)
    {
    	RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
    	request.setAttribute("msg", "Login to access this field");
    	dispatcher.forward(request, response);
    }
    
    
    
    %>

          <%String msg=(String)request.getAttribute("msg"); %>
         <div><center>
         <%if(msg!=null) {%>
           <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
          <%} %>
          </center> </div>
         
         <%  
         UserDao dao=new UserDao();
         List<User> users=dao.getAllStaff();
         %>
         <div class="abc">
    <div class="ab">
           <table  border="1px solid red" cellspacing="10"cellpadding="10" style="width: 800px;; background-repeat: no-repeat;background-size: cover;background-position: center;">
          <%if(users!=null &&users.size()>0) {%>
           <% for(User user:users) {%>
              
              <%if(!user.getRole().equals("Manager")) {%>
              <tr>
                 <td rowspan="4"> <img style="margin-left: 50px;"  alt="" height="100px" width="100px" src="https://cdn1.iconfinder.com/data/icons/tourism-travel-2-1/256/Waiter-1024.png"> </td>
                 <th class="a">Staff Id</th>
                 <th class="a">Staff Name</th>
                 <td rowspan="4"><a href="update?phone=<%=user.getPhone() %>"><i style="color:green;padding-right: 5px;" class="fa-regular fa-pen-to-square"></i></a> <a href="delete?phone=<%=user.getPhone() %>"><i style="color:red;padding-left: 15px;" class="fa-solid fa-trash"></i></a> </td>
              </tr>
               <tr>
              
                 <td><%=user.getId() %></td>
                 <td><%=user.getName() %></td>
                
              </tr>
                <tr>
                 
                 <th class="a">Staff Contact</th>
                 <th class="a">Staff password</th>
                
              </tr>
                <tr>
                
                 <td><%=user.getPhone() %></td>
                 <td><%=user.getPassword()%></td>
                
              </tr>
              
                <%} %>
              
               <%} %>
           <%}else{ %> 
             <h2>No Staff Found</h2>
           <%} %> 
           </table>
           </div>
           </div>
</body>
</html>