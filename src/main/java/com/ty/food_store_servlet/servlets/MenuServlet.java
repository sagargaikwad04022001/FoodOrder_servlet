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
@WebServlet("/addfproduct")
public class MenuServlet extends HttpServlet{

	FoodProductsDao dao=new FoodProductsDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("f_name");
		String phone=req.getParameter("f_type");
		String pass=req.getParameter("f_about");
		String role=req.getParameter("f_ava");
		String menu=req.getParameter("f_price");
		
		FoodProduct product=new FoodProduct();
		product.setName(name);
		product.setAbout(pass);
		product.setAvailability(role);
		product.setType(phone);
		product.setPrice(Long.parseLong(menu));
		dao.saveFoodProduct(product);
		RequestDispatcher dispatcher=req.getRequestDispatcher("menucreation.jsp");
		req.setAttribute("msg", "Food Product added");
		dispatcher.forward(req, resp);
	}
}
