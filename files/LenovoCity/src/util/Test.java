package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;


import entity.Cart;
import entity.Computer;
import entity.Order;
import entity.Role;
import entity.User;

public class Test {
	void test() {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user";
		ResultSet resultSet = DB.getRes(statement, sql);
		try {
			while(resultSet.next()) {
				System.out.println(resultSet.getString("username"));
				System.out.println(resultSet.getString("phone"));
				System.out.println(resultSet.getString("addr"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
	/*	List<String> paths = new ArrayList<String>();
		paths.add("fsf/fsd/fds");
		paths.add("fsf/fsd/fds2");
		paths.add("fsf/fsd/fds3");
		new Computer().addComputer("lenovo5", 4000, "i7", 2, 1000, 1, 14, new Date(), paths);*/
		/*List<Computer> computers = new Computer().findComputer("lenovo1", 1);
		for(int i = 0; i < computers.size(); i++) {
			Computer computer = computers.get(i);
			System.out.println(computer.getName() + " " + computer.getCpu());
		}*/
		//new Computer().updateComputer(10, "lenovo1", 3300, "i4", 2, 1000, 1, 14);
		
		//new User().updateUser("1132", "123321", "ning", "321@com", "123", "qingdao");
		
		/*int id = new Order().addOrder(7, 12, "qingdao", "123", new Date(), 3000, true);
		System.out.println(id);*/
		//new Order().updateOrder(2, 7, 12, "qingdao", "321", new Date(), 3500, false);
		//new Computer().deleteComputerById(11);
		//new User().deleteUserByUserName("1134");
		//new Order().deleteOrderById(3);
	/*	List<Computer> computers = new Computer().findComputer("lenovo5");
		for(int i = 0; i < computers.size(); i++) {
			Computer computer = computers.get(i);
			System.out.println(computer.getName());
			List<String> imagePaths = computer.getImagePaths();
			for(int j = 0; j < imagePaths.size(); j++) {
				System.out.println(imagePaths.get(j));
			}
		}*/
		//new Cart().addCart(6, 12, 1, 3000);
	/*	Cart cart = new Cart().findCartById(6);
		System.out.println(cart.getComputerId());
		System.out.println(cart.getCount());*/
		//new Cart().deleteCartById(6);
/*		String jsonString = new Computer().getComputerJsonString();
		System.out.println(jsonString);*/
/*		String jsonString = new User().getUserJsonString();
		System.out.println(jsonString);*/
	/*	String jsonString = new User().getUserJsonString("1132");
		System.out.println(jsonString);*/
		
	/*	String string = new Computer().findComputer("", -1, -1, -1, -1, -1);
		System.out.println(string);*/
	/*	String jsonString = new User().getUserJsonString("1132");
		System.out.println(jsonString);*/
		
		/*String string = new Order().getAllOrderJsonString(1, 10);
		System.out.println(string);*/
		/*String string = new Order().getOrderByUserId(5);
		System.out.println(string);*/
		/*String string = new User().getAlUserJsonString(1, 10);
		System.out.println(string);*/
		/*String string = new Computer().getAllComputerJsonString(1, 10);
		System.out.println(string);*/
	/*	String string = new Computer().findComputer("lenovo1");
		System.out.println(string);*/
	/*	String string = new Role().addManager("1135", "123");
		System.out.println(string);*/
	/*	int id = new User().getIdByUserName("1132");
		System.out.println(id);
		String userName = new User().getUserNameByUserId(5);
		System.out.println(userName);*/
	/*	String string = new Order().getOrderByUserName("1132", 1, 10);
		System.out.println(string);*/
		//System.out.println(new Cart().isExist(1, 2));
		//System.out.println(new Computer().getComputerNameById(10));
		//System.out.println(new Computer().getOneImageByComputerId(10));
	/*	List<Cart> carts = new Cart().getCartByUserId(5);
		for(int i = 0; i < carts.size(); i++) {
			System.out.println(carts.get(i).getComputerName());
			System.out.println(carts.get(i).getImagePath());
		}*/
		//System.out.println(new Order().getOrderById(5, 11));
		//new Cart().addCountToExistCart(2, 2, 3);
		//System.out.println(new Computer().findComputer("lenovo1", 1));
		//System.out.println(new Cart().getCartByUserId(5));
		//System.out.println(new Computer().findComputer("lenovo1"));
		//System.out.println(new User().getKeys("15954096931"));
		//new User().getKeyByUserName("1132");
		//System.out.println(new User().getPassWordByUserName("1132"));
		//System.out.println(new Computer().getIdByAllParameters("lenovo1", 2, 1000, "i4"));
	}
}















