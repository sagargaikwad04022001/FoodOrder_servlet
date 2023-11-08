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
   * {
            box-sizing: border-box;
        }

        
         
           
        

        #page {
            margin-left:80px;
            height: 400px;
            width: 300px;
            border: 1px solid;
            /* margin-left: 250px; */
            margin-top: 170px;
            border-radius: 20px;
             background-color:transparent;
        text-color:white;
        text-align: center;
        border:1px solid red;
        border-radius: 20px;
        box-shadow: 4px 4px 6px grey ;
        text-shadow: 2px 2px 4px grey;
        }

      

        .b {
            margin: 30px 10px 30px 45px;
            display: flex;
        }

        input {
            background-color: transparent;
            border: none;
            outline: none;
            border-bottom: 1px solid;

        }

        #login {
            border: 1px solid;
            width: 60px;
            border-radius: 20px;
            background-color: transparent;
            margin-left: 120px;
            margin-top: 15px;
        }
        a{
            height: 70px;
            width: 70px;
            
            display: inline-block;
            
            margin-top: 60px;
            margin-left: 25px;
            text-decoration: none;
            font-size: 40px;
        }
        #us{
            padding-left: 6px;
        }
        body{
        height:500px;
width:100%;
background: url("https://wallpapertag.com/wallpaper/full/4/d/7/317105-gorgerous-food-background-2990x1918-for-mobile-hd.jpg");

background-position: center;
background-size: cover;
background-repeat: no-repeat;
        }
        /* Default button styles */


/* Button hover effect */
.abc:hover {
    scale:1.4;
}
        
</style>
</head>
<body>
<center>
       <%  String msg=(String) request.getAttribute("msg") ;
       if(msg!=null){
       %>
         <div style="background-color: #F5E8B7;padding-top:50px; box-shadow:3px 3px 4px white; border-radius:25px;color: white;height: 50px;width:300px;font-size: 25px; font-family: Roboto,Arial, sans-serif;padding-top: 20px;"> <%=msg %> </div>
        <%} %>
        </center>
     <div class="a">
     
      <form action="login" method="get"> 
    <div class="container" >
        <div id="page" style="padding-top: 50px;">
        <div> <h1>Login</h1> </div>
            <div id="phone" class="b">    
                 <div style="padding-right: 10px;"><i class="fa-solid fa-mobile-screen"></i></div>          
                <input type="text" size="20px" name="user_phone" placeholder="phone">
            </div>
            <div id="pass" class="b">
             <div style="padding-right: 8px;"><i class="fa fa-key" aria-hidden="true"></i></div>
                <input type="password" size="20px" name="user_pass" placeholder="password">
            </div>
            
           <input class="abc" style="margin-right: 120px;background-color:#2874f0; color:white ;" id="login" type="submit" value="Login"> 
            
        </div>
        <div style=" margin-top: 25px;margin-left: 135px;">
            <a href="welcome.jsp" style="color:#2874f0;text-decoration: none;">Home</a>
         </div>
    </div>
    </form>
     </div>
</body>
</html>