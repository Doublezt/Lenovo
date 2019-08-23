package dao;

import java.sql.*;

import util.DB;

public class RoleDAO {

	public static String userLog(String userName, String passWord) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from role where username='" + userName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		int type = -1;
		try {
			if(resultSet.next() == false) {
				String error = "user is not exist";
				return error;
			}
			if(!resultSet.getString("passwd").equals(passWord)) {
				String error = "password error";
				return error;
			}
			type = resultSet.getInt("type");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return (userName + "," + Integer.toString(type));
	}

	public static String addManager(String userName, String passWord) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from role where username = '" + userName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		try {
			if(resultSet.next()) {
				return "Manager is already exist";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "insert into role values(null,?,?,2)"; //2代表管理员
		PreparedStatement preparedStatement = DB.getPreparedStmt(connection, sql);
		try {
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, passWord);
			preparedStatement.execute();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(preparedStatement);
		DB.close(connection);
		
		return userName;
	}

}
