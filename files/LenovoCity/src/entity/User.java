package entity;

import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

import dao.UserDAO;

public class User {
	int id;
	String name;
	String addr;
	String email;
	String phone;
	String userName;
	
	public String getPassWordByUserName(String userName) {
		return UserDAO.getPassWordByUserName(userName);
	}
	
	public int getKeys(String phone){
			return UserDAO.getKeys(phone);
			//return 123456;
	}
	
	public int getKeyByUserName(String userName) {
		return UserDAO.getKeyByUserName(userName);
	}
	
	public int getIdByUserName(String userName) {
		return UserDAO.getIdByUserName(userName);
	}
	
	public String getUserNameByUserId(int id) {
		return UserDAO.getUserNameByUserId(id);
	}
	
	public String getAlUserJsonString(int pageNumber, int pageSize) {
		return UserDAO.getAllUserJsonString(pageNumber, pageSize);
	}
	
	public String getUserJsonString(String userName) {
		return UserDAO.getUserJsonString(userName);
	}
	
	public String getUserJsonString(int id) {
		return UserDAO.getUserJsonString(id);
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String addUser(String userName, String passWord, String name, String email, String phone, String addr) {
		return UserDAO.addUserDAO(userName, passWord, name, email, phone, addr);
	}
	
	//username不能修改，它作为用户的账号。
	public Boolean updateUser(String userName, String passWord, String name, String email, String phone, String addr) {
		return UserDAO.updateUser(userName, passWord, name, email, phone, addr);
	}
	
	public boolean isExist(String userName) {
		return UserDAO.isExist(userName);
	}
	
	public Boolean deleteUserByUserName(String userName) {
		return UserDAO.deleteUserByUserName(userName);
	}
	
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
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getUserName() {
		return userName;
	}

}











