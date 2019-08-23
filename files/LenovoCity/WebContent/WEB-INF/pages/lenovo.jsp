<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>联想系列电脑</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js"></script>
<!-- cart -->
<!-- for bootstrap working -->
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<link href='http://fonts.useso.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
<script src="js/jquery.easing.min.js"></script>
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
						<input type="search" placeholder="搜索">
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
			<div class="col-md-3 header-right footer-bottom"
				style="display:none;">
				<ul>
					<li><a href="private.jsp" class="use1"><span>个人信息</span></a></li>
					<li><a class="fb"><span>退出登录</span></a></li>
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
	<!-- banner -->
	<div class="page-head">
		<div class="container">
			<h3>Lenovo笔记本</h3>
		</div>
	</div>
	<!-- //banner -->
	<!-- Electronics -->
	<div class="electronics">
		<div class="container">
			<div class="col-md-8 electro-left text-center">
				<div class="electro-img-left mask">
					<div class="content-grid-effect slow-zoom vertical">
						<div class="img-box">
							<img src="images/watch.jpg" alt="image"
								class="img-responsive zoom-img">
						</div>
						<div class="info-box">
							<div class="info-content electro-text simpleCart_shelfItem">
								<h4>Branded Watches</h4>
								<span class="separator"></span>
								<p>
									<span class="item_price">$500</span>
								</p>
								<span class="separator"></span> <a
									class="item_add hvr-outline-out button2" href="#">add to
									cart </a>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-4 electro-right text-center">
				<div class="electro-img-rt mask">
					<div class="content-grid-effect slow-zoom vertical">
						<div class="img-box">
							<img src="images/e4.jpg" alt="image"
								class="img-responsive zoom-img">
						</div>
						<div class="info-box">
							<div class="info-content electro-text simpleCart_shelfItem">
								<h4>Mobiles</h4>
								<span class="separator"></span>
								<p>
									<span class="item_price">$500</span>
								</p>
								<span class="separator"></span> <a
									class="item_add hvr-outline-out button2" href="#">add to
									cart </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="ele-bottom-grid">
				<h3>
					<span>Latest </span>Collections
				</h3>
				<p>Sed ut perspiciatis unde omnis iste natus error sit
					voluptatem accusantium doloremque laudantium</p>
				<div class="col-md-3 product-men">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ph1.png" alt="" class="pro-image-front"> <img
								src="images/ph1.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Apple Iphone 6</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$500.99</span>
								<del>$700.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ph3.png" alt="" class="pro-image-front"> <img
								src="images/ph3.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Apple Iphone 6s</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$799.99</span>
								<del>$999.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ph2.png" alt="" class="pro-image-front"> <img
								src="images/ph2.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Apple Iphone 6</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$180.99</span>
								<del>$250.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ph4.png" alt="" class="pro-image-front"> <img
								src="images/ph4.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Apple Iphone 6s</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$179.99</span>
								<del>$200.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ep1.png" alt="" class="pro-image-front"> <img
								src="images/ep1.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">Combo Pack</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Watches</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$109.99</span>
								<del>$150.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ep2.png" alt="" class="pro-image-front"> <img
								src="images/ep2.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Watches</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$129.99</span>
								<del>$150.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ep3.png" alt="" class="pro-image-front"> <img
								src="images/ep3.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Watches</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$149.99</span>
								<del>$180.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ep4.png" alt="" class="pro-image-front"> <img
								src="images/ep4.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Watches</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$119.99</span>
								<del>$150.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ph1.png" alt="" class="pro-image-front"> <img
								src="images/ph1.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Apple Iphone 6</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$500.99</span>
								<del>$700.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ph3.png" alt="" class="pro-image-front"> <img
								src="images/ph3.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Apple Iphone 6s</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$799.99</span>
								<del>$999.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ep4.png" alt="" class="pro-image-front"> <img
								src="images/ep4.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">New</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Watches</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$119.99</span>
								<del>$150.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="col-md-3 product-men yes-marg">
					<div class="men-pro-item simpleCart_shelfItem">
						<div class="men-thumb-item">
							<img src="images/ep1.png" alt="" class="pro-image-front"> <img
								src="images/ep1.png" alt="" class="pro-image-back">
							<div class="men-cart-pro">
								<div class="inner-men-cart-pro">
									<a href="single.html" class="link-product-add-cart">Quick
										View</a>
								</div>
							</div>
							<span class="product-new-top">50% Off</span>

						</div>
						<div class="item-info-product ">
							<h4>
								<a href="single.html">Watches</a>
							</h4>
							<div class="info-product-price">
								<span class="item_price">$109.99</span>
								<del>$150.71</del>
							</div>
							<a href="#" class="item_add single-item hvr-outline-out button2">Add
								to cart</a>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //Electronics -->
	<!-- //product-nav -->
</body>
</html>
