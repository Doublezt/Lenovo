<%@page import="org.json.JSONArray"%>
<%@page import="entity.Computer"%>
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
    
    <title>搜索电脑操作</title>
    
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
    <jsp:useBean id="computer" class="entity.Computer" scope="request">
    	<%
    		System.out.println("搜索电脑" );
    		String keys = request.getParameter("keys");
    		String type = request.getParameter("type");
    		String list = null;
    		System.out.println(keys);
    		System.out.println(type);
    		 list = computer.findComputer(keys, Integer.parseInt(type));
    		 System.out.println(list);
    		//session.setAttribute("computerList", list);
    		out.clear();
    		out.print(list);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
