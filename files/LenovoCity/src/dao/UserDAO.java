package dao;

import java.io.IOException;
import java.sql.*;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import util.DB;

public class UserDAO {

	public static boolean isExist(String userName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from role where username='" + userName + "'";
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
	
	public static String addUserDAO(String userName, String passWord, 
			String name, String email,
			String phone, String addr) {
		
		if(isExist(userName)) {
			return "user is already exist";
		}
		
		Connection connection = DB.getConn();
		String sql = "insert into role values(null,?,?,1)"; //type=1 代表为普通用户
		PreparedStatement preparedStatement = DB.getPreparedStmt(connection, sql);
		
		try {
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, passWord);
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {

			sql = "insert into user values(null,?,?,?,?,?)";
			preparedStatement = DB.getPreparedStmt(connection, sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, addr);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, phone);
			preparedStatement.setString(5, userName);
			preparedStatement.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(preparedStatement);
		DB.close(connection);
		
		return userName + "," + Integer.toString(1);
	}

	public static Boolean updateUser(String userName, String passWord, String name, String email, String phone,
			String addr) {
		
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "update user set name = '" + name + "', addr = '" + addr + "', email = '" 
		+ email + "', phone = '" + phone + "' where username = '" + userName + "'";
		
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		sql = "update role set passwd = '" + passWord + "' where username = '" + userName + "'";
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
		
		return true;
	}

	public static Boolean deleteUserByUserName(String userName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "delete from user where username = '" + userName + "'";
		try {
			statement.executeUpdate(sql);
			sql = "delete from role where username = '" + userName + "'";
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(statement);
		DB.close(connection);
		
		return true;
	}

	public static String getAllUserJsonString(int pageNumber, int pageSize) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select name, addr, email, phone, user.username, passwd, type from user,role where user.username = role.username";
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONObject jsonObject = null;
		JSONArray jsonArray = new JSONArray();
		int count = 0;
		
		try {
			while(resultSet.next()) {
				//jsonObject = new JSONObject();
				//jsonObject.putOnce("name", resultSet.getString("name"));
				//jsonObject.putOnce("addr", resultSet.getString("addr"));
				//jsonObject.putOnce("email", resultSet.getString("email"));
				//jsonObject.putOnce("phone", resultSet.getString("phone"));
				//jsonObject.putOnce("userName", resultSet.getString("username"));
				//jsonObject.putOnce("passWord", resultSet.getString("passwd"));
				//jsonObject.putOnce("type", (resultSet.getInt("type") == 1 ? "用户" : "管理员"));
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
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("email", resultSet.getString("email"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("userName", resultSet.getString("username"));
				jsonObject.putOnce("passWord", resultSet.getString("passwd"));
				jsonObject.putOnce("type", (resultSet.getInt("type") == 1 ? "用户" : "管理员"));
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

	public static String getUserJsonString(String userName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user where username = '" + userName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONObject jsonObject = new JSONObject();
		
		try {
			if(resultSet.next()) {
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("email", resultSet.getString("email"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("userName", resultSet.getString("username"));
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		sql = "select * from role where username = '" + userName + "'";
		resultSet = DB.getRes(statement, sql);
		try {
			if(resultSet.next()) {
				jsonObject.putOnce("passWord", resultSet.getString("passwd"));
				jsonObject.putOnce("type", resultSet.getString("type"));
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonObject.toString();
	}

	public static String getUserJsonString(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user where id = " + id;
		ResultSet resultSet = DB.getRes(statement, sql);
		JSONObject jsonObject = new JSONObject();
		
		try {
			if(resultSet.next()) {
				jsonObject.putOnce("id", resultSet.getInt("id"));
				jsonObject.putOnce("name", resultSet.getString("name"));
				jsonObject.putOnce("addr", resultSet.getString("addr"));
				jsonObject.putOnce("email", resultSet.getString("email"));
				jsonObject.putOnce("phone", resultSet.getString("phone"));
				jsonObject.putOnce("userName", resultSet.getString("username"));
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		try {
			sql = "select * from role where username = '" + jsonObject.getString("userName") + "'";
		} catch (JSONException e1) {
			e1.printStackTrace();
		}
		resultSet = DB.getRes(statement, sql);
		try {
			if(resultSet.next()) {
				jsonObject.putOnce("passWord", resultSet.getString("passwd"));
				jsonObject.putOnce("type", resultSet.getString("type"));
			}
		} catch (SQLException | JSONException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return jsonObject.toString();
	}

	public static int getIdByUserName(String userName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user where username = '" + userName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		
		int id = -1;
		try {
			if(resultSet.next()) {
				id = resultSet.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return id;
	}

	public static String getUserNameByUserId(int id) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user where id = " + id;
		ResultSet resultSet = DB.getRes(statement, sql);
		
		String userName = "";
		try {
			if(resultSet.next()) {
				userName = resultSet.getString("username");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return userName;
	}
	
	public static int getKeys(String phone){
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		
		int mobile_code = (int)((Math.random()*9+1)*100000);

		//System.out.println(mobile);
		
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。"); 

		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "lwg_1132781055"), 
			    new NameValuePair("password", "123456"), //密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", phone), 
			    new NameValuePair("content", content),
		};
System.out.println("电话：" + phone);
		method.setRequestBody(data);		
		
		
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
						
			 if("2".equals(code)){
				System.out.println("短信提交成功");
			}
			
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return mobile_code;
	}

	public static int getKeyByUserName(String userName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user where username = '" + userName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		
		String phone = null;
		try {
			if(resultSet.next()) {
				phone = resultSet.getString("phone");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int key = new UserDAO().getKeys(phone);
		//int key = 123456;
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return key;
	}

	public static String getPassWordByUserName(String userName) {
		Connection connection = DB.getConn();
		Statement statement = DB.getStat(connection);
		String sql = "select * from user, role where user.username = role.username and user.username = '"
				+ userName + "'";
		ResultSet resultSet = DB.getRes(statement, sql);
		
		String passWord = null;
		try {
			if(resultSet.next()) {
				passWord = resultSet.getString("passwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(resultSet);
		DB.close(statement);
		DB.close(connection);
		
		return passWord;
	}

}
















