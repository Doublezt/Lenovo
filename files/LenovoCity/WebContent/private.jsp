<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String string = session.getAttribute("result").toString();
	String[] result = string.split(",");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人中心</title>

<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=basePath%>/bootstraptable/bootstrap-table.css">
<link rel="stylesheet"
	href="<%=basePath%>/bootstrap/css/custom-theme/jquery-ui-1.9.2.custom.css">
<!-- <link rel="stylesheet" href="<%=basePath%>/css/backstyle.css"> -->

<script src="<%=basePath%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=basePath%>/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/bootstrap/js/bootstrapQ.js"></script>
<script src="<%=basePath%>/bootstraptable/bootstrap-table.js"></script>
<script
	src="<%=basePath%>/bootstraptable/locale/bootstrap-table-zh-CN.js"></script>
<script src="<%=basePath%>/bootstrapValidator/js/bootstrapValidator.js"></script>

<script src="<%=basePath%>/bootstrapValidator/js/bootstrapValidator.js"></script>
<script src="<%=basePath%>/bootstrapValidator/js/language/zh_CN.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
					type : "POST",
					url : "middle/queryUser.jsp",
					data : {
						username:"<%=result[0]%>"
					},
					success : function(data) {
						//alert("success");
						//alert(data);
						eval('var obj=' + data);
						//var obj = data.split(",");
						//eval('var obj = ' + data);
						if (!obj) {
							obj = {};
						}
						$('#checkId').val(obj.id);//id
						$('#checkUserId').val(obj.userName);//用户名
						$('#checkName').val(obj.name);//姓名
						$('#checkEmail').val(obj.email);//邮箱
						$('#checkPhone').val(obj.phone);//电话
						$('#checkAddress').val(obj.addr);//地址*/
				}, //success
				error:function(){
					alert("error");
				}
			}); //ajax_end
			
			$("#back").click(function(){
				window.location.href="index.jsp";
			});
		
			$("#queryUser").click(function(){
				$.ajax({
					type : "POST",
					url : "middle/queryUser.jsp",
					data : {
						username:"<%=result[0]%>"
					},
					success : function(data) {
						//alert("success");
						//alert(data);
						eval('var obj=' + data);
						//var obj = data.split(",");
						//eval('var obj = ' + data);
						if (!obj) {
							obj = {};
						}
						$('#checkId').val(obj.id);//id
						$('#checkUserId').val(obj.userName);//用户名
						$('#checkName').val(obj.name);//姓名
						$('#checkEmail').val(obj.email);//邮箱
						$('#checkPhone').val(obj.phone);//电话
						$('#checkAddress').val(obj.addr);//地址*/
				}, //success
				error:function(){
					alert("error");
				}
			}); //ajax_end
			$("#tableOrder").css("display","none");
			$("#formUser").css("display","block");
			});//查询用户
			
			$("#queryOrder").click(function(){
				$("#formUser").hide();
				$("#tableOrder").show();
				$("#orderTable").bootstrapTable({
				method:'post',		//请求方式
				url:"middle/queryOrder.jsp", //后台的url
				striped : false, //行间隔色
				dataType : 'json', //期待返回数据类型
				locale : "zh-CN",
				pagination : true, //是否分页
				pageList : [ 5, 10, 15, 20 ], //可选每页行数
				pageSize : 10, //每页记录行数
				pageNumber : 1, //初始化加载第一页
				sidePagination : 'server', //分页方式
				queryParams : queryParams, //传递参数
				contentType : 'application/x-www-form-urlencoded', //请求数据内容格式
					});
				});//查询订单
				
				function queryParams(params){
					return params;
				};
				
				$("#edit").click(function(){
				$.ajax({
					type : "POST",
					url : "middle/queryUser.jsp",
					data : {
						username:"<%=result[0]%>"
					},
					success : function(data) {
						eval('var obj=' + data);
						if (!obj) {
							obj = {};
						}
						$('#id').val(obj.id);//id
						$('#userId').val(obj.userName);//用户名
						$('#password').val(obj.passWord);//密码
						$('#name').val(obj.name);//姓名
						$('#email').val(obj.email);//邮箱
						$('#phone').val(obj.phone);//电话
						$('#address').val(obj.addr);//地址*/
				}, //success
				error:function(){
					alert("error");
				}
			}); //ajax_end
			$("#editUser").hide();
			$("#tableOrder").css("display","none");
			$("#formUser").css("display","block");
			});//修改用户

				
				//编辑用户处理
				$('#editUser').modal({
					backdrop : false,
					keyboard : false,
					show : false
				});
				$("#editUser").on(
						"hide.bs.modal",
						function() {
							$(':input', '#userForm').not(
									':button, :submit, :reset, :hidden')
									.val('').removeAttr('checked').removeAttr(
											'selected');

							$('#userForm').data('bootstrapValidator')
									.resetForm();
						});
				$('.close').click(function() {
					$('#userForm').data('bootstrapValidator').resetForm();
				});
				$('#userForm').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						password : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								},
								stringLength : {
									min : 6,
									max : 18,
									message : '密码应为6~18位'
								}
							}
						},
						name : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
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
									message : '输入不能为空'
								},
								emailAddress : {
									message : '请输入正确邮箱'
								}
							}
						},
						phone : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
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
									message : '输入不能为空'
								}
							}
						}
					}
				});
				

				$("#editUserButton").click(function() {
					$('#userForm').data('bootstrapValidator').validate();
   					if($('#userForm').data('bootstrapValidator').isValid()){
    					$.ajax({
    					type: "POST",
    					url:"<%=basePath%>middle/editUser.jsp",
    					data:$("#userForm").serialize(),
    					success:function(data){
    						//alert("成功");
    						$("#editUser").hide();
							$("#tableOrder").css("display","none");
    						$("#formUser").css("display","block");
    					},
    					error:function(){
    						alert("修改失败");
    					}
    					});
    				}
    				else {
    					alert("检查不通过");
    				}
				});
				
			});//document_end
	function orderOperateFormatter(value, row, index) {
		return [ '<a class="remove ml10" href="javascript:void(0)" title="删除">',
				'<i class="glyphicon glyphicon-remove"></i>', '</a>' ].join('');
	};
	
	window.orderOperateEvents = {
		'click a.remove' : function(e, value, row, index) {
			bootstrapQ.confirm({
				title : "提示",
				msg : "确认删除此订单?"
			}, function() {
				$.ajax({
					type : "GET",
					url: "<%=basePath%>/middle/removeOrder.jsp",
					data : {
						id : row.id
					},
					success : function(data) {
						$("#orderTable").bootstrapTable('refresh');
					},
					error : function() {
						alert("删除失败");
					}
				});
			});
		}
	};//订单

	function load() {
		if (
<%=result[1]%>
	== "1") {
			;
		} else {
			window.location.href = "index.jsp";
		}
	};
</script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>

<body onload="load()" background="pictures/show/联想背景.jpeg">



	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div>
				<div class="form-inline" role="form">
					<form id="QueryForm">
						<a class="navbar-brand" href="#">联想官网</a>
						<a id="queryUser" class="navbar-brand">个人信息</a>
						 <a	id="queryOrder" class="navbar-brand">所有订单</a>
					</form>
				</div>
			

			<div>
				<p class="navbar-text  navbar-right ">
					欢迎<%=result[0]%>登录联想官网
				</p>
			</div>
		</div>
	</div>

	</nav>








	<div style="float: left; margin-left: 5%; width: 75%;" align="center">

		<div id="tableOrder" style="display: none">
			<table style="float: left; margin-left: 0%; width: 100%;"
				id="orderTable" class="table table-hover" data-height='624'
				data-pagination="true" data-toolbar="#custom-toolbar"
				data-click-to-select="true">
				<thead>
					<tr class="success">

						<th data-radio="true">i</th>
						<th data-field="userId" data-sortable="true">用户id</th>
						<th data-field="computerId" data-sortable="true">电脑id</th>
						<th data-field="date">订单时间</th>
						<th data-field="addr" data-sortable="true">收货地址</th>
						<th data-field="phone">联系电话</th>
						<th data-field=totalPrice>总金额</th>
						<th data-field="pay" data-sortable="true">订单状态</th>
						<th data-field="operation" data-formatter="orderOperateFormatter"
							data-events="orderOperateEvents">操作</th>
					</tr>
				</thead>

			</table>
		</div>
	</div>
	<br>
	<br>

	<div id="formUser">
		<table class="table">
			<tbody>
				<tr class="active">
					<td>id :</td>
					<td><input type="text" id="checkId"></td>

				</tr>
				<tr class="success">
					<td>账号 :</td>
					<td><input type="text" id="checkUserId" readonly></td>

				</tr>
				<tr class="warning">
					<td>姓名 :</td>
					<td><input type="text" id="checkName" readonly></td>

				</tr>
				<tr class="warning">
					<td>邮箱 :</td>
					<td><input type="text" id="checkEmail" readonly></td>

				</tr>
				<tr class="active">
					<td>电话 :</td>
					<td><input type="text" id="checkPhone" readonly></td>

				</tr>
				<tr class="active">
					<td>地址 :</td>
					<td><input type="text" id="checkAddress" readonly></td>

				</tr>
			</tbody>

		</table>
		<div>
			<button id="edit" type="button" class="btn btn-primary btn-sm"
				data-toggle="modal" data-target="#editUser">修改</button>
		</div>
	</div>
	
	
	
	<!-- 编辑用户-->
	<div class="modal fade" id="editUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">编辑用户</h3>
				</div>
				<div class="modal-body ">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<!-- 验证表单输入是否为空 -->
								<form id="userForm" role="form" class="form-horizontal"
									method="POST">
									<div class="sign-up form-group" style="display: none">
										<h4>id :</h4>
										<input class="form-control" type="text" id="id">
									</div>
									<div class="sign-up form-group">
										<h4>账号 :</h4>
										<input class="form-control" type="text" placeholder="账号"
											id="userId" name="userId" readonly>
									</div>
									<div class="sign-up form-group">
										<h4>密码:</h4>
										<input class="form-control" type="password" placeholder="密码"
											id="password" name="password">
									</div>
									<div class="sign-up form-group">
										<h4>姓名 :</h4>
										<input class="form-control" type="text" placeholder="姓名"
											id="name" name="name">
									</div>
									<div class="sign-up form-group">
										<h4>邮箱 :</h4>
										<input class="form-control" type="text" placeholder="邮箱"
											id="email" name="email">
									</div>
									<div class="sign-up form-group">
										<h4>电话 :</h4>
										<input class="form-control" type="text" placeholder="电话"
											id="phone" name="phone">
									</div>
									<div class="sign-up form-group">
										<h4>地址 :</h4>
										<input class="form-control" type="text" placeholder="地址"
											id="address" name="address">
									</div>
									<div class="sign-up">
										<button id="editUserButton" type="button"
											class="btn btn-primary btn-sm">确认</button>
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
	<!-- //编辑用户 -->
	
</body>
</html>
