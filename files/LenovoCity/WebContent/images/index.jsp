reload<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.print("path: " + basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>联想销售网站</title>
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
				});//end_bootstrapValidator
				
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
					if ($('#signupForm').data('bootstrapValidator').isValid()) {
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
								}
							},
							error : function() {
								alert("注册异常");
							}
						});
					} else {
						alert("输入存在错误，请修改后提交");
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
						if(result[1]=="1")
							$(".after-login").show();
						else if(result[1] == "2")
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
				<form action="search.jsp" method="get">
					<div class="search">
						<input type="search" placeholder="搜索" name="keys">
					</div>
					<div class="section_room">
						<select id="goods" onChange="change_goods(this.value)"
							class="frm-field required" name="type">
							<option value="0">所有商品</option>
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
			<div class="col-md-3 header-right footer-bottom before-login">
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
			<div class="col-md-3 header-right footer-bottom after-login"
				style="display:none;">
				<ul>
					<li><a href="private.jsp" class="use1"><span>个人信息</span></a></li>
					<li><a href="javascript:;" class="fb" onclick="quit()"><span >退出登录</span></a></li>
					<li><a class="twi" href="#"></a></li>
					<li><a class="insta" href="#"></a></li>
					<li><a class="you" href="#"></a></li>
				</ul>
				
			</div>
			<div class="col-md-3 header-right footer-bottom admin-login"
				style="display:none;">
				<ul>
					<li><a href="admin.jsp" class="use1"><span>管理后台</span></a></li>
					<li><a href="javascript:;" class="fb" onclick="quit()"><span >退出登录</span></a></li>
					<li><a class="twi" href="#"></a></li>
					<li><a class="insta" href="#"></a></li>
					<li><a class="you" href="#"></a></li>
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
							<span class="sr-only"></span> 导航栏<span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="menu__item"><a
								class="menu__link" href="index.jsp">首页</a></li>
							<li class=" menu__item"><a class="menu__link"
								href="search.jsp?keys=&type=1">Lenovo笔记本</a></li>
							<li class=" menu__item"><a class="menu__link"
								href="search.jsp?keys=&type=2">ThinkPad笔记本</a></li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<div class="cart box_1">
					<a class="menu_link" href="checkout.jsp">
						<h3>
							查看购物车

						</h3>
					</a>

				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //banner-top -->
	<!-- banner -->
	<div class="banner-grid">
		<div id="visual">
			<div class="slide-visual">
				<!-- 轮播（大图） (1000 x 424) -->
				<ul class="slide-group">
					<li><a href="single.jsp?computerName=lenovo1" ><img class="img-responsive" src="pictures/show/lenovo1_1000-424.jpg"
						alt="Dummy Image"/></a></li>
					<li><a href="single.jsp?computerName=IdeaPad100S" ><img class="img-responsive" src="pictures/show/ideapad1_1000-424.jpg"
						alt="Dummy Image" /></a></li>
					<li><a href="single.jsp?computerName=lenovo%20tianyi300" ><img class="img-responsive" src="pictures/show/tianyi1_1000-424.jpg"
						alt="Dummy Image" /></a></li>
				</ul>

				<!-- 轮播（小图） (316 x 328)
				<div class="script-wrap">
					<ul class="script-group">
						<li><div class="inner-script">
								<img class="img-responsive" src="pictures/show/lenovo1_1.jpg"
									alt="Dummy Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="pictures/show/ideapa1_1.jpg"
									alt="Dummy Image" />
							</div></li>
						<li><div class="inner-script">
								<img class="img-responsive" src="pictures/show/tianyi1_1.jpg"
									alt="Dummy Image" />
							</div></li>
					</ul>
					<div class="slide-controller">
						<a href="#" class="btn-prev"><img src="images/btn_prev.png"
							alt="Prev Slide" /></a> <a href="#" class="btn-play"><img
							src="images/btn_play.png" alt="Start Slide" /></a> <a href="#"
							class="btn-pause"><img src="images/btn_pause.png"
							alt="Pause Slide" /></a> <a href="#" class="btn-next"><img
							src="images/btn_next.png" alt="Next Slide" /></a>
					</div>
				</div> -->
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
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

	<div class="content-bottom">
		<div class="col-md-7 content-lgrid">
			<div class="col-sm-6 content-img-left text-center">
				<div class="content-grid-effect slow-zoom vertical">
					<div class="img-box">
						<img src="pictures/lenovo/xiaoxin1.jpg" alt="image"
							class="img-responsive zoom-img">
					</div>
					<div class="info-box">
						<div class="info-content simpleCart_shelfItem">
							<h4 class="item-name">小新310</h4>
							<span class="separator"></span>
							<p>
								<span class="item_price">经典版</span>
							</p>
							<span class="separator"></span> <a
								class="item_add hvr-outline-out button2" href="single.jsp?computerName=lenovo%20xiaoxin310">查看详情</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 content-img-right">
				<h3>
					双核处理器<span>天使白</span> 小新310经典版
				</h3>
			</div>

			<div class="col-sm-6 content-img-right">
				<h3>
					X1 Carbon<span> 让思考更坚定</span> ThinkPad X1
				</h3>
			</div>
		</div>
		<div class="col-md-5 content-rgrid text-center">
			<div class="content-grid-effect slow-zoom vertical">
				<div class="img-box">
					<img src="pictures/thinkpad/x11.jpg" alt="image"
						class="img-responsive zoom-img">
				</div>
				<div class="info-box">
					<div class="info-content simpleCart_shelfItem">
						<h4>ThinkPad X1</h4>
						<span class="separator"></span>
						<p>
							<span class="item_price">航天级碳纤维材质</span>
						</p>
						<span class="separator"></span> <a
							class="item_add hvr-outline-out button2" href="single.jsp?computerName=ThinkPad%20X1">查看详情 </a>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //content-bottom -->


	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-left">
				<h2>
					<a href="index.jsp"><img src="pictures/logo2.jpg" alt=" " /></a>
				</h2>
				<p>联想为用户提供安全及高品质的产品组合和服务， 包括个人电脑（经典的Think 品牌和多模式YOGA
					品牌）、工作站、服务器、存储、智能电视 以及智能手机（包括摩托罗拉品牌）、平板电脑和应用软件等一系列移动互联产品。</p>
			</div>
			<div class="col-md-9 footer-right">
				<div class="clearfix"></div>
				<div class="sign-grds">
					<div class="col-md-4 sign-gd">
						<h4>导航</h4>
						<ul>
							<li><a href="index.jsp">首页</a></li>
							<li><a href="search.jsp?key=&type=1">Lenovo笔记本</a></li>
							<li><a href="search.jsp?key=&type=2">ThinkPad</a></li>
						</ul>
					</div>

					<div class="col-md-4 sign-gd-two">
						<h4>有关联想</h4>
						<ul>
							<li><i class="glyphicon glyphicon-map-marker"
								aria-hidden="true"></i>地址: 中国北京海淀区上地创业路6号</li>
							<li><i class="glyphicon glyphicon-envelope"
								aria-hidden="true"></i>邮编: 100085</li>
							<li><i class="glyphicon glyphicon-earphone"
								aria-hidden="true"></i>电话 : (86) 10 5886-8888</li>
						</ul>
					</div>
					<div class="col-md-4 sign-gd flickr-post">
						<h4>特别推荐</h4>
						<ul>
							<!-- 修改地址 -->
							<li><a href="single.jsp?computerName=lenovo1"><img src="pictures/lenovo/lenovo1.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=IdeaPad100S"><img src="pictures/lenovo/ideapa1.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=lenovo%20tianyi300"><img src="pictures/lenovo/tianyi1.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=lenovo%20xiaoxin310"><img src="pictures/lenovo/xiaoxin1.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=lenovo%20Y700"><img src="pictures/lenovo/y7001.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=ThinkPad%20X1"><img src="pictures/thinkpad/x11.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=ThinkPad%20S5"><img src="pictures/thinkpad/s51.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=ThinkPad%20E560"><img src="pictures/thinkpad/e5601.jpg"
									alt=" " class="img-responsive" /></a></li>
							<li><a href="single.jsp?computerName=ThinkPad%20New%20S2"><img src="pictures/thinkpad/news21.jpg"
									alt=" " class="img-responsive" /></a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //footer -->
	<!-- login 登录-->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" >
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">登录页面</h3>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-grids">
						<div class="login">
							<div class="login-right">
								<form id="signinForm" role="form" class="form-horizontal"
									method="POST">
									<div class="sign-in form-group">
										<h4>账号 :</h4>
										<input type="text"  class="form-control" placeholder="在此输入账号" id="loginUsername"
											name="loginUsername">
									</div>
									<div class="sign-in form-group">
										<h4>密码 :</h4>
										<input type="password"  class="form-control" placeholder="密码" id="loginPassword"
											name="loginPassword"> <a href="forget.jsp">忘记密码?</a>
									</div>
									<div class="sign-in">
										<button id="signinButton" type="button"
											class="btn btn-primary btn-sm">登录</button>
										<button type="reset" class="btn btn-primary btn-sm"
											id="signinResetForm" style="display:none">重置</button>
									</div>
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	<!-- signin 注册-->
	<div class="modal fade" id="myModal4sign" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">注册页面</h3>
				</div>
				<div class="modal-body">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<!-- 验证表单输入是否为空 -->
								<form id="signupForm" role="form" class="form-horizontal"
									method="POST">
									<div class="sign-up form-group">
										<h4>账号 :</h4>
										<input class="form-control" type="text" placeholder="登录账号"
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
										<input class="form-control" type="text" placeholder="地址"
											id="address" name="address">
									</div>
									<div class="sign-up form-group">
										<h4>验证码 :</h4>
										<input class="form-control" type="text" placeholder="验证码"
											name="key">
										<button id="getKeys" type="button" class="btn btn-primary btn-sm">获取验证码</button>
									</div>
									<div class="sign-up form-group"  style="display:none">
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
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //signin -->
</body>
</html>
