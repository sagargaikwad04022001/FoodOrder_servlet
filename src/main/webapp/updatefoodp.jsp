<%@page import="com.ty.food_store_servlet.entity.User"%>
<%@page import="com.ty.food_store_servlet.entity.FoodProduct"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
    body{
        width: 100vw;
        height: 700px;
        background-image: linear-gradient(rgba(117, 112, 113, 0.4),rgba(204, 174, 130, 0.4)),url("https://en.free-wallpapers.su/data/media/2319/big/fd0244.jpg");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .box{
        width: 90%;
        max-width: 350px;
        
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
         background:rgba(147, 138, 143, 0.52);
        padding :50px 40px 70px;
        text-align:center;
        border:1px solid black;
        border-radius: 20px;
        box-shadow: 4px 4px 6px grey ;
        text-shadow: 2px 2px 4px grey;
    }
    h1{
        font-size: 30px;
        margin-bottom: 20px;
        position: relative;
        color: #3c003c;
    }
    .inputfield{
        background-color:transparent;
        color:white;
        margin: 15px 0;
        border-radius: 3px;
        display: flex;
        align-items: center;
        padding-right: 10px;
    }
  .inputfield  input{
        width: 300px;
        background:transparent;
        color:aqua;
        text-shadow:2px 2px 2px white;
        border-left:none;
        border-right:none;
        border-top:none;
        border-botton: 1px solid black;
        border-radius:30px;
        outline: 0;
        padding: 18px 15px;
    }
    i{
        margin-left: 15px;
        color: #999;
    }
    .but{
        border-radius: 10px;
        color:black;
        background-color:#6499E9;
        text-align:center;
        margin-top:10px;
        padding-top:5px;
        color:black;
        height: 15px;
        width: 100px;

    }
    .but input{
      text-decoration: none;
      color:black;
      padding-bottom:15px;
      border:none;
      background: transparent;
    }
    .fa fa-key{
    background-color: transparent;
    color: grey;
    }
    .but:hover {
	scale:1.2;
}
    .msg{
       font-size: xx-large;
       color: #2874f0;
       
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
color:white;
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
.a{
height:700px;
width:100%;
background: url("https://en.free-wallpapers.su/data/media/2319/big/fd0244.jpg");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
.inputfield input:hover {
	filter:brightness(300%)
}
.bbb{
  border: 1px solid black;
  width: 400px;
  border-radius: 20px;
  margin-left: 30px;
  margin-top: 30px;
  text-align: center;
}
</style>
</head>
<body>

    <nav>
        <div class="container">
            <h1>Welcome Manager</h1>
            <ul class="nav-links">
                <li><a href="">Home</a></li>
                <li><a href="menu.jsp">View Menu</a></li>
                <li><a href="allstaff.jsp">view staff</a></li>
                 <li><a href="login.jsp">view Branch</a></li>
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
    
    
    <%  FoodProduct foodProduct=(FoodProduct)request.getAttribute("prod"); %>
      <div class="bbb">
               <center>   <div style="height: 50px;"> <img alt="" src="https://www.dlf.pt/png/big/16/167778_food-symbol-png.jpg" height="50px" width="50px"> </div> </center>
            <form action="updatefp" method="post">
        
            <h1 style="margin-top: 25px;">Update Food Product</h1>          
                <div class="input">
                <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="food Name" name="fp_id"  value="<%= foodProduct.getId()%>" hidden="true">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="food Name" name="fp_name"  value="<%= foodProduct.getName()%>">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="food type" name="fp_type"  value="<%= foodProduct.getType()%>">
                    </div>
                   <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="availability" name="fp_avai"  value="<%= foodProduct.getAvailability()%>">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="price" name="fp_price"   value="<%= foodProduct.getPrice()%>" >
                    </div>   
                                  
                </div> <center>
               <div class="but">
                    <input type="submit" value="UPDATE"/>
                    
                </div>
                </center>
               
                 <div style="padding-top: 30px;color: #2874f0;padding-bottom:20px;
    font-weight: 500;font: 14px Roboto,Arial,sans serif""> <a href="managerview.jsp">Back</a> </div>
                
                
            </form>
            </div>
</body>
</html>