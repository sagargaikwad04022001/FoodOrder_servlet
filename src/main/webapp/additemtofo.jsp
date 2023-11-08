<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
              <form action="forderservlet" method="post">
        <div class="box">
            <h1>Create Food Order</h1>          
                <div class="input">
                
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
                     <div class="inputfield">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>
                        <input type="text" placeholder="product quantity" name="prod_quantity"   >
                    </div> 
                    <div class="but">
                    <a href="additemtofo">Add another item</a>
                    
                </div>
                    <div class="but">
                    <a href="forderservlet"><input type="submit" value="Register"/></a>
                    
                </div>
                 </div>   
                 </div>
                 </form>
</body>
</html>