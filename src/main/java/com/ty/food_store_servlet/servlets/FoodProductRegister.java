package com.ty.food_store_servlet.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.food_store_servlet.dao.FoodProductsDao;
import com.ty.food_store_servlet.dao.MenuDao;
import com.ty.food_store_servlet.dao.UserDao;
import com.ty.food_store_servlet.entity.FoodProduct;
import com.ty.food_store_servlet.entity.Menu;
import com.ty.food_store_servlet.entity.User;
@WebServlet("/registerfp")
public class FoodProductRegister extends HttpServlet {

	UserDao dao2=new UserDao();
	FoodProductsDao dao=new FoodProductsDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("came");
		
		String name=req.getParameter("f_name");
		String type=req.getParameter("f_type");
		String avai=req.getParameter("f_avai");
		double pri=Double.parseDouble(req.getParameter("f_price"));
		String uid=req.getParameter("user_id");
		String about=req.getParameter("f_about");
		User user=dao2.getUserById(Integer.parseInt(uid));
		
		System.out.println(user == null);
		MenuDao dao3=new MenuDao();
		List<Menu> menus=dao3.getAllMenu();
		
		
			Menu menu=menus.get(0);
			List<FoodProduct> fp=menu.getFoodProducts();
			FoodProduct foodProduct=new FoodProduct();
			foodProduct.setName(name);
			foodProduct.setType(type);
			foodProduct.setAvailability(avai);
			foodProduct.setPrice(pri);
			foodProduct.setMenu(menu);
			foodProduct.setAbout(about);
			dao.saveFoodProduct(foodProduct);
			if(fp!=null)
			{
			fp.add(foodProduct);
			}else {
				fp=new ArrayList<>();
				fp.add(foodProduct);
			}
			
			menu.setFoodProducts(fp);
			dao3.updateMenu(menu);
			RequestDispatcher dispatcher=req.getRequestDispatcher("menucreation.jsp");
			req.setAttribute("msg", "Food Product added in menu");
			dispatcher.forward(req, resp);	
		
		
		
	}
}
