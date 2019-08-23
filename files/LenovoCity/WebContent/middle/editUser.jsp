<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑用户操作</title>
    
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
  	<jsp:useBean id="admin" class="entity.Role" scope="request"></jsp:useBean>
    <jsp:useBean id="user" class="entity.User" scope="request">
    	<%
    		System.out.println("进入修改" );
    		String id = request.getParameter("id");
    		String username =request.getParameter("userId");
    		String password =request.getParameter("password");
    		String name =request.getParameter("name");
    		String email =request.getParameter("email");
    		String phone =request.getParameter("phone");
    		String address =request.getParameter("address");
    		String role = request.getParameter("role");
    		boolean flag = false;
    		if(!user.isExist(username)){
    			System.out.println("进入新建" );
    			if(role.equals("1")){
    				System.out.println("新建用户" );
    				user.addUser(username, password, name, email, phone, address);
    			}else{
    				System.out.println("新建管理员 ");
    				admin.addManager(username, password);
    			}
    		}else{
    				if(id ==""){
    					flag = false;
    				}else{
    		 			flag = user.updateUser(username, password, name, email, phone, address);
    		 		}
    		}
    		out.clear();
    		out.print(flag);
    		out.close();
    	 %>
    </jsp:useBean>
  </body>
</html>
