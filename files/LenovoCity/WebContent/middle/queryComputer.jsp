<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询电脑操作</title>
    
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
    		System.out.println("进入查询" );
    		String computername = request.getParameter("computername");
    		System.out.println("computername:" + computername);
    		//String data = computer.getComputerJsonString();
    		String newdata = null;
    		//System.out.println("数据：" + data);
    		if(computername==null){
    				//查询全部数据 
    				String pageSize = request.getParameter("limit");
    				String offset = request.getParameter("offset");
    				int number = Integer.valueOf(offset) / Integer.valueOf(pageSize);
    				String pageNumber = String.valueOf(number);
    				System.out.println("limit：" + pageSize + "......." + offset);
    				//newdata = "{\"pageNumber\":1,\"pageSize\":10,\"rows\":"+data+",\"total\":1}";
    				newdata = computer.getAllComputerJsonString(Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
    		}else{
    				newdata = computer.findComputer(computername);
    		}
    		System.out.println("查询电脑" + newdata);
    		out.clear();
    		//out.print(data);
    		out.print(newdata);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
