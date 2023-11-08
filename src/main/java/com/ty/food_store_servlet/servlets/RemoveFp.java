package com.ty.food_store_servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.food_store_servlet.dao.FoodProductsDao;
@WebServlet("/deletefp")
public class RemoveFp extends HttpServlet {

	FoodProductsDao dao=new FoodProductsDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt((String)req.getParameter("id"));
		dao.deleteFoodO(id);
		req.setAttribute("msg", "Product  Deleted");
		RequestDispatcher dispatcher=req.getRequestDispatcher("menu.jsp");
		dispatcher.forward(req, resp); 
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
