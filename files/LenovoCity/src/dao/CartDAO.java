package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import entity.Cart;
import entity.Computer;
import util.DB;

public class CartDAO {

	public static int addCart(int userId, int computerId, int count, int totalPrice) {
		Connection connection = DB.getConn();
		String sql = "insert into cart values(null,?,?,?,?)";
		int id = -1;
		try {
			PreparedStatement preparedStatement= connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, computerId);
			preparedStatement.setInt(3, count);
			preparedStatement.setInt(4, totalPrice);
			preparedStatement.executeUpdate();
			
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			resultSet.next();
			id = resultSet.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(connection);
		
		return id;
	}

	public static Cart findCartByIdDAO(int id) {
		Cart cart = new Cart();
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from cart where id = " + id;
		ResultSet resultSet = DB.getRes(statement, sql);
		
		try {
			while(resultSet.next()) {
				int userId = resultSet.getInt("userid");
				int computerId = resultSet.getInt("computerid");
				int count = resultSet.getInt("count");
				int totalPrice = resultSet.getInt("totalprice");
				cart.setComputerId(computerId);
				cart.setCount(count);
				cart.setTotalPrice(totalPrice);
				cart.setId(id);
				cart.setUserId(userId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return cart;
	}

	public static void deleteCartById(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "delete from cart where id = " + id;
		
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
	}
	
	public static void deleteCartByUserId(int userId) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "delete from cart where userid = " + userId;
		
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
	}

	public static boolean isExist(int computerId, int userId) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from cart where userid = " + userId + " and computerid = " + computerId;
		ResultSet resultSet = DB.getRes(statement, sql);
		
		try {
			if(resultSet.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return false;
	}

	public static String getCartByUserId(int userId) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from cart where userid = " + userId;
		ResultSet resultSet = DB.getRes(statement, sql);
		List<Cart> carts = new ArrayList<Cart>();
		JSONArray jsonArray = new JSONArray();
		try {
			while(resultSet.next()) {
				int computerId = resultSet.getInt("computerid");	
				JSONObject jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("computerid", computerId);
				jsonObject.putOnce("imagePath", new Computer().getOneImageByComputerId(computerId));
				jsonObject.putOnce("computerName", new Computer().getComputerNameById(computerId));
				jsonObject.putOnce("count", resultSet.getInt("count"));
				jsonObject.putOnce("totalPrice", resultSet.getInt("totalprice"));
				jsonArray.put(jsonObject);
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonArray.toString();
	}

	public static void addCountToExistCartDAO(int userId,int computerId, int count) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "update cart set count = " + count + " where userid = "
				+ userId + " and computerid = " + computerId;
		//String sql = "update cart set count = " + count +" where id = " + id;
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
	}

}














