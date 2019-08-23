package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import entity.User;
import util.DB;

public class OrderDAO {

	public static int addOrderDAO(int userId, int computerId, String addr, String phone, int totalPrice,
			Boolean pay) {
		Connection connection = DB.getConn();
		String sql = "insert into orders values(null,?,?,?,?,?,?,?)";
		int id = 0;
		try {
			PreparedStatement preparedStatement = DB.getPreparedStmt(connection, sql);
			//PreparedStatement preparedStatement= connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, computerId);
			preparedStatement.setString(3, addr);
			preparedStatement.setString(4, phone);
			preparedStatement.setDate(5, new java.sql.Date(new Date().getTime()));
			preparedStatement.setInt(6, totalPrice);
			preparedStatement.setInt(7, (pay == true ? 1 : 0)); //1代表已经付款
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

	public static Boolean updateOrder(int id, int userId, int computerId, String addr, String phone,
			int totalPrice, Boolean pay) {
		
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "update orders set userid = " + userId + ", computerid = " + 
				27 + ", addr = '" + addr + "', phone = '" + phone + "',"
						+ "totalprice = " + totalPrice + ", pay = " + (pay == true ? 1 : 0) + " where userid = " + userId;
		
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
		
		return true;
	}

	public static boolean deleteOrderById(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "delete from orders where id = " + id;
		
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
		
		return true;
	}

	public static boolean isExist(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from orders where id=" + id;
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

	public static String getAllOrderJsonString(int pageNumber, int pageSize) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from orders";
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		int count = 0;
		try {
			while(resultSet.next()) {
				//jsonObject = new JSONObject();
				//jsonObject.putOnce("id", resultSet.getInt("id"));
				//jsonObject.putOnce("userId", resultSet.getInt("userId"));
				//jsonObject.putOnce("computerId", resultSet.getInt("computerId"));
				//jsonObject.putOnce("addr", resultSet.getString("addr"));
				//jsonObject.putOnce("phone", resultSet.getString("phone"));
				//jsonObject.putOnce("date", resultSet.getDate("date"));
				//jsonObject.putOnce("totalPrice", resultSet.getInt("totalPrice"));
				//jsonObject.putOnce("pay", (resultSet.getInt("pay") == 1 ? "已付款" : "未付款"));
				//jsonArray.put(jsonObject);
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql += " limit " + pageNumber*pageSize + "," + pageSize;
		resultSet = DB.getRes(statement, sql);
		try {
			while(resultSet.next()) {
				jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("userId", resultSet.getInt("userId"));
				jsonObject.putOnce("computerId", resultSet.getInt("computerId"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("date", resultSet.getDate("date"));
				jsonObject.putOnce("totalPrice", resultSet.getInt("totalPrice"));
				jsonObject.putOnce("pay", (resultSet.getInt("pay") == 1 ? "已付款" : "未付款"));
				jsonArray.put(jsonObject);
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		jsonObject = new JSONObject();
		try {
			jsonObject.putOnce("pageNumber", pageNumber);
			jsonObject.putOnce("pageSize", pageSize);
			jsonObject.putOnce("rows", jsonArray);
			jsonObject.putOnce("total", count);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonObject.toString();
	}

	public static String getOrderByIdDAO(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from orders where id = " + id;
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONObject jsonObject = null;
		try {
			while(resultSet.next()) {
				jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("userId", resultSet.getInt("userid"));
				jsonObject.putOnce("computerId", resultSet.getInt("computerId"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("date", resultSet.getDate("date"));
				jsonObject.putOnce("totalPrice", resultSet.getInt("totalprice"));
				jsonObject.putOnce("pay", resultSet.getInt("pay"));
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonObject.toString();
	}

	public static String getOrderByUserIdDAO(int userId) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from orders where userid = " + userId;
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONArray jsonArray = new JSONArray();
		try {
			while(resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("userId", resultSet.getInt("userid"));
				jsonObject.putOnce("computerId", resultSet.getInt("computerId"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("date", resultSet.getDate("date"));
				jsonObject.putOnce("totalPrice", resultSet.getInt("totalprice"));
				jsonObject.putOnce("pay", resultSet.getInt("pay"));
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

	public static String getOrderByUserNameDAO(String userName, int pageNumber, int pageSize) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		int userId = new User().getIdByUserName(userName);
		String sql = "select * from orders where userid = " + userId;
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONArray jsonArray = new JSONArray();
		int count = 0;
		try {
			while(resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("userId", resultSet.getInt("userid"));
				jsonObject.putOnce("computerId", resultSet.getInt("computerId"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("date", resultSet.getDate("date"));
				jsonObject.putOnce("totalPrice", resultSet.getInt("totalprice"));
				jsonObject.putOnce("pay", resultSet.getInt("pay"));
				jsonArray.put(jsonObject);
				count++;
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.putOnce("pageNumber", pageNumber);
			jsonObject.putOnce("pageSize", pageSize);
			jsonObject.putOnce("rows", jsonArray);
			jsonObject.putOnce("total", count);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonObject.toString();
	}
}























