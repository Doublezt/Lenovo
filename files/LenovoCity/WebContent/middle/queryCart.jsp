<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询购物车操作</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<jsp:useBean id="user" class="entity.User" scope="request"></jsp:useBean>
    <jsp:useBean id="cart" class="entity.Cart" scope="request">
    	<%
    		System.out.println("进入查询" );
    		String userString = (String)session.getAttribute("result");
    		String[] userinfo = userString.split(",");
    		System.out.println("username:" + userinfo[0]);
    		int userId = user.getIdByUserName(userinfo[0]);
    		//String data = user.getUserJsonString();
    		String newdata = null;
    		//System.out.println("数据：" + data);
    		newdata = cart.getCartByUserId(userId);
    		System.out.println("查询购物车" + newdata);
    		out.clear();
    		//out.print(data);
    		out.print(newdata);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
