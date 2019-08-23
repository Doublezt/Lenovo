<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'thinkpad.jsp' starting page</title>
    
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
    <!-- header-bot -->
	<div class="header-bot">
		<div class="container">
			<div class="col-md-3 header-left">
				<h1>
					<!-- 网站logo -->
					<a href="index.jsp"><img src="pictures/logo.jpg"></a>
				</h1>
			</div>
			<div class="col-md-6 header-middle">
				<!-- 搜索功能 -->
				<form>
					<div class="search">
						<input type="search"  placeholder="搜索">
					</div>
					<div class="section_room">
						<select id="country" onChange="change_country(this.value)"
							class="frm-field required">
							<option value="null">所有商品</option>
							<option value="1">Levono笔记本</option>
							<option value="2">ThinkPad</option>
						</select>
					</div>
					<div class="sear-sub">
						<input type="submit" value=" ">
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
			<!-- 登录注册功能 -->
			<div class="col-md-3 header-right footer-bottom">
				<ul>
					<li><a href="#" class="use1" data-toggle="modal"
						data-target="#myModal4"><span>登录</span></a></li>
					<li><a class="fb" href="#" data-toggle="modal"
						data-target="#myModal4sign"><span>注册</span></a></li>
					<li><a class="twi" href="#"></a></li>
					<li><a class="insta" href="#"></a></li>
					<li><a class="you" href="#"></a></li>
				</ul>
			</div>
			<!-- 登录后 -->
			<div class = "col-md-3 header-right footer-bottom" style="display:none;">
				<ul>
					<li><a href="private.jsp" class="use1" ><span>个人信息</span></a></li>
					<li><a class="fb" ><span>退出登录</span></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header-bot -->
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only"></span> 导航栏<span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="active menu__item menu__item--current"><a
								class="menu__link" href="index.jsp">首页<span class="sr-only">(当前)</span></a></li>
							<li class=" menu__item"><a class="menu__link"
								href="lenovo.jsp">Lenovo笔记本</a></li>
							<li class=" menu__item"><a class="menu__link"
								href="thinkpad.jsp">ThinkPad笔记本</a></li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<div class="cart box_1">
					<a href="checkout.jsp">
						<h3>
							<div class="total">
								<i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
								<span class="simpleCart_total"></span> (<span
									id="simpleCart_quantity" class="simpleCart_quantity"></span> 件)
							</div>

						</h3>
					</a>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //banner-top -->
  </body>
</html>
