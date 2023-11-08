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

import com.ty.food_store_servlet.dao.FoodOrderDao;
import com.ty.food_store_servlet.dao.FoodProductsDao;
import com.ty.food_store_servlet.dao.ItemDao;
import com.ty.food_store_servlet.dao.UserDao;
import com.ty.food_store_servlet.entity.FoodOrder;
import com.ty.food_store_servlet.entity.FoodProduct;
import com.ty.food_store_servlet.entity.Item;
import com.ty.food_store_servlet.entity.User;
@WebServlet("/forderservlet")
public class FoodOrderServlet extends HttpServlet {

	UserDao dao2=new UserDao();
	ItemDao itemDao=new ItemDao();
	FoodOrderDao dao=new FoodOrderDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("c_phone");
		long phone=Long.parseLong(id);
		User user=dao2.getUserById(phone);
		if(user!=null)
		{
			req.setAttribute("u1", user);
			RequestDispatcher dispatcher=req.getRequestDispatcher("foodoregister.jsp");
			dispatcher.forward(req, resp);
		}else {
			req.setAttribute("msg", "Customer Not Exist create customer first");
			RequestDispatcher dispatcher=req.getRequestDispatcher("customerregister.jsp");
			dispatcher.forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FoodProductsDao dao=new FoodProductsDao();
		FoodOrderDao foodOrderDao=new FoodOrderDao();
		UserDao userDao=new UserDao();
		
		String productid =req.getParameter("prod_id");		
		String quan=req.getParameter("prod_quantity");
		
		String uphone=req.getParameter("user_phone");
		long pho=Long.parseLong(uphone);
		
		User user=userDao.getUserById(pho);
		if(user==null)
		{
			RequestDispatcher dispatcher=req.getRequestDispatcher("customerregister.jsp");
			req.setAttribute("msg", "Customer not exist ");
			
			dispatcher.forward(req, resp);
		}
		
		int q=Integer.parseInt(quan);
		int id=Integer.parseInt(productid);
		FoodProduct foodProduct=dao.getFoodProductById(id);
		if(foodProduct==null)
		{
			req.setAttribute("msg", "Food product not available");
			RequestDispatcher dispatcher=req.getRequestDispatcher("foodoregister.jsp");
			dispatcher.forward(req, resp);
		}
		double totalprice=foodProduct.getPrice()*q;	
		Item item=new Item();
		item.setProductId(Integer.parseInt(productid));
		item.setName(foodProduct.getName());
		item.setType(foodProduct.getType());
		item.setQuantity(Integer.parseInt(quan));
		item.setPrice(foodProduct.getPrice());
		itemDao.saveItem(item);
	    
		List<Item> items=new ArrayList<>();
		items.add(item);
		FoodOrder order=new FoodOrder();
		order.setCustomerName(user.getName());
		order.setContactNumber(user.getPhone());
		order.setStatus("requested");
		order.setTotalPrice(totalprice);
		order.setUser(user);
		order.setItems(items);
		foodOrderDao.saveFoodOrder(order);
		RequestDispatcher dispatcher=req.getRequestDispatcher("staffview.jsp");
		req.setAttribute("msg", "Food order registered ");
		req.setAttribute("order", order);
		dispatcher.forward(req, resp);
		
		
		
		
		//
		
	
		
	}
}
