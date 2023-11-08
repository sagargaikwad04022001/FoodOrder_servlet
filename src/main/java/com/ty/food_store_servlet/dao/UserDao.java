package com.ty.food_store_servlet.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;



import com.ty.food_store_servlet.entity.FoodOrder;
import com.ty.food_store_servlet.entity.Item;
import com.ty.food_store_servlet.entity.User;



public class UserDao {

	static EntityManagerFactory factory = Persistence.createEntityManagerFactory("servlet");
	static EntityManager manager = factory.createEntityManager();
	static EntityTransaction transaction = manager.getTransaction();

	public User saveUser(User user) {
		if(!transaction.isActive())
		{
		transaction.begin();
		}
		manager.persist(user);
		transaction.commit();
		return user;
	}
	

	public User getUserById(long phone) {
		User user = manager.find(User.class, phone);
		if (user != null) {
			return user;
		}
		return null;
	}

	public User updateUser(User user) {
		transaction.begin();
		
		manager.merge(user);
		transaction.commit();
		return user;
	}

	public boolean deleteUser(long id) {
		User user = manager.find(User.class, id);
		transaction.begin();
		if (user != null) {
			manager.remove(user);
			transaction.commit();
			return true;
		}
		transaction.commit();
		return false;
	}

	public List<User> getAllUsers() {
		String jpql = "from User ";
		Query query = manager.createQuery(jpql);
		List<User> aList = query.getResultList();
		if (aList.size() > 0) {
			return aList;
		}
		return null;
	}

	public void removeUser(User user2) {
		transaction.begin();
		List<FoodOrder> flist = user2.getFoodOrders();

		if (flist != null && flist.size() > 0) {
			for (FoodOrder foodOrder : flist) {
				List<Item> items=foodOrder.getItems();
				for (Item item : items) {
					manager.remove(item);
				}
				manager.remove(foodOrder);
			}
		}
		manager.remove(user2);
		transaction.commit();

	}

	public List<User> getAllCustomers() {
		String jpql="from User where role='Customer'";
		Query query=manager.createQuery(jpql);
		List<User> users=query.getResultList();
		return users;
	}

	public List<User> getAllStaff() {
		String jpql="from User where role='Staff'";
		Query query=manager.createQuery(jpql);
		List<User> users=query.getResultList();
		return users;
	}
}
