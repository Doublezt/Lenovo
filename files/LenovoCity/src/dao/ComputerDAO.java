package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import entity.Computer;
import util.DB;

public class ComputerDAO {

	public static Boolean addComputerDAO(String name, int price, String cpu, int memory, int hardDisk, int type,
			int size) {
		Connection connection = DB.getConn();
		String sql = "insert into computer values(null,?,?,?,?,?,?,?,?,0)"; //0 代表未删除
		PreparedStatement preparedStatement = DB.getPreparedStmt(connection, sql);
		
		try {
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, price);
			preparedStatement.setString(3, cpu);
			preparedStatement.setInt(4, memory);
			preparedStatement.setInt(5, hardDisk);
			preparedStatement.setInt(6, type);
			preparedStatement.setInt(7, size);
			preparedStatement.setDate(8, new java.sql.Date(new Date().getTime()));
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(preparedStatement);
		DB.close(connection);
		
		return true;
	}

	public static String findComputerDAO(String name) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where computer.name='" + name + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONArray jsonArray = new JSONArray();
		try {
			while(resultSet.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("cpu", resultSet.getString("cpu"));
				jsonObject.putOnce("hardDisk", resultSet.getInt("harddisk"));
				jsonObject.putOnce("launchDate", resultSet.getDate("launchdate"));
				jsonObject.putOnce("memory", resultSet.getInt("memory"));
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("price", resultSet.getInt("price"));
				jsonObject.putOnce("size", (resultSet.getInt("size")));
				jsonObject.putOnce("type", (resultSet.getInt("type")));
				jsonObject.putOnce("totalPicture", new Computer().getImagePaths(resultSet.getString("name")));
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

	public static List<Computer> findComputerDAO(int type) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where type=" + type;
		ResultSet resultSet = DB.getRes(statement, sql);
		List<Computer> computers = new ArrayList<Computer>();
		try {
			while(resultSet.next()) {
				Computer computer = new Computer();
				computer.setId(resultSet.getInt("id"));
				computer.setCpu(resultSet.getString("cpu"));
				computer.setHardDisk(resultSet.getInt("harddisk"));
				computer.setLaunchDate(resultSet.getDate("launchdate"));
				computer.setMemory(resultSet.getInt("memory"));
				computer.setName(resultSet.getString("name"));
				computer.setPrice(resultSet.getInt("price"));
				computer.setType(resultSet.getInt("type"));
				getImagesToComputer(computer);
				computers.add(computer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return computers;
	}
	
	public static void getImagesToComputer(Computer computer) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from images where name = '" + computer.getName() + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		
		try {
			while(resultSet.next()) {
				computer.addImagePath(resultSet.getString("path"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
	}
	
	public static String findComputerDAO(String name, int type) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where 1=1";
		if(type == 1 || type == 2){
			sql +=" and type="+type;
		}
		if(name == null || name.equals("")|| name =="null"){
			;
		}else{
			sql += " and name='" + name +"'";
		}
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONArray jsonArray = new JSONArray();
		Map<String, String> nameMap = new HashMap<>();
		try {
			while(resultSet.next()) {
				if(nameMap.containsKey(resultSet.getString("name"))) {
					continue;
				} else {
					nameMap.put(resultSet.getString("name"), "1");
				}
				JSONObject jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("cpu", resultSet.getString("cpu"));
				jsonObject.putOnce("hardDisk", resultSet.getInt("harddisk"));
				jsonObject.putOnce("launchDate", resultSet.getDate("launchdate"));
				jsonObject.putOnce("memory", resultSet.getInt("memory"));
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("size", (resultSet.getInt("size")));
				jsonObject.putOnce("type", (resultSet.getInt("type") == 1 ? "Lenovo 电脑" : "ThinkPad 电脑"));
				jsonObject.putOnce("imagePath", new Computer().getOneImageByComputerId(resultSet.getInt("id")));
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
	
	public static Boolean addComputerDAO2(String name, int price, String cpu, int memory, int hardDisk, int type,
			int size, List<String> imagePaths) {
		addComputerDAO(name, price, cpu, memory, hardDisk, type, size);
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = null;
		for(int i = 0; i < imagePaths.size(); i++) {
			sql = "insert into images values(null,'" + name + "','" + imagePaths.get(i) + "')";
			try {
				statement.execute(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		DB.close(statement);
		DB.close(connection);
		
		return null;
	}

	public static Boolean updateComputer(int id, String name, int price, String cpu, int memory, int hardDisk, int type,
			int size) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "update computer set name = '" + name + "', price = " + price + ", cpu = '" + cpu + "', memory = "
				+ memory + ", harddisk = " + hardDisk + ", type = " + type + " where id = " + id;
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
		
		return true;
	}

	public static Boolean deleteComputerById(int id) {
		
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "delete from computer where id = " + id;
		
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
		String sql = "select * from computer where id=" + id;
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

	public static String getAllComputerJsonStringDAO(int pageNumber, int pageSize) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where isdel = 0";
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		int count = 0;
		try {
			while(resultSet.next()) {
				//jsonObject = new JSONObject();
				//jsonObject.putOnce("name", resultSet.getString("name"));
				//jsonObject.putOnce("price", resultSet.getInt("price"));
				//jsonObject.putOnce("cpu", resultSet.getString("cpu"));
				//jsonObject.putOnce("memory", resultSet.getInt("memory"));
				//jsonObject.putOnce("hardDisk", resultSet.getInt("harddisk"));
				//jsonObject.putOnce("type", (resultSet.getInt("type") == 1 ? "Lenovo 电脑" : "ThinkPad 电脑"));
				//jsonObject.putOnce("size", resultSet.getInt("size"));
				//jsonObject.putOnce("launchDate", resultSet.getDate("launchdate"));
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
				jsonObject.putOnce("id", resultSet.getString("id"));
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("price", resultSet.getInt("price"));
				jsonObject.putOnce("cpu", resultSet.getString("cpu"));
				jsonObject.putOnce("memory", resultSet.getInt("memory"));
				jsonObject.putOnce("hardDisk", resultSet.getInt("harddisk"));
				jsonObject.putOnce("type", (resultSet.getInt("type") == 1 ? "Lenovo 电脑" : "ThinkPad 电脑"));
				jsonObject.putOnce("size", resultSet.getInt("size"));
				jsonObject.putOnce("launchDate", resultSet.getDate("launchdate"));
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

	public static String findComputerDAO(String cpu, int hardDisk, int memory, int size, int lowPrice,
			int highPrice) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where 1=1";
		if(cpu != null && !cpu.equals("") && !cpu.equals("-1")) {
			sql += " and cpu = '" + cpu + "'";
		}
		if(hardDisk != -1) {
			sql += " and harddisk = " + hardDisk;
		}
		
		if(memory != -1) {
			sql += " and memory = " + memory;
		}
		
		if(size != -1) {
			sql += " and size = " + size;
		}
		
		if(lowPrice == -1 && highPrice != -1) {
			sql += " and price <= " + highPrice;
		} else if(highPrice == -1 && lowPrice != -1) {
			sql += " and price >= " + lowPrice;
		} else if(lowPrice != -1 && highPrice != -1) {
			sql += " and price between " + lowPrice + " and " + highPrice;
		}
		
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONArray jsonArray = new JSONArray();
		Map<String, String> nameMap = new HashMap<>();
		try {
			while(resultSet.next()) {
				if(nameMap.containsKey(resultSet.getString("name"))) {
					continue;
				} else {
					nameMap.put(resultSet.getString("name"), "1");
				}
				JSONObject jsonObject = new JSONObject();
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("cpu", resultSet.getString("cpu"));
				jsonObject.putOnce("hardDisk", resultSet.getInt("harddisk"));
				jsonObject.putOnce("launchDate", resultSet.getDate("launchdate"));
				jsonObject.putOnce("memory", resultSet.getInt("memory"));
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("type", (resultSet.getInt("type") == 1 ? "Lenovo 电脑" : "ThinkPad 电脑"));
				jsonObject.putOnce("imagePath", new Computer().getOneImageByComputerId(resultSet.getInt("id")));
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

	public static void uploadComputerImages(String name, List<String> paths) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = null;
		for(int i = 0; i < paths.size(); i++) {
			sql = "insert into images values(null,'" + name + "','" + paths.get(i) + "')";
			try {
				statement.execute(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		DB.close(statement);
		DB.close(connection);
		
	}

	public static String findComputerByIdDAO(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where id=" + id;
		ResultSet resultSet = DB.getRes(statement, sql);
		Computer computer = null;
		try {
			while(resultSet.next()) {
				computer = new Computer();
				computer.setId(resultSet.getInt("id"));
				computer.setCpu(resultSet.getString("cpu"));
				computer.setHardDisk(resultSet.getInt("harddisk"));
				computer.setLaunchDate(resultSet.getDate("launchdate"));
				computer.setMemory(resultSet.getInt("memory"));
				computer.setName(resultSet.getString("name"));
				computer.setPrice(resultSet.getInt("price"));
				computer.setType(resultSet.getInt("type"));
				getImagesToComputer(computer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.putOnce("id", computer.getId());
			jsonObject.putOnce("cpu", computer.getCpu());
			jsonObject.putOnce("hardDisk", computer.getHardDisk());
			jsonObject.putOnce("launchDate", computer.getLaunchDate());
			jsonObject.putOnce("memory", computer.getMemory());
			jsonObject.putOnce("name", computer.getName());
			jsonObject.putOnce("price", computer.getPrice());
			jsonObject.putOnce("type", computer.getType());
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonObject.toString();
	}

	public static String getOneImageByComputerId(int computerId) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String computerName = new Computer().getComputerNameById(computerId);
		
		String sql = "select * from images where name = '" + computerName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		
		try {
			if(resultSet.next()) {
				return resultSet.getString("path");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return null;
	}

	public static String getComputerNameById(int computerId) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where id = " + computerId;
		ResultSet resultSet = DB.getRes(statement, sql);
		
		try {
			if(resultSet.next()) {
				return resultSet.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return null;
	}

	public static String getImagePathsDAO(String computerName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from images where name = '" + computerName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		
		String totalPicture = "";
		try {
			while(resultSet.next()) {
				String path = resultSet.getString("path");
				totalPicture = totalPicture + "," + path;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(totalPicture != "") {
			totalPicture = totalPicture.substring(1, totalPicture.length());
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return totalPicture;
	}

	public static String getIdByAllParameters(String computerName, int memory, int hardDisk, String cpu, int size) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from computer where name = '" + computerName + "' and memory = " + 
				memory + " and cpu = '" + cpu + "' and harddisk = " + hardDisk + " and size = " + size;
		ResultSet resultSet = DB.getRes(statement, sql);
		
		int id = -1;
		int price = -1;
		try {
			if(resultSet.next()) {
				id = resultSet.getInt("id");
				price = resultSet.getInt("price");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		String s = Integer.toString(id) + "," + Integer.toString(price);
		return s;
	}

}


















