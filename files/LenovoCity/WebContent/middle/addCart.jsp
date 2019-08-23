<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加到购物车操作</title>
    
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
    		System.out.println("添加到购物车" );
    		String userName = request.getParameter("userId");
    		String computerId = request.getParameter("computerId");
    		String count = request.getParameter("count");
    		String price = request.getParameter("price");
    		System.out.println("user:"+userName+"computer:"+computerId+"count:"+count+"price:"+price);
    		int useridInt = user.getIdByUserName(userName);
    		int computerIdInt = Integer.parseInt(computerId);
    		int countInt = Integer.parseInt(count);
    		int priceInt = Integer.parseInt(price);
    		if(cart.isExist(computerIdInt, useridInt)){
    			System.out.println("已存在");
				//根据userid和computerid添加数量,返回bool
    			cart.addCountToExistCart(useridInt, computerIdInt, countInt);
    		}else{
    			System.out.println("添加新的");
    			cart.addCart(useridInt, computerIdInt, countInt, priceInt);
    		}
    		
    		out.clear();
    		out.print(true);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
