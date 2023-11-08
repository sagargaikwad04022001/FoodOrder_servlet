package com.ty.food_store_servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.food_store_servlet.dao.UserDao;
import com.ty.food_store_servlet.entity.User;

@WebServlet("/registercustomer")
public class CustomerRegister extends HttpServlet {

	UserDao dao=new UserDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("user_name");
		String phone=req.getParameter("user_phone");
		String pass=req.getParameter("user_pass");
		String id1=req.getParameter("user_id");
		
		
		User user=new User();		
		user.setName(name);
		user.setPhone(Long.parseLong(phone));
		user.setPassword(pass);
		user.setRole("Customer");
		user.setId(Integer.parseInt(id1));
		dao.saveUser(user);
		RequestDispatcher dispatcher=req.getRequestDispatcher("staffview.jsp");
		req.setAttribute("msg", "Customer Added");
		dispatcher.forward(req, resp);
	}
}
