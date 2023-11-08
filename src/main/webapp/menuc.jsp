<%@page import="com.ty.food_store_servlet.entity.FoodProduct"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.food_store_servlet.dao.FoodProductsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
td:hover{
  filter: brightness(200%);
  
  
  background-color:white;
  color:black;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  position: relative;
  transition: all 1s ease;
 
}
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
.ab{
     
     width: 600px;
     margin-left: 40px;
}
.abc{
     background-color: rgba(250,210,222, 0.4);
     width: 700px;
     height:600px;
     overflow-y:scroll;
     overflow:hidden;
     margin-left: 30px;
     border-radius: 25px;
     box-shadow: 4px 4px 4px white;
     text-shadow: 2px 2px 2px white;
}
body{
height:800px;
background: url("https://en.free-wallpapers.su/data/media/2319/big/fd0244.jpg");
background-position: center;
background-size: cover;
background-repeat: no-repeat;
}

</style>
</head>
<body>
 <nav>
        <div class="container">
            <h1>Welcome</h1>
            <ul class="nav-links">
                <li><a href="staffview.jsp">Home</a></li>
                <li><a href="foodorders.jsp">View Food Orders</a></li>
                <li><a href="customerregister.jsp">Create Customer</a></li>
                <li><a href="foodoregister.jsp">Create food order</a></li>
                <li><a href="menuc.jsp">View Menu</a></li>
                <li><a href="logout">logout</a></li>
            </ul>
        </div>
    </nav>
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
    
    <table border="1px solid red" cellspacing="10" cellpadding="10" style="color: white;width: 600px;" >
    
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