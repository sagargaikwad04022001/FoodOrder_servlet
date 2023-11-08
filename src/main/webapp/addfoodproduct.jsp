<%@page import="com.ty.food_store_servlet.dao.MenuDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ty.food_store_servlet.entity.Menu"%>
<%@page import="com.ty.food_store_servlet.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <script src="https://kit.fontawesome.com/35804de5f5.js" crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="./font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.css">
   <style>
   
    .box{
        width: 400px;
        height:450px;
        
        color:white;
        background-color:transparent;
        text-color:white;
        text-align: center;
        border:1px solid red;
        border-radius: 20px;
        box-shadow: 4px 4px 6px grey ;
        text-shadow: 2px 2px 4px grey;
        
    }
    h1{
        font-size: 30px;
        margin-bottom: 60px;
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
        background: transparent;
        color:black;
        
        border-left:none;
        border-right:none;
        border-top:none;
        border-botton: 1px solid black;
        outline: 0;
        padding: 18px 15px;
    }
    .inputfield  input:hover{
    background-color: grey;
    border-radius: 20px;
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
        margin-top:30px;
        padding-top:5px;
        color:black;
        height: 20px;
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
body{
    height:100%;
width:100%;
background: url("https://tse1.mm.bing.net/th?id=OIP.D9R5Z8PKFW_pV3sFt-FhFAHaEK&pid=Api&P=0&h=180");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
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
    color: white;
    text-shadow: 3px 3px 3px grey;

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

   </style>
</head>
<body>
 <nav>
        <div class="container">
            <h1>Welcome Manager</h1>
            <div class="aa">
            <ul class="nav-links">
                <li><a href="">Home</a></li>
                <li><a href="menu.jsp">View Menu</a></li>
                <li><a href="login.jsp">view staff</a></li>
                 <li><a href="login.jsp">view Branch</a></li>
                <li><a href="login.jsp">Create Food Product</a></li>
                <li><a href="register.jsp">Create Staff</a></li>
                 <li><a href="login.jsp">Create Branch</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
            </div>
        </div>
    </nav>
    <div class="bo">
    <%
    MenuDao dao=new MenuDao();
    List<Menu> menus=dao.getAllMenu();
    if(menus!=null && menus.size()>0)
    {
    Menu menu=menus.get(0);
    
    
    User user=(User) session.getAttribute("user");%>
	    
     <center>
       <%  String msg=(String) request.getAttribute("msg") ;
       if(msg!=null){
       %>
        <h2 class="msg">
        <%=msg %>
        </h2>
        <%} %>
        </center>
        <div class="box" style="margin-left: 80px;margin-top: 30px;">
      <form action="registerfp">
        
            <h1 style="margin-top: 25px;">Add Food Product</h1>          
                <div class="input">
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="food Name" name="fp_name">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="food type" name="fp_type">
                    </div>
                   <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="availability" name="fp_avai">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="price" name="fp_price"   >
                    </div>   
                                  
                </div>
              <center> <div class="but">
                    <input type="submit" value="REGISTER"/>
                    
                </div>
               
                 <div style="padding-top: 30px;color: #2874f0;
    font-weight: 500;font: 14px Roboto,Arial,sans serif""> <a href="managerview.jsp">Back</a> </div>
                </center>
                
            </form>
            </div>
       </div>   
       <%}else{ 
             RequestDispatcher dispatcher=request.getRequestDispatcher("menucreation.jsp");
						request.setAttribute("msg", "Menu not exist exist");
						
       } %>
</body>
</html>