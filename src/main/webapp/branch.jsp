<%@page import="java.util.List"%>
<%@page import="com.ty.food_store_servlet.entity.Branch"%>
<%@page import="com.ty.food_store_servlet.dao.BranchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%   
BranchDao dao=new BranchDao();
List<Branch> br=dao.getAllBranches();
Branch branch=br.get(0);
%>
         
         <table border="1px solid black">
         
         <tr>
            <th>Name</th>
             <th>Address</th>
              <th>Contact</th>
               <th>Email</th>
         </tr>
          <tr>
            <td><%=branch.getName() %></td>
             <td><%=branch.getAddress() %></td>
              <td><%=branch.getPhoneNumber() %></td>
               <td><%=branch.getEmail() %></td>
         </tr>
            
         </table>
         <a href="managerview.jsp">Back</a>
</body>
</html>