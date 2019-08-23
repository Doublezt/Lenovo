<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>获取验证码操作</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 



</script>
<!-- //for-mobile-apps -->
<link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- pignose css jquery滑块-->
<link href="<%=basePath%>/css/pignose.layerslider.css" rel="stylesheet"
	type="text/css" media="all" />


<!-- //pignose css -->
<link href="<%=basePath%>/css/style.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- js -->
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart 购物车-->
<script src="<%=basePath%>/js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript"
	src="<%=basePath%>/js/bootstrap-3.1.1.min.js"></script>
<script src="<%=basePath%>/bootstrapValidator/js/bootstrapValidator.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<!-- 动画效果扩展 -->
<script src="<%=basePath%>/js/jquery.easing.min.js"></script>
<script src="<%=basePath%>/bootstrapValidator/js/bootstrapValidator.js"></script>
<script src="<%=basePath%>/bootstrapValidator/js/language/zh_CN.js"></script>

<script type="text/javascript">
			function load(){
				var result = '<%=session.getAttribute("result")%>';
				if (result == null || result == "null") {
					alert(" 请先登录");
					window.location.href = "index.jsp";
				} else {
					var username=result.split(",");
					$("#username").val(username[0]);
				}
			};
</script>
</head>

<body>
<jsp:useBean id="user" class="entity.User" scope="request"></jsp:useBean>
	<%
		String username = request.getParameter("username");
		boolean flag = user.isExist(username);
		System.out.println(flag);
		System.out.println(username);
		int key = 0;
		if(flag){
		key = user.getKeyByUserName(username);
		}else{
			;
		}
		out.clear();
		out.print(key);
		out.close();
	 %>
</body>
</html>
