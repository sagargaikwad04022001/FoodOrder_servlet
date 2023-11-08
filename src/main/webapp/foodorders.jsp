<%@page import="com.ty.food_store_servlet.dao.UserDao"%>
<%@page import="com.ty.food_store_servlet.entity.Item"%>
<%@page import="com.ty.food_store_servlet.dao.FoodOrderDao"%>
<%@page import="com.ty.food_store_servlet.entity.FoodOrder"%>
<%@page import="java.util.List"%>
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
height: 100vh;;
background-image: url("https://wallpapertag.com/wallpaper/full/4/d/7/317105-gorgerous-food-background-2990x1918-for-mobile-hd.jpg");
background-position: center;
background-size: cover;
background-repeat: no-repeat;



}
.cc{
	height:100vh ;
	overflow: scroll;
}
</style>
<script src="https://kit.fontawesome.com/35804de5f5.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
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
                <li><a href="logout">Log Out</a></li>
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
    <div class="cc">
         
	     <div class="dd">
	     <% 
	     FoodOrderDao dao=new FoodOrderDao();
	     List<FoodOrder> list=dao.getAllFoodOrders();
	     if(list!=null && list.size()>0)
	     {
	        for(FoodOrder order:list)
	        {
	     %>
	     
	    	<table style="margin-left: 30px;margin-top: 30px; width: 700px;"  border="1px solid black" cellspacing="10"cellpadding="10">
             <tr>
                 <td rowspan="4"> <img alt="" src="https://media.istockphoto.com/vectors/vector-black-and-white-fast-food-illustration-vector-id511534744" height="40px" width="40px"> </td>
                 <th>Food_o_id</th>
                 <th>Customer Name</th>
                 <th>Contact</th>
                 <td rowspan="9"><a href="updatestatus?id=<%=order.getId() %>"><i style="color:green;padding-right: 5px;" class="fa-regular fa-pen-to-square"></i></a>
                 </td>
             </tr>
             <tr>
                
                 <td><%=order.getId() %></td>
                 <td><%=order.getCustomerName() %></td>
                 <td><%=order.getContactNumber() %></td>
                
             </tr>
             <tr>
               
                 <th>Created Time</th>
                 <th>Delivered Time</th>
                 <th>Status</th>
                 
             </tr>
             <tr>
                 
                 <td><%=order.getOrderCreatedTime() %></td>
                 <td><%=order.getOrderDeliveryTime() %></td>
                 <td><%=order.getStatus() %></td>
                 
             </tr>
            <% List<Item> items=order.getItems();
                if(items!=null && items.size()>0){
                	for(Item item:items){
             %> 
             <tr>
             <td rowspan="4"> <img alt="" src=""> </td>
                  <td colspan="3">
                    <table  border="1px solid black" cellspacing="7"cellpadding="7">
                       <tr>
                       <th>Item id</th>
                         <th>Product id</th>
                          <th>product name</th>
                           
                            
                       </tr>
                       <tr>
                       <td><%=item.getId() %></td>
                       <td><%=item.getProductId() %></td>
                       <td><%=item.getName() %></td>
                       </tr>
                        <tr>
                        <th>type</th>
                         <th>quantity</th>
                          <th>Price</th>
                           
                            
                       </tr>
                       <tr>
                       <td><%=item.getType() %></td>
                       <td><%=item.getQuantity() %></td>
                       <td><%=item.getPrice() %></td>
                       </tr>
                    
                    </table>
                  </td>
                  
             </tr>
             <tr>
                <td colspan="2">Total Price</td>
                <td><%=order.getTotalPrice() %></td>
             </tr>
             <%} %>
             <%} %>
              </table>
             
           
             
             </div>
           
          <%} %>
	    
	    <%}else{ %> 
             <h2>No Staff Found</h2>
           <%} %>  
	   
	     </div> 
</body>
</html>