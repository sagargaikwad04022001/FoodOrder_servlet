package com.ty.food_store_servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.food_store_servlet.dao.BranchDao;
import com.ty.food_store_servlet.entity.Branch;
import com.ty.food_store_servlet.entity.User;
@WebServlet("/registerbranch")
public class BranchServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BranchDao dao=new BranchDao();
		String name=req.getParameter("b_name");
		String phone=req.getParameter("b_phone");
		long p=Long.parseLong(phone);
		String address=req.getParameter("b_address");
		String email=req.getParameter("b_email");
		
		Branch branch=new Branch();
		branch.setAddress(address);
		branch.setName(name);
		branch.setEmail(email);
		branch.setPhoneNumber(p);
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		branch.setUser(user);
		dao.saveBranch(branch);
		RequestDispatcher dispatcher=req.getRequestDispatcher("managerview.jsp");
		req.setAttribute("msg", "Branch Registered");
		dispatcher.forward(req, resp);
	}
}
