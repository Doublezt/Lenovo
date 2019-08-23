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
    
    <title>修改电脑id和价格操作</title>
    
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
    		String computerName = request.getParameter("computerName");
    		String cpu = request.getParameter("cpu");
    		String memory = request.getParameter("memory");
    		String hardDisk = request.getParameter("hardDisk");
    		String size = request.getParameter("size");
    		String result = computer.getIdByAllParameters(computerName, Integer.parseInt(memory), Integer.parseInt(hardDisk), cpu, Integer.parseInt(size));
    		out.clear();
    		out.print(result);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
