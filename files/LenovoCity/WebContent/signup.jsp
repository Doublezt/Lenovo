<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册操作</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		$(document).ready(function(){
			alert("进入signup");
		});
	</script>
  </head>
  
  <body>
    <jsp:useBean id="user" class="entity.User" scope="request">
    	<%
    		String username = request.getParameter("username");
    		String password = request.getParameter("password");
    		String realname = request.getParameter("realname");
    		String email = request.getParameter("email");
    		String phone = request.getParameter("phone");
    		String address = request.getParameter("address");
    		String result = user.addUser(username, password, realname, email, phone, address);
    		//String result = "user is already exist";
    		if(result.equals("user is already exist")){
    			out.clear();
    			out.print(1);
    			out.close();
    		}else{
    			System.out.println("注册结果:" + result);
    			session.setAttribute("result", result);
    		}
    		//Cookie cookie = new Cookie("result",result);
    		//cookie.setMaxAge(60*1);
    		//response.addCookie(cookie);
    	 %>
    </jsp:useBean>
  </body>
</html>
