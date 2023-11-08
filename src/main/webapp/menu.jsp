<%@page import="com.ty.food_store_servlet.entity.User"%>
<%@page import="com.ty.food_store_servlet.dao.FoodProductsDao"%>
<%@page import="com.ty.food_store_servlet.entity.FoodProduct"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.food_store_servlet.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script src="https://kit.fontawesome.com/35804de5f5.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
<style type="text/css">
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
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
body{
height:700px;
width:100%;
background: url("https://en.free-wallpapers.su/data/media/2319/big/fd0244.jpg");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
.ab{
     
     width: 700px;
     margin-left: 40px;
}
.abc{
     background-color: rgba(250,210,222, 0.4);
     width: 800px;
     height:600px;
     overflow-y:scroll;
     overflow:hidden;
     margin-left: 30px;
     border-radius: 25px;
     box-shadow: 4px 4px 4px white;
     text-shadow: 2px 2px 2px white;
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
</style>

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
                <li><a href="/logout">Logout</a></li>
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
    <center> <h1 style="color: aqua;">Menu</h1> </center>
    <div class="abc">
    <div class="ab">
    <%
    
    FoodProductsDao dao2=new FoodProductsDao();
    List<FoodProduct> fp=dao2.getAllfoodProduct();
    if(fp!=null && fp.size()>0)
    {
    	for(FoodProduct product:fp)
    	{
    %>
    
    <table border="1px solid red" cellspacing="10" cellpadding="10" style="color: white;width: 700px;" >
    
    <tr>
    <td rowspan="4"> <img alt="" src="https://www.dlf.pt/png/big/16/167778_food-symbol-png.jpg" height="50px" width="50px">  </td>
    <th>Food id</th>
    <th>Name</th>
    <th>Type</th>
    <td rowspan="4"> <a href="updatefp?id=<%=product.getId() %>"><i style="color:green;padding-right: 5px;" class="fa-regular fa-pen-to-square"></i></a> <a href="deletefp?id=<%=product.getId() %>"><i style="color:red;padding-left: 15px;" class="fa-solid fa-trash"></i></a>  </td>    
    </tr>
    <tr>
    
    <td><%=product.getId() %></td>
    <td><%=product.getName() %></td>
    <td><%=product.getType() %></td>
        
    </tr>
    <tr>
    
    <th>Availability</th>
    <th>About</th>
    <th>Price</th>
        
    </tr>
    
    <tr>
    
    <td><%=product.getAvailability() %></td>
    <td><%=product.getAbout() %></td>
    <td><%=product.getPrice() %></td>
        
    </tr>
    
    </table>
    <%}
    	
    }else{ %>
        <h1>No Food Products Found</h1>
    <%} %>
    </div>
    </div>
</body>
</html>