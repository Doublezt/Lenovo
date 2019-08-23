package entity;

import java.util.Date;

import dao.OrderDAO;

public class Order {
	int id;
	int userId;
	int computerId;
	String addr;
	String phone;
	Date date;
	int totalPrice;
	Boolean pay;
	
	/*public String getOrderById(int userId, int computerId) {
		return OrderDAO.getOrderByIdDAO(userId, computerId);
	}*/
	
	  public String getOrderById(int id) {
		return OrderDAO.getOrderByIdDAO(id);
	}
	
	
	public String getOrderByUserId(int userId) {
		return OrderDAO.getOrderByUserIdDAO(userId);
	}
	
	public String getOrderByUserName(String userName, int pageNumber, int pageSize) {
		return OrderDAO.getOrderByUserNameDAO(userName, pageNumber, pageSize);
	}
	
	public String getAllOrderJsonString(int pageNumber, int pageSize) {
		return OrderDAO.getAllOrderJsonString(pageNumber, pageSize);
	}
	
	public int addOrder(int userId, int computerId, String addr, String phone, int totalPrice, Boolean pay) {
		return OrderDAO.addOrderDAO(userId, computerId, addr, phone, totalPrice, pay);
	}
	
	public Boolean updateOrder(int id, int userId, int computerId, String addr, String phone, int totalPrice, Boolean pay) {
		return OrderDAO.updateOrder(id, userId, computerId, addr, phone, totalPrice, pay);
	}
	
	public boolean deleteOrderById(int id) {
		return OrderDAO.deleteOrderById(id);
	}
	
	public boolean isExist(int id) {
		return OrderDAO.isExist(id);
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
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public Boolean getPay() {
		return pay;
	}
	
	public void setPay(Boolean pay) {
		this.pay = pay;
	}
	
}
