<%@page import="com.ty.food_store_servlet.dao.FoodProductsDao"%>
<%@page import="com.ty.food_store_servlet.entity.FoodProduct"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ty.food_store_servlet.entity.User"%>
<%@page import="javax.servlet.http.HttpSession;" %>
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
    .bo{
        width: 100vw;
        height: 100vh;
        background-image: linear-gradient(rgba(117, 112, 113, 0.4),rgba(204, 174, 130, 0.4)),url("https://tse1.mm.bing.net/th?id=OIP.Cyun8FzFIKXFoLzOvsRLpgHaD4&pid=Api&P=0&h=180");
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
    .box{
        width: 90%;
        max-width: 350px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background-color:transparent;
        padding :50px 40px 70px;
        text-align: center;
        border:1px solid black;
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
   </style>
</head>
<body>
    <div class="bo">
    <%User user=(User) session.getAttribute("user");
    User user2=(User)request.getAttribute("u1");
    %>
	    
     <center>
       <%  String msg=(String) request.getAttribute("msg") ;
       if(msg!=null){
       %>
        <h2 class="msg">
        <%=msg %>
        </h2>
        <%} %>
        </center>
        <%
        User user3=(User)request.getAttribute("u1");
        %>
      <form action="additem">
        <div class="box">
            <h1>Create Food Order</h1>          
                <div class="input">
                 <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder=" f order id" name="f_id">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="user phone" name="user_phone" value="<%= user3.getPhone()%>" hidden="true">
                    </div>
                     <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="user phone" name="user_name" value="<%= user3.getName()%>" hidden="true">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="product id" name="prod_id">
                    </div>
                   
                 <!--     <div class="inputfield">
                        <i class="fa fa-key" aria-hidden="true"></i>
                        <input type="text" placeholder="product name" name="prod_name">
                    </div>  
                    <div class="inputfield">
                        
                        <input type="text" placeholder="product type" name="prod_type"   >
                    </div> -->
                    <div class="inputfield">
                        
                        <input type="text" placeholder="product quantity" name="prod_quantity"   >
                    </div> 
               <!--  
                     <div class="inputfield">
                        
                        <input type="text" placeholder="product quantity" name="prod_price"   >
                    </div>    -->
                          <div class="inputfield">
                        
                        <input type="text" placeholder="order status" name="order_status" value="requested" hidden="true"  >
                    </div>   
                    <%  %>  
                    </div>   
                             
                </div>
              <center> 
              <% 
              if(!request.getSession().getAttribute("itemlist"))
              HttpSession session2=request.getSession();
              
              %>
              <div class="but">
                  <input type="submit" value="ADD"/>
                    
                </div>
              
              <div class="but">
                    <a href="forderservlet"><input type="submit" value="REGISTER"/></a>
                    
                </div>
                 <div style="padding-top: 30px;"> <a href="managerview.jsp">Back</a> </div>
                </center>
                 </div>
            </form>
       </div>   
</body>
</html>