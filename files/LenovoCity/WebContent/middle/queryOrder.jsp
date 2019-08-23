<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询订单操作</title>
    
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
    <jsp:useBean id="order" class="entity.Order" scope="request">
    	<%
    		System.out.println("进入查询" );
    		//String userId = request.getParameter("userId");
    		//String computerId = request.getParameter("computerId");
    		String id = request.getParameter("id");
    		String newdata = null;
    		System.out.println("数据：" + id);
    		if(id==null){
    				//查询全部数据 
    				String pageSize = request.getParameter("limit");
    				String offset = request.getParameter("offset");
    				String user = (String)session.getAttribute("result");
    				String[] userinfo = user.split(",");
    				int number = Integer.valueOf(offset) / Integer.valueOf(pageSize);
    				String pageNumber = String.valueOf(number);
    				System.out.println("limit：" + pageSize + "......." + offset);
    				//newdata = "{\"pageNumber\":1,\"pageSize\":10,\"rows\":"+data+",\"total\":1}";
    				if(userinfo[1].equals("2")){
    					newdata = order.getAllOrderJsonString(Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
    				}else{
    					newdata = order.getOrderByUserName(userinfo[0], Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
    				}
    		}else{
    				//newdata = order.getOrderById(Integer.parseInt(userId),Integer.parseInt(computerId));
    				newdata = order.getOrderById(Integer.parseInt(id));
    		}
    		System.out.println("查询订单" + newdata);
    		out.clear();
    		out.print(newdata);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
