package com.ty.food_store_servlet.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.food_store_servlet.dao.FoodOrderDao;
import com.ty.food_store_servlet.entity.FoodOrder;
@WebServlet("/updatestatus")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		FoodOrderDao dao=new FoodOrderDao();
		FoodOrder foodOrder=dao.getFoodOrderById(Integer.parseInt(id));
		foodOrder.setStatus("delivered");
		dao.updateFoodOrder(foodOrder);
		RequestDispatcher dispatcher=req.getRequestDispatcher("foodorders.jsp");
		req.setAttribute("msg","Order updated");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
