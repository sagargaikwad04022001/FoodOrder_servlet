package com.ty.food_store_servlet.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name = "User_Details")
public class User {

	
	
	private int id;
	private String name;
	@Id
	@Column(unique = true,nullable = false)
	private long phone;
	private String password;
	private String role;
	
	@OneToOne(mappedBy = "user",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private Menu menu;
	
	@OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private List<Branch> branches;
	
	@OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST,CascadeType.MERGE})
	private List<FoodOrder> foodOrders;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long email) {
		this.phone = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<Branch> getBranches() {
		return branches;
	}

	public void setBranches(List<Branch> branches) {
		this.branches = branches;
	}

	public List<FoodOrder> getFoodOrders() {
		return foodOrders;
	}

	public void setFoodOrders(List<FoodOrder> foodOrders) {
		this.foodOrders = foodOrders;
	}
	
	
}
