<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.ty.food_store_servlet.entity.User"%>

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
        height:550px;
        
        color:white;
        background-color:rgba(178,164,150,0.4);
        text-color:white;
        text-align: center;
        border:1px solid ;
        border-radius: 20px;
        box-shadow: 4px 4px 6px -2px white ;
        text-shadow: 0px 0px 4px grey;
        
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
        color:white;
        
        border-left:none;
        border-right:none;
        border-top:none;
        border-botton: 1px solid black;
        outline: 0;
        padding: 18px 15px;
    }
    .inputfield  input:hover{
    background-color: transparent;
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
      color:white;
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
background: url("https://en.free-wallpapers.su/data/media/2319/big/fd0244.jpg");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
.emp{
  height: 30px;
  width:30px;
  

}
   </style>
</head>
<body>
    <div class="bo">
    <%User user1=(User) session.getAttribute("user");%>
	    
     <center>
       <%  String msg=(String) request.getAttribute("msg") ;
       if(msg!=null){
       %>
        <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
        <%} %>
        </center>
        <div class="box" style="margin-top: 100px;margin-left: 80px;">
      <form action="registerstaff" method="post">
     <center>   <div class="emp">  <img alt="" src="https://cdn1.iconfinder.com/data/icons/tourism-travel-2-1/256/Waiter-1024.png" height="50px" width="50px" style="padding-top: 10px;"> </div><center>
        
            <h1 style="margin-top: 30px;">Add Employee</h1>          
                <div class="input">
                <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="u id" name="user_id">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="Name" name="user_name">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="phone" name="user_phone">
                    </div>
                    <div class="inputfield">
                        <i class="fa fa-key" aria-hidden="true"></i>
                        <input type="password" placeholder="Password" name="user_pass">
                    </div>  
                     
                                  
                </div>
              <center> <div class="but">
                    <input type="submit" value="REGISTER"/>
                    
                </div>
                
                 <div style="padding-top: 30px;"> <a href="managerview.jsp">Back</a> </div>
                </center>
                
            </form>
            </div>
       </div>   
</body>
</html>