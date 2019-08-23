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
    
    <title>编辑订单操作</title>
    
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
  	<jsp:useBean id="cart" class="entity.Cart" scope="request"></jsp:useBean>
    <jsp:useBean id="order" class="entity.Order" scope="request">
    	<%
    		System.out.println("编辑提交订单" );
    		String id = request.getParameter("orderUser");
    		//id="1";
    		String userString = (String)session.getAttribute("result");
    		System.out.println(userString);
    		String[] userinfo = userString.split(",");
    		System.out.println("username:" + userinfo[0]);
    		int userId = user.getIdByUserName(userinfo[0]);
    		//userId="1";
    		
    		
    		String computerId = request.getParameter("orderComputer");
    		System.out.println(computerId);
    		//computerId="1";
    		String addr = request.getParameter("orderAddress");
    		String phone = request.getParameter("orderPhone");
    		String totalPrice = request.getParameter("orderPrice");
    		//totalPrice="10000";
    		String state = request.getParameter("orderState");
    		boolean pay = false;
    		if(state=="1"){
    			pay=true;
    		}else{
    			pay=false;
    		}
    		/* System.out.println("id:" + id); */
    		System.out.println("userId:" + userId + "computerId" + computerId + "addr" + addr + "phone" + phone + "totalPrice" + totalPrice + "pay" + pay);
    		
    		boolean flag = false;
    		if(id == null|| id==""){
    			System.out.println("进入添加订单");
    			String[] temp = computerId.split(",");
    			for(int i=0;i<temp.length-1;i++)
    			{
    			order.addOrder(userId, Integer.parseInt(temp[i]), addr, phone, Integer.parseInt(totalPrice), pay);
    			}
    			cart.deleteCartByUserId(userId);
    		}else{
    			
    			flag = order.updateOrder(Integer.parseInt(id), userId, Integer.parseInt(computerId), addr, phone, Integer.parseInt(totalPrice), pay);
    			
    		}
    		out.clear();
    		out.print(flag);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
