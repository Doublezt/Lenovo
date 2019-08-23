<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.print("path: " + basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>联想商城</title>
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
	$(document).ready(function() {

				$('#myModal4').modal({
					backdrop : false,
					keyboard : false,
					show : false
				});
				$("#myModal4").on(
						"hide.bs.modal",
						function() {
							$(':input', '#signinForm').not(
									':button, :submit, :reset, :hidden')
									.val('').removeAttr('checked').removeAttr(
											'selected');

							$('#signinForm').data('bootstrapValidator')
									.resetForm();
						});
				$('#signinResetForm').click(function() {
					$('#signinForm').data('bootstrapValidator').resetForm();
				});
				$('#signinForm').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields:{
						loginUsername:{
							validators:{
								notEmpty:{
									message:'输入不能为空'
								},
								stringLength : {
									min : 6,
									max : 20,
									message : '用户名应为6~20位'
								}
							}
						},
						loginPassword:{
							validators:{
								notEmpty:{
									message:'输入不能为空'
								},
								stringLength : {
									min : 6,
									max : 18,
									message : '密码应为6~18位'
								}
							}
						}
					}
				});
				
				$('#myModal4sign').modal({
					backdrop : false,
					keyboard : false,
					show : false
				});
				$("#myModal4sign").on(
						"hide.bs.modal",
						function() {
							$(':input', '#signupForm').not(
									':button, :submit, :reset, :hidden')
									.val('').removeAttr('checked').removeAttr(
											'selected');

							$('#signupForm').data('bootstrapValidator')
									.resetForm();
						});
				$('#resetForm').click(function() {
					$('#signupForm').data('bootstrapValidator').resetForm();
				});
				$('#signupForm').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						username : {
							validators : {
								notEmpty : {
									message : '用户名不能为空'
								},
								stringLength : {
									min : 6,
									max : 20,
									message : '用户名应为6~20位'
								}
							//,
							//callback
							}
						},
						password : {
							validators : {
								notEmpty : {
									message : '密码不能为空'
								},
								stringLength : {
									min : 6,
									max : 18,
									message : '密码应为6~18位'
								}
							}
						},
						realname : {
							validators : {
								notEmpty : {
									message : '真实姓名不能为空'
								},
								stringLength : {
									max : 10,
									message : '真实姓名不能超过10位'
								}
							}
						},
						email : {
							validators : {
								notEmpty : {
									message : '邮箱不能为空'
								},
								emailAddress : {
									message : '请输入正确邮箱'
								}
							}
						},
						phone : {
							validators : {
								notEmpty : {
									message : '邮箱不能为空'
								},
								Integer : {
									message : '请输入数字'
								},
								stringLength : {
									min : 11,
									max : 11,
									message : '请输入正确的联系电话'
								}
							}
						},
						address : {
							validators : {
								notEmpty : {
									message : '地址不能为空'
								}
							}
						},
						key:{
							validators:{
								notEmpty:{
									message:'验证码不能为空'
								},
								callback:{
									message:'验证码输入错误',
									callback:function(value,validator){
										var check = $("#checkKey").val();
										return value == check;
									}
								}
							}
						}
					}
				})//end_bootstrapValidator
				
				//获取验证码
			$("#getKeys").click(function(){
					if($("#phone").val()==""){
						alert("请输入手机号");
					}else if($("#phone").val().length != 11){
						alert("请输入11位手机号");
					}else{
					$.ajax({
							type : "post",
							url : "middle/check.jsp",
							data : {
								phone:$("#phone").val()
							},
							success : function(data) {
								$("#checkKey").val(data);
								alert("获取验证码成功，请勿重复点击");
							},
							error : function() {
								alert("获取验证码异常");
							}
						});
						}
				});

				//登录操作
				$('#signinButton').click(function() {
					
					$('#signinForm').data('bootstrapValidator').validate();
					if ($('#signinForm').data('bootstrapValidator').isValid()) {
						$.ajax({
							type : "post",
							url : "login.jsp",
							data : $("#signinForm").serialize(),
							success : function(data) {
								if(data == 1){
								alert("用户名或密码错误");
								}else{
									location.reload();
									alert("登录成功,欢迎您！");
								}
							},
							error : function() {
								alert("登录异常");
							}
						});
					} else {
						alert("输入存在错误，请修改后登录");
					}
				});

				//注册操作
				$('#signupButton').click(function() {
					$('#signupForm').data('bootstrapValidator').validate();
					if (true) {
						//提交表单
						$.ajax({
							type : "POST",
							url : "signup.jsp",
							data : $("#signupForm").serialize(),
							success : function(data) {
								//alert(data);
								if(data == 1){
								alert("用户名已存在,请重新输入");
								}else{
									location.reload();
									alert("您已成功注册！");
								}
							},
							error : function() {
								alert("注册异常");
							}
						});
					} else {
						alert("输入错误，请更改后提交。");
					}

				});

			});
			
	function load(){
		//alert("加载");
		var puser = '<%=session.getAttribute("result")%>';
		//alert(111 + puser);
		if(puser != null || !puser.equals("")){
			$(".before-login").hide();
			var user = puser.split(",");
			if(user[1] == "1"){
				$(".after-login").show();
			}else if(user[1] == "2"){
				$(".admin-login").show();
			}else{
				$(".before-login").show();
			}
		}
	};
	
	function quit(){
		$.ajax({
			type : "post",
			url : "logout.jsp",
			success : function(data) {
				location.reload();
				var sresult = '<%=session.getAttribute("result")%>';
				var result = sresult.split(",");
				//alert(sresult);
				$(".before-login").hide();
				if (result[1] == "1")
					$(".after-login").show();
				else if (result[1] == "2")
					$(".admin-login").show();
				$("#myModal4").modal("hide");
				
			},
			error : function() {
				alert("登出异常");
			}
		});
	};
</script>
</head>

<body onload="load()">

	<!-- 导航 -->
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
							<span class="sr-only"></span> 导航栏<span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="menu__item"><img
								src="pictures/show/lenovologo.png"></img></li>
							<li class="menu__item"><a class="menu__link"
								href="index.jsp">首页</a></li>
							<li class=" menu__item"><a class="menu__link"
								href="search.jsp?keys=&type=1">Lenovo专区</a></li>
							<li class=" menu__item"><a class="menu__link"
								href="search.jsp?keys=&type=2">ThinkPad专区</a></li>
							<li class=" menu__item">
								<form action="search.jsp" style="width: 200px;" method="get"
									class="form-inline my-2 my-lg-0" role="search">
									<div class="input-group">
										<input type="search" class="form-control" name="keys"
											placeholder="搜索你想要的商品"> <span class="input-group-btn">
											<button type="submit" class="btn btn-secondary">搜索</button>
										</span>
									</div>
									<!-- /input-group -->
								</form>

							</li>
							<!-- 登录注册功能 -->
							<!-- <div class="col-md-3 header-right footer-bottom before-login"> -->

							<li class=" menu__item before-login"><a id="btn_login"
								class="menu__link" data-toggle="modal" data-target="#myModal4">登录</a>
								<a id="btn_register" class="menu__link" data-toggle="modal"
								data-target="#myModal4sign">注册</a></li>


							<li class="menu__item after-login" style="display: none;"><a
								style="color: white;" menu__link href="private.jsp">个人信息</a> <a
								style="color: white;" menu__link onclick="quit()">退出登录</a></li>



							<li class="menu__item admin-login" style="display: none;"><a
								style="color: white;" menu__link href="admin.jsp">管理后台</a> <a
								style="color: white;" menu__link onclick="quit()">退出登录</a></li>

							<div class="clearfix"></div>


						</ul>
					</div>
				</div>
				</nav>
			</div>

		</div>
	</div>
	<!-- 导航 -->

	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src="pictures/show/登月.jpg" alt="First slide">
				<div class="carousel-caption">登月助力</div>
			</div>
			<div class="item">
				<img src="pictures/show/ThinkPad.jpg" alt="Second slide">
				<div class="carousel-caption">ThinkPad全新</div>
			</div>
			<div class="item">
				<img src="pictures/show/新年.jpg" alt="Third slide">
				<div class="carousel-caption">新年优惠</div>
			</div>
		</div>

		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>


		<script type="text/javascript" src="js/pignose.layerslider.js"></script>
		<script type="text/javascript">
			//<![CDATA[
			$(window).load(function() {
				$('#visual').pignoseLayerSlider({
					play : '.btn-play',
					pause : '.btn-pause',
					next : '.btn-next',
					prev : '.btn-prev'
				});
			});
			//]]>
		</script>

	</div>
	<!-- //banner -->

	<!-- content-bottom -->



	

	<!-- //content-bottom -->

	<!-- 登录 -->
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"
			style="width: 300px; height: 270px; margin-left: 50%; margin-top: 550px;">
			<div class="modal-content">
				<div class="modal-header myModal-header">
					<button type="button" class="close myModal-header-close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title myModal-header-font" id="myModalLabel">登录</h4>
				</div>

				<div class="modal-body myModal-body">
					<form id="signinForm" role="form" class="form-horizontal"
						method="POST">
						<div class="sign-in form-group">
							<h4>账号 :</h4>
							<input type="text" class="form-control" placeholder="在此输入账号"
								id="loginUsername" name="loginUsername">
						</div>
						<div class="sign-in form-group">
							<h4>密码 :</h4>
							<input type="password" class="form-control" placeholder="密码"
								id="loginPassword" name="loginPassword"> <a
								href="forget.jsp">忘记密码?</a>
						</div>
						<div class="sign-in">
							<button id="signinButton" type="button"
								class="btn btn-primary btn-sm">登录</button>
						</div>
					</form>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 登录 -->

	<!-- 注册 -->
	<div class="modal fade" id="myModal4sign" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"
			style="width: 300px; height: 270px; margin-left: 50%; margin-top: 550px;">
			<div class="modal-content">

				<div class="modal-header myModal-header">
					<button type="button" class="close myModal-header-close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title myModal-header-font" id="myModalLabel">注册</h4>
				</div>

				<div class="modal-body myModal-signup">

					<form id="signupForm" role="form" class="form-horizontal"
						method="POST">
						<div class="sign-up form-group">
							<h4>账号 :</h4>
							<input class="form-control" type="text" placeholder="注册账号"
								id="username" name="username">
						</div>
						<div class="sign-up form-group">
							<h4>密码 :</h4>
							<input class="form-control" type="password" placeholder="密码"
								id="password" name="password">
						</div>
						<div class="sign-up form-group">
							<h4>姓名 :</h4>
							<input class="form-control" type="text" placeholder="真实姓名"
								id="realname" name="realname">
						</div>
						<div class="sign-up form-group">
							<h4>邮箱 :</h4>
							<input class="form-control" type="text" placeholder="邮箱"
								id="email" name="email">
						</div>
						<div class="sign-up form-group">
							<h4>电话 :</h4>
							<input class="form-control" type="text" placeholder="联系电话"
								id="phone" name="phone">
						</div>
						<div class="sign-up form-group">
							<h4>地址 :</h4>
							<input class="form-control" type="text" placeholder="住址"
								id="address" name="address">
						</div>
						<div class="sign-up form-group">
							<h4>验证码 :</h4>
							<input class="form-control" type="text" placeholder="验证码"
								name="key">
							<button id="getKeys" type="button" class="btn btn-primary btn-sm">获取验证码</button>
						</div>
						<div class="sign-up form-group" style="display: none">
							<input class="form-control" type="text" placeholder="验证码"
								id="checkKey">
						</div>
						<div class="sign-up">
							<button id="signupButton" type="button"
								class="btn btn-primary btn-sm">注册</button>
							<button type="reset" class="btn btn-primary btn-sm"
								id="resetForm">重置</button>
						</div>
					</form>
					<div class="clearfix"></div>

				</div>
			</div>
		</div>
	</div>
	<!-- 注册 -->


	<style>
.clearfix:after {
	display: block;
	clear: both;
	height: 0;
	visibility: hidden;
	font-size: 0;
	line-height: 0;
	content: ""
}

.clearfix {
	zoom: 1
}

.fl {
	float: left
}

.fr {
	float: right
}

.all_countries {
	position: absolute;
	display: none;
	width: 184px;
	height: 210px;
	background: #fff;
	border: 1px solid #858585;
	bottom: 24px;
	left: 0px;
	overflow-y: auto;
	overflow-x: hidden;
	z-index: 55;
}

.all_countries ul li {
	text-align: left;
	margin: 4px;
}

#cn_img {
	width: 186px;
	height: 24px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/05/17/dc95e9d6-bef7-4f4b-8b03-e6c3deeaa5a7.jpg);
}

.select_country {
	margin: 60px 0 10px;
	font-size: 16px;
	line-height: 16px;
	color: #ccc;
}

.footer {
	background-color: #272727;
	height: 355px;
	width: 100%;
	color: #ccc;
}

.footer a {
	color: #ccc
}

.foot_top {
	width: 1200px;
	margin: auto;
	padding: 44px 0 27px 0px;
}
/*.foot_top >li { width:240px;text-align: left}*/
.about_lenovo, .shop_lenovo, .service_lenovo {
	width: 210px;
}

.shop_lenovo {
	width: 194px;
}

.lenovo_website_group {
	width: 200px;
}

.lenovo_website_group.part-1 {
	width: 130px;
}

.social_platform {
	width: 230px;
}

.foot_top>li>h6 {
	font-size: 16px;
	line-height: 16px;
	margin-bottom: 18px;
}

.foot_top li>a {
	display: block;
	font-size: 13px;
	line-height: 13px;
	margin-bottom: 12px;
}

.foot_bot {
	border-top: 1px solid #424141;
}

.foot_bot_con {
	width: 1200px;
	margin: auto;
	font-size: 12px;
	line-height: 46px;
}

.foot_bot_con a {
	font-size: 12px;
	line-height: 46px;
}

.foot_bot_left span, .foot_bot_right span {
	margin: 0 6px;
}

.foot_top_title {
	font-size: 16px !important;
	line-height: 16px !important;
	margin-bottom: 18px !important;
	font-weight: 600 !important;
}

.countries_version {
	position: relative
}

.darkwchat {
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-8px -190px;
}

.lightwchat {
	transition: all 0.3s;
	display: none;
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-8px -238px;
}

.wchat:hover .darkwchat {
	display: none
}

.wchat:hover .lightwchat {
	display: block;
}

.darkqqzone {
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-63px -190px;
}

.lightqqzone {
	transition: all 0.3s;
	display: none;
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-63px -238px;
}

.qqzone:hover .darkqqzone {
	display: none
}

.qqzone:hover .lightqqzone {
	display: block;
}

.darkweibo {
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-119px -190px;
}

.lightweibo {
	transition: all 0.3s;
	display: none;
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-119px -238px;
}

.weibo:hover .darkweibo {
	display: none
}

.weibo:hover .lightweibo {
	display: block;
}

.dark_tieba {
	width: 74px;
	height: 22px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-119px -129px;
	margin-top: -2px;
}

.light_tieba {
	display: none;
	width: 74px;
	height: 22px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-119px -155px;
	margin-top: -2px;
}

.tieba:hover .dark_tieba {
	display: none
}

.tieba:hover .light_tieba {
	display: block
}

.tieba {
	margin-top: -2px
}

.dark_weibo_icon {
	width: 82px;
	height: 20px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-8px -132px
}

.light_weibo_icon {
	display: none;
	width: 82px;
	height: 20px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-8px -158px
}

.weibo_icon:hover .dark_weibo_icon {
	display: none
}

.weibo_icon:hover .light_weibo_icon {
	display: block
}

.weibo_icon {
	margin: 0 20px 0 5px
}

.dark_fun_icon {
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-176px -190px
}

.light_fun_icon {
	transition: all 0.3s;
	display: none;
	width: 37px;
	height: 36px;
	background:
		url(//p1.lefile.cn/product/adminweb/2018/11/08/65c60c1d-a6bc-4bfe-9dda-02c3972857de.png)
		-176px -238px
}

.fun_icon:hover .dark_fun_icon {
	display: none
}

.fun_icon:hover .light_fun_icon {
	display: block;
}

.weibo_text, .fun_text {
	vertical-align: top;
	line-height: 24px;
	font-size: 15px;
}

.manager_weibo {
	margin: 6px 30px 6px 5px;
}

.social_plat {
	margin: 2px 0 10px
}

.social_plat li {
	margin: 6px 7px 6px 4px;
}

.social_plat li a:hover {
	transform: rotate(360deg)
}

.social_plat li a {
	transition: all 0.3s
}

.interst_tride {
	margin: 6px 0;
}

.social_plat li a {
	margin-bottom: 0 !important;
}

.index .back {
	margin-bottom: 379px;
	z-index: 3
}

.index .footer {
	position: fixed;
	z-index: 1;
	bottom: 0;
}

.foot_bot .foot_bot_left span {
	display: inline-block !important
}

.foot_bot .foot_bot_right span {
	display: inline-block !important
}

.footer .all_countries  li a {
	color: #000
}

.footer .all_countries li a:hover {
	color: #e2231a
}
</style>
	<div class="footer">
		<ul class="foot_top clearfix">
			<li class="fl about_lenovo"><a class="foot_top_title"
				href="https://news.lenovo.com.cn/news/list.html" title="关于联想"
				target="_blank">关于联想</a> <a
				href="http://appserver.lenovo.com.cn/About/Introduction.html"
				style="display: none" title="公司介绍" target="_blank"
				latag="latag_pc_common_bottommost_lenovo_1_http://appserver.lenovo.com.cn/About/Introduction.html">公司介绍</a>
				<a href="https://shop.lenovo.com.cn/investor/html/investor.html"
				title="投资者关系" target="_blank"
				latag="latag_pc_common_bottommost_lenovo_1_https://shop.lenovo.com.cn/investor/html/investor.html">投资者关系</a>
				<a href="http://www.lenovocareers.com/chi/index.html" title="工作机会"
				target="_blank"
				latag="latag_pc_common_bottommost_lenovo_2_http://www.lenovocareers.com/chi/index.html">工作机会</a>
				<a href="https://shop.lenovo.com.cn/help/contact-us.html"
				title="联系我们" target="_blank"
				latag="latag_pc_common_bottommost_lenovo_3_https://shop.lenovo.com.cn/help/contact-us.html">联系我们</a>
				<a href="https://mall.lenovo.com.cn/" title="销售网点查询" target="_blank"
				latag="latag_pc_common_bottommost_lenovo_4_https://mall.lenovo.com.cn/">销售网点查询</a>
				<a
				href="http://support.lenovo.com.cn/lenovo/wsi/station/servicestation/default.aspx"
				title="服务网点查询" target="_blank"
				latag="latag_pc_common_bottommost_lenovo_5_http://support.lenovo.com.cn/lenovo/wsi/station/servicestation/default.aspx">服务网点查询</a>
			</li>
			<li class="fl shop_lenovo"><a class="foot_top_title"
				href="https://shop.lenovo.com.cn/" title="联想商城" target="_blank">联想商城</a>
				<a href="https://shop.lenovo.com.cn/stryout/tryhtml/index.html"
				title="0元试用" target="_blank"
				latag="latag_pc_common_bottommost_shop_1_https://shop.lenovo.com.cn/stryout/tryhtml/index.html">0元试用</a>
				<a
				href="https://shop.lenovo.com.cn/activity/marketing/jsd/index.html"
				title="极速到家" target="_blank"
				latag="latag_pc_common_bottommost_shop_2_https://shop.lenovo.com.cn/activity/marketing/jsd/index.html">极速到家</a>
				<a href="https://shop.lenovo.com.cn/c2c/new/c2c_center.html"
				title="联想合伙人" target="_blank"
				latag="latag_pc_common_bottommost_shop_3_https://shop.lenovo.com.cn/c2c/new/c2c_center.html">联想合伙人</a>
				<a href="https://shop.lenovo.com.cn/lenovomaker/index" title="私人定制"
				target="_blank"
				latag="latag_pc_common_bottommost_shop_4_https://shop.lenovo.com.cn/lenovomaker/index">私人定制</a>
				<a href="https://shop.lenovo.com.cn/oldfornew/oldchangenew.html"
				title="以旧换新" target="_blank"
				latag="latag_pc_common_bottommost_shop_5_https://shop.lenovo.com.cn/oldfornew/oldchangenew.html">以旧换新</a>
				<a href="https://raise.lenovo.com.cn/" title="联想众筹" target="_blank"
				latag="latag_pc_common_bottommost_shop_6_https://raise.lenovo.com.cn/">联想众筹</a>
			</li>
			<li class="fl service_lenovo"><a class="foot_top_title"
				href="http://support.lenovo.com.cn/lenovo/wsi/index.html"
				title="联想服务" target="_blank">联想服务</a> <a
				href="http://support.lenovo.com.cn/lenovo/wsi/Modules/NewDrive.aspx"
				title="驱动与软件下载" target="_blank"
				latag="latag_pc_common_bottommost_service_1_http://support.lenovo.com.cn/lenovo/wsi/Modules/NewDrive.aspx">驱动与软件下载</a>
				<a href="http://iknow.lenovo.com/" title="联想知识库" target="_blank"
				latag="latag_pc_common_bottommost_service_2_http://iknow.lenovo.com/">联想知识库</a>
				<a href="http://robot.lenovo.com.cn/lenovo/?channel=H325B"
				title="24小时智能客服" target="_blank"
				latag="latag_pc_common_bottommost_service_3_http://robot.lenovo.com.cn/lenovo/?channel=H325B">24小时智能客服</a>
				<a
				href="http://support.lenovo.com.cn/lenovo/wsi/Modules/Newbxpz.aspx"
				title="保修配置查询" target="_blank"
				latag="latag_pc_common_bottommost_service_4_http://support.lenovo.com.cn/lenovo/wsi/Modules/Newbxpz.aspx">保修配置查询</a>
				<a
				href="http://support.lenovo.com.cn/lenovo/wsi/htmls/policylist_1349943520435.aspx"
				title="服务政策查询" target="_blank"
				latag="latag_pc_common_bottommost_service_5_http://support.lenovo.com.cn/lenovo/wsi/htmls/policylist_1349943520435.aspx">服务政策查询</a>
				<a
				href="http://www.xiangbangbang.cn/pc?utm_source=lenovoPC&amp;utm_content=index"
				rel="nofollow" title="上门快修" target="_blank"
				latag="latag_pc_common_bottommost_service_6_http://www.xiangbangbang.cn/pc?utm_source=lenovoPC&amp;utm_content=index">上门快修</a>
				<a
				href="https://shop.lenovo.com.cn/home/serviceindex.html?tag=a111&amp;intcmp=SS_F_YCBX&amp;SourceFlag=Support_MA&amp;CheckCode=Test123"
				title="延长保修" target="_blank"
				latag="latag_pc_common_bottommost_service_7_https://shop.lenovo.com.cn/home/serviceindex.html?tag=a111&amp;intcmp=SS_F_YCBX&amp;SourceFlag=Support_MA&amp;CheckCode=Test123">延长保修</a>
				<a href="http://www.ms.lenovo.com/" title="联想IT管理服务" target="_blank"
				latag="">联想IT管理服务</a></li>
			<li class="fl lenovo_website_group part-1">
				<h6>联想网站群</h6> <a href="http://capital.lenovo.com/default.html"
				title="联想创投" target="_blank"
				latag="latag_pc_common_bottommost_websites_1_http://capital.lenovo.com/default.html/">联想创投</a>
				<a href="https://www.lenovovip.com.cn/" title="聚享汇" target="_blank"
				latag="latag_pc_common_bottommost_websites_10_https://www.lenovovip.com.cn/">聚享汇</a>
				<a href="https://guanjia.lenovo.com.cn/" title="联想电脑管家"
				target="_blank"
				latag="latag_pc_common_bottommost_websites_2_https://guanjia.lenovo.com.cn/">联想电脑管家</a>
				<a href="http://www.lenovocloud.com/" title="联想超融合" target="_blank"
				latag="latag_pc_common_bottommost_websites_3_http://www.lenovocloud.com/">联想超融合</a>
				<a href="http://research.lenovo.com" title="联想研究院" target="_blank"
				latag="latag_pc_common_bottommost_websites_4_http://research.lenovo.com">联想研究院</a>
				<a href="http://www.lenovohit.com" title="智慧医疗" target="_blank"
				latag="latag_pc_common_bottommost_websites_5_http://www.lenovohit.com">智慧医疗</a>
			</li>
			<li class="fl lenovo_website_group">
				<h6>&nbsp;</h6> <a href="https://www.baiying.cn/" title="联想百应平台"
				target="_blank"
				latag="latag_pc_common_bottommost_websites_6_https://www.baiying.cn/">联想百应平台</a>
				<a href="http://rental.lenovo.com.cn/" title="联想租赁商城"
				target="_blank"
				latag="latag_pc_common_bottommost_websites_7_http://rental.lenovo.com.cn/">联想租赁商城</a>
				<a href="https://box.lenovo.com/?C=LXGW" title="联想企业网盘"
				target="_blank"
				latag="latag_pc_common_bottommost_websites_8_https://box.lenovo.com/?C=LXGW">联想企业网盘</a>
				<a href="https://www.thinkpad.com/index.html" title="ThinkPad官网"
				target="_blank"
				latag="latag_pc_common_bottommost_websites_9_https://www.thinkpad.com/index.html">ThinkPad官网</a>
				<a href="https://www.lecoo.com" title="lecoo商城" target="_blank"
				latag="latag_pc_common_bottommost_websites_11_https://www.lecoo.com/">lecoo商城</a>
				<a href="https://bigdata.lenovo.com/" title="“联想大数据" target="_blank"
				latag="latag_pc_common_bottommost_websites_12_https://bigdata.lenovo.com/">联想大数据</a>
			</li>
			<li class="fl social_platform">
				<h6>联想官方社交平台</h6>
				<ul class="clearfix social_plat">
					<li class="fl "><a
						href="http://mp.weixin.qq.com/s?__biz=MTAwODE1MDY4MQ==&amp;mid=206356406&amp;idx=1&amp;sn=f7deb8e204994ba29541df143a01e3e0#rd"
						class="wchat" rel="nofollow" target="_blank"
						latag="latag_pc_common_bottommost_social_1_http://mp.weixin.qq.com/s?_biz=MTAwODE1MDY4MQ==&amp;mid=206356406&amp;idx=1&amp;sn=f7deb8e204994ba29541df143a01e3e0#rd">
							<p class="darkwchat"></p>
							<p class="lightwchat"></p>
					</a></li>
					<li class="fl "><a href="http://user.qzone.qq.com/2454421820"
						class="qqzone" rel="nofollow" target="_blank"
						latag="latag_pc_common_bottommost_social_2_http://user.qzone.qq.com/2454421820">
							<p class="darkqqzone"></p>
							<p class="lightqqzone"></p>
					</a></li>
					<li class="fl "><a href="http://weibo.com/lenovo"
						class="weibo" rel="nofollow" target="_blank"
						latag="latag_pc_common_bottommost_social_3_http://weibo.com/lenovo">
							<p class="darkweibo"></p>
							<p class="lightweibo"></p>
					</a></li>
					<li class="fl"><a
						href="http://s.p.qq.com/pub/jump?d=AAAOgv9d&amp;_wv=1027"
						rel="nofollow" class="fun_icon" target="_blank"
						latag="latag_pc_common_bottommost_social_6_http://s.p.qq.com/pub/jump?d=AAAOgv9d&amp;_wv=1027">
							<p class="dark_fun_icon"></p>
							<p class="light_fun_icon"></p>
					</a></li>
				</ul>
				<div class="clearfix">
					<a href="http://weibo.com/5347290193/profile" class="weibo_icon fl"
						rel="nofollow" target="_blank"
						latag="latag_pc_common_bottommost_social_5_http://weibo.com/5347290193/profile">
						<p class="dark_weibo_icon fl"></p>
						<p class="light_weibo_icon fl"></p>
					</a> <a href="http://tieba.baidu.com/f?kw=%C1%AA%CF%EB&amp;fr"
						class="tieba fl" rel="nofollow" target="_blank"
						latag="latag_pc_common_bottommost_social_4_http://tieba.baidu.com/f?kw=%C1%AA%CF%EB&amp;fr">
						<p class="dark_tieba fl"></p>
						<p class="light_tieba fl"></p>
					</a>
				</div>

			</li>
		</ul>

	</div>








</body>
</html>
