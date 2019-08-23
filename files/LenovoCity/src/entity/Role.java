package entity;

import dao.RoleDAO;

public class Role {
	int id;
	String userName;
	String passwd;
	int type;
	
	public String userLog(String userName, String passWord) {
		return RoleDAO.userLog(userName, passWord);
	}
	
	public String addManager(String userName, String passWord) {
		return RoleDAO.addManager(userName, passWord);
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public int getType() {
		return type;
	}
	
	public void setType(int type) {
		this.type = type;
	}
	
}
