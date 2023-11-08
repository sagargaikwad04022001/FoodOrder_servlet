package com.ty.food_store_servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.food_store_servlet.dao.FoodProductsDao;
import com.ty.food_store_servlet.entity.FoodProduct;
import com.ty.food_store_servlet.entity.User;
@WebServlet("/updatefp")
public class UpdateFp extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		FoodProductsDao dao=new  FoodProductsDao();
		FoodProduct foodProduct=dao.getFoodProductById(Integer.parseInt(id));
		req.setAttribute("prod", foodProduct);
		RequestDispatcher dispatcher=req.getRequestDispatcher("updatefoodp.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("fp_name");
		String type=req.getParameter("fp_type");
		String avai=req.getParameter("fp_avai");
		double pri=Double.parseDouble(req.getParameter("fp_price"));
		String id=req.getParameter("fp_id");
		String about=req.getParameter("fp_about");
		FoodProductsDao dao=new FoodProductsDao();
		FoodProduct product=dao.getFoodProductById(Integer.parseInt(id));
		product.setName(name);
		product.setAbout(about);
		product.setAvailability(avai);
		product.setPrice(pri);
		product.setType(type);
		dao.updateFoodProduct(product);
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("menu.jsp");
		req.setAttribute("msg", "Food product updated");
		dispatcher.forward(req, resp);
		
	}
}
