package com.ty.food_store_servlet.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ty.food_store_servlet.dao.FoodProductsDao;
import com.ty.food_store_servlet.entity.FoodProduct;
import com.ty.food_store_servlet.entity.Item;
@WebServlet("/additem")
public class AddItem extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		FoodProductsDao fpd = new FoodProductsDao();
		FoodProduct fp = fpd.getFoodProductById(Integer.parseInt(req.getParameter("f_id")));
		
		
		Item item = new Item();
		item.setName(fp.getName());
		List<Item> ili = (List<Item>) session.getAttribute("itemlist");
		ili.add(item);
		req.getSession().setAttribute("itemlist", ili);
		
	}
	
	
}
