package com.ty.food_store_servlet.servlets;

import java.io.IOException;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.ty.food_store_servlet.dao.MenuDao;
import com.ty.food_store_servlet.dao.UserDao;
import com.ty.food_store_servlet.entity.Menu;
import com.ty.food_store_servlet.entity.User;

@WebServlet("/registermanager")
public class RegisterServlet extends HttpServlet {

	UserDao dao=new UserDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("user_name");
		String phone=req.getParameter("user_phone");
		String pass=req.getParameter("user_pass");
		String role=req.getParameter("user_role");
		String menu=req.getParameter("user_menu");
		
		if(role.equals("Manager"))
		{
			List<User> users=dao.getAllUsers();
			if(users==null)
			{
				User user=new User();		
				user.setName(name);
				user.setPhone(Long.parseLong(phone));
				user.setPassword(pass);
				user.setRole(role);
				Menu menu1=new Menu();
				MenuDao dao1=new MenuDao();
				dao1.saveMenu(menu1);
				user.setMenu(menu1);
				
				dao.saveUser(user);
				menu1.setUser(user);
				dao1.updateMenu(menu1);
				RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
				req.setAttribute("msg", "Manager registered login now");
				dispatcher.forward(req, resp);
				
			}else {
				for(User user:users)
				{
					if(user.getRole().equals(role))
					{
						RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
						req.setAttribute("msg", "Manager already exist");
						dispatcher.forward(req, resp);
					}
				}
			}
		}
		
		
	}
	
}
