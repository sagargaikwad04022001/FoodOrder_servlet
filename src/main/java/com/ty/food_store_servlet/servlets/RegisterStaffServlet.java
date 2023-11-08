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
@WebServlet("/registerstaff")
public class RegisterStaffServlet extends HttpServlet {

	UserDao dao=new  UserDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("user_name");
		String phone=req.getParameter("user_phone");
		String pass=req.getParameter("user_pass");
		String uid=req.getParameter("user_id");
		
		
		User user=new User();
		user.setId(Integer.parseInt(uid));
		user.setName(name);
		user.setPhone(Long.parseLong(phone));
		user.setPassword(pass);
		user.setRole("Staff");
		dao.saveUser(user);
		RequestDispatcher dispatcher=req.getRequestDispatcher("managerview.jsp");
		req.setAttribute("msg", "Staff Added");
		dispatcher.forward(req, resp);
	}
}
