<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录操作</title>
    
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
    <jsp:useBean id="user" class="entity.Role" scope="request">
    	<%
    		System.out.println(session.getAttribute("result"));
    		String username = request.getParameter("loginUsername");
    		String password = request.getParameter("loginPassword");
    		String result = user.userLog(username, password);
    		if(result.equals("user is not exist") || result.equals("password error")){
    			out.clear();
    			out.print(1);
    			out.close();
    		}else{
    			System.out.println("结果为" + result);
    			session.setAttribute("result", result);
    			System.out.println("显示" + session.getAttribute("result"));
    		}
    		//Cookie cookie = new Cookie("result",result);
    		//cookie.setMaxAge(60*1);
    		//response.addCookie(cookie);
    	 %>
    </jsp:useBean>
  </body>
</html>
