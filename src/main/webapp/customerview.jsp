<%@page import="com.ty.food_store_servlet.entity.Item"%>
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
height: 700px;
width:100%;
background-image: url("https://swall.teahub.io/photos/small/6-63475_fast-food-background-hd.jpg");
background-position: center;
background-size: cover;
background-repeat: no-repeat;

}
.aaa {
     height:100vh;
	overflow: scroll;
}
table{
    background-color: rgba(247,225,215,.5);
    
}
</style>
</head>
<body>
<nav>
        <div class="container">
            <h1>Welcome </h1>
            <ul class="nav-links">
             
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>      
    </nav>
            <center>
       <%  String msg=(String) request.getAttribute("msg") ;
       if(msg!=null){
       %>
         <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
        <%} %>
        </center>
              <% 
	     
	     User user1=(User)session.getAttribute("user");
	     
	     List<FoodOrder> list=user1.getFoodOrders();
	     if(list!=null && list.size()>0)
	     {
	        for(FoodOrder order:list)
	        {
	     %>
	     
	     <div class="aaa"> <h1> My Orders</h1>
	    	<table style=";margin-left: 30px;margin-top: 30px; width: 800px; height: 200px;overflow: y;"  border="1px solid black" cellspacing="10"cellpadding="10">
             <tr>
                 <td rowspan="4"> <img alt="" src="https://media.istockphoto.com/vectors/vector-black-and-white-fast-food-illustration-vector-id511534744" height="40px" width="40px"> </td>
                 <th>Food_o_id</th>
                 <th>Customer Name</th>
                 <th>Contact</th>
                 <td rowspan="9"><a href="updatestatus?id=<%=order.getId() %>"><i style="color:green;padding-right: 5px;" class="fa-regular fa-pen-to-square"></i></a>
                  <a href="delete?id=<%=order.getId() %>"><i style="color:red;padding-left: 15px;" class="fa-solid fa-trash"></i></a></td>
             </tr>
             <tr>
                
                 <td><%=order.getId() %></td>
                 <td><%=user1.getName() %></td>
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
             <h2>No orders Found</h2>
           <%} %>  
</body>
</html>