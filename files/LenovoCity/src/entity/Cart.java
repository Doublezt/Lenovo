package entity;

import java.util.List;

import dao.CartDAO;

public class Cart {
	int id;
	int userId;
	int computerId;
	int count;
	int totalPrice;
	
	//ÐÂÌí¼Ó
	String imagePath;
	String computerName;
	
	public void addCountToExistCart(int userId,int computerId, int count) {
		CartDAO.addCountToExistCartDAO(userId, computerId, count);
	}
	
	public String getCartByUserId(int userId) {
		return CartDAO.getCartByUserId(userId);
	}
	
	public boolean isExist(int computerId, int userId) {
		return CartDAO.isExist(computerId, userId);
	}
	
	public int addCart(int userId, int computerId, int count, int totalPrice) {
		return CartDAO.addCart(userId, computerId, count, totalPrice);
	}
	
	public Cart findCartById(int id) {
		return CartDAO.findCartByIdDAO(id);
	}
	
	public void deleteCartById(int id) {
		CartDAO.deleteCartById(id);
	}
	
	public void deleteCartByUserId(int userid) {
		CartDAO.deleteCartByUserId(userid);
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getComputerId() {
		return computerId;
	}
	
	public void setComputerId(int computerId) {
		this.computerId = computerId;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getComputerName() {
		return computerName;
	}

	public void setComputerName(String computerName) {
		this.computerName = computerName;
	}
	
	
}
