<%@page import="com.ty.food_store_servlet.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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
        height:350px;
        max-width: 350px;
        margin-left:200px;
        margin-top:400px;
      
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
        color:white;
        
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
.inputfield  input:hover{
  border-radius: 28px;
}

body{
height:600px;
width:100%;
background: url("https://en.free-wallpapers.su/data/media/2319/big/fd0244.jpg");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
}
   
</style>
</head>
<body>
 <%
    User u=(User) session.getAttribute("user");
    if(u==null)
    {
    	RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
    	request.setAttribute("msg", "Login to access this field");
    	dispatcher.forward(request, response);
    }  
    %>
           <center>
       <%  String msg=(String) request.getAttribute("msg") ;
           User user3=(User)request.getAttribute("u1");
       if(msg!=null){
       %>
         <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
        <%} %>
        </center>
        <div class="ab">
        <div class="abc">
             <form action="forderservlet" method="post">
        <div class="box">
            <h1>Create Food Order</h1>          
                <div class="input">
                
                    <div class="inputfield">
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input type="text" placeholder="user phone" name="user_phone" required="required">
                    </div>
                     
                    <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="product id" name="prod_id">
                    </div>
                     <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="product quantity" name="prod_quantity"   >
                    </div> 
                    
                   <center> <div class="but">
                    <a href="forderservlet"><input type="submit" value="Register"/></a>
                    
                </div>
                </center>
                 </div>   
                 </div>
                 </form>
                 </div>
                 </div>
</body>
</html>