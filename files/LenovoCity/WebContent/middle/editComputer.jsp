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
    
    <title>编辑电脑操作</title>
    
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
    		System.out.println("编辑电脑" );
    		String id = request.getParameter("computerId");
    		String name = request.getParameter("computerName");
    		String price = request.getParameter("price");
    		String cpu = request.getParameter("cpu");
    		String memory = request.getParameter("memory");
    		String harddisk = request.getParameter("harddisk");
    		String size = request.getParameter("size");
    		String type = request.getParameter("type");
    		System.out.println("id:" + id);
    		System.out.println("name:" + name);
    		boolean flag = false;
    		if(id==""){
    			System.out.println("进入添加功能" );
    			flag = computer.addComputer(name, Integer.parseInt(price), cpu, Integer.parseInt(memory), Integer.parseInt(harddisk), Integer.parseInt(type), Integer.parseInt(size));
    		}else{	
    			System.out.println("更新电脑");
    			flag = computer.updateComputer(Integer.parseInt(id), name, Integer.parseInt(price), cpu, Integer.parseInt(memory), Integer.parseInt(harddisk), Integer.parseInt(type), Integer.parseInt(size));
    		}
    		out.clear();
    		out.print(flag);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
