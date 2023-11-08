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
@WebServlet("/update")
public class UpdateUser extends HttpServlet {

	UserDao dao=new UserDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("phone");
		long id1=Long.parseLong(id);
		User user=dao.getUserById(id1);
		
			req.setAttribute("u1", user);
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("updatepageuser.jsp");
			dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user=new User();
		user.setId(Integer.parseInt(req.getParameter("user_id")));
		user.setName(req.getParameter("user_name"));
		user.setPhone(Long.parseLong(req.getParameter("user_phone")));
		user.setPassword(req.getParameter("user_pass"));
		user.setRole(req.getParameter("user_role"));
		dao.updateUser(user);
		RequestDispatcher dispatcher=req.getRequestDispatcher("allstaff.jsp");
		req.setAttribute("msg", "Data Updated");
		dispatcher.forward(req, resp);
	}
}
