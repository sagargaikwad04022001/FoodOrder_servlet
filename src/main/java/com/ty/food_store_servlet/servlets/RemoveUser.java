package com.ty.food_store_servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.food_store_servlet.dao.UserDao;
@WebServlet("/delete")
public class RemoveUser extends HttpServlet {

	UserDao dao=new UserDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long id=Long.parseLong((String)req.getParameter("phone"));
		dao.deleteUser(id);
		req.setAttribute("msg", "Staff Deleted");
		RequestDispatcher dispatcher=req.getRequestDispatcher("allstaff.jsp");
		dispatcher.forward(req, resp); 
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
