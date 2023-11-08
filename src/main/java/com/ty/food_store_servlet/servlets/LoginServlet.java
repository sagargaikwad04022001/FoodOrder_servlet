package com.ty.food_store_servlet.servlets;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.food_store_servlet.entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EntityManagerFactory factory=Persistence.createEntityManagerFactory("servlet");
		EntityManager manager=factory.createEntityManager();
		long email=Long.parseLong(req.getParameter("user_phone"));
		String pass=req.getParameter("user_pass");
		Query query=manager.createQuery("select u from User u where u.phone=:em and u.password=:pa");
		query.setParameter("em", email);
		query.setParameter("pa", pass);
		List<User> users=query.getResultList();
		if(users!=null && users.size()>0)
		{
			
			User user=users.get(0);
			if(user.getRole().equals("Manager"))
			{
				RequestDispatcher dispatcher=req.getRequestDispatcher("managerview.jsp");
				req.setAttribute("msg", "Login successfull!");
				HttpSession session=req.getSession();
				session.setAttribute("user", user);
				System.out.println(user.getId());
				dispatcher.forward(req, resp);
			}else if(user.getRole().equals("Staff")) {
				RequestDispatcher dispatcher=req.getRequestDispatcher("staffview.jsp");
				req.setAttribute("msg", "Login successfull!");
				HttpSession session=req.getSession();
				session.setAttribute("user", user);
				req.setAttribute("user", user);
				dispatcher.forward(req, resp);
			}else {
				RequestDispatcher dispatcher=req.getRequestDispatcher("customerview.jsp");
				req.setAttribute("msg", "Login successfull!");
				HttpSession session=req.getSession();
				session.setAttribute("user", user);
				req.setAttribute("user", user);
				dispatcher.forward(req, resp);
			}
			
		}else {
			RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
			req.setAttribute("msg", "Invalid Credentials!!");
			dispatcher.forward(req, resp);
		}
	}
}
