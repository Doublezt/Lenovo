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
    		String list = null;
    			System.out.println("进入2");
    			String cpu = request.getParameter("cpu");
    			String hardDisk = request.getParameter("hardDisk");
    			String memory = request.getParameter("memory");
    			String size = request.getParameter("size");
    			String low = request.getParameter("low");
    			String high = request.getParameter("high");
    			System.out.println("cpu:" + cpu + "disk:" + hardDisk + "memory:" + memory + "size:" + size + "low:" + low);
    			list = computer.findComputer(cpu, Integer.parseInt(hardDisk), Integer.parseInt(memory), Integer.parseInt(size), Integer.parseInt(low), Integer.parseInt(high));
    		//session.setAttribute("computerList", list);
    		out.clear();
    		out.print(list);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
