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

<title>联想商城后台管理</title>

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
		
			function queryParams(params){
				return params;
			};
		
		$(document).ready(function(){
			$("#back").click(function(){
				window.location.href="index.jsp";
			});
			
			$("#queryComputer").click(function(){
				$("#computerTable").bootstrapTable({
				method:'post',		//请求方式
				url:"middle/queryComputer.jsp",					//后台的url
				striped:false,			//行间隔色
				dataType: 'json',	//期待返回数据类型
				locale:"zh-CN",
				pagination: true,	//是否分页
				pageList: [5,10,15,20],	//可选每页行数
				pageSize:10,	//每页记录行数
				pageNumber:1,	//初始化加载第一页
				sidePagination:'server',		//分页方式
				queryParams: queryParams,	//传递参数
				contentType:'application/x-www-form-urlencoded',	//请求数据内容格式
				
				}); 
				//$("#computerDiv").css("display","block");
				//$("#orderDiv").css("display","none");
				//$("#userDiv").css("display","none");
				$("#computerDiv").show();
				$("#orderDiv").hide();
				$("#userDiv").hide();
			});//查询电脑
			
			
			$("#queryUser").click(function(){
				$("#userTable").bootstrapTable({
				method:'post',		//请求方式
				url:"middle/queryUser.jsp",					//后台的url
				striped:false,			//行间隔色
				dataType: 'json',	//期待返回数据类型
				locale:"zh-CN",
				pagination: true,	//是否分页
				pageList: [5,10,15,20],	//可选每页行数
				pageSize:10,	//每页记录行数
				pageNumber:1,	//初始化加载第一页
				sidePagination:'server',		//分页方式
				queryParams: queryParams,	//传递参数
				contentType:'application/x-www-form-urlencoded',	//请求数据内容格式
				
				}); 
				//$("#computerDiv").css("display","none");
				//$("#orderDiv").css("display","none");
				//$("#userDiv").css("display","block");
				$("#computerDiv").hide();
				$("#orderDiv").hide();
				$("#userDiv").show();
				
			});//查询用户
			$("#queryOrder").click(function(){
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
				$("#computerDiv").css("display","none");
				$("#orderDiv").css("display","block");
				$("#userDiv").css("display","none");
				});//查询订单
				
				$("#addCoputer").click(function(){
					$("#resetComputer").show();
				})
				
				$("#addUser").click(function(){
					document.getElementById("userId").readOnly=false;
					document.getElementById("role").disabled=false;
					$("#resetUser").show();
				});

				//编辑电脑处理
				$('#editComputer').modal({
					backdrop : false,
					keyboard : false,
					show : false
				});
				$("#editComputer").on(
						"hide.bs.modal",
						function() {
							$(':input', '#computerForm').not(
									':button, :submit, :reset, :hidden')
									.val('').removeAttr('checked').removeAttr(
											'selected');

							$('#computerForm').data('bootstrapValidator')
									.resetForm();
						});
				$('#resetComputer').click(function() {
					$('#computerForm').data('bootstrapValidator').resetForm();
				});
				$('#computerForm').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						computerName : {
							validators : {
								notEmpty : {
									message : '电脑名不能为空'
								}
							}
						},
						price : {
							validators : {
								notEmpty : {
									message : '价格不能为空'
								}
							}
						},
						cpu : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						memory : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						harddisk : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						size : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						type : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						}
					}
				});

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
				$('#userForm').click(function() {
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
						userId : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								},
								stringLength : {
									min : 6,
									max : 20,
									message : '用户名应为6~20位'
								}
							}
						},
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
								integer : {
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
				
				//编辑订单操作
				$('#editOrder').modal({
					backdrop : false,
					keyboard : false,
					show : false
				});
				$("#editOrder").on(
						"hide.bs.modal",
						function() {
							$(':input', '#orderForm').not(
									':button, :submit, :reset, :hidden')
									.val('').removeAttr('checked').removeAttr(
											'selected');

							$('#orderForm').data('bootstrapValidator')
									.resetForm();
						});
				$('#resetOrder').click(function() {
					$('#orderForm').data('bootstrapValidator').resetForm();
				});
				$('#orderForm').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						orderUser : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						orderComputer : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						orderTime : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						orderAddress : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						orderPhone : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						},
						orderPrice : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								},
								integer:{
									message:'输入为整数'
								}
							}
						},
						orderState : {
							validators : {
								notEmpty : {
									message : '输入不能为空'
								}
							}
						}
					}
				});
				
				//上传图片
				$('#upload').modal({
					backdrop : false,
					keyboard : false,
					show : false
				});
				$("#upload").on(
						"hide.bs.modal",
						function() {
							$(':input', '#uploadForm').not(
									':button, :submit, :reset, :hidden')
									.val('').removeAttr('checked').removeAttr(
											'selected');

							$('#uploadForm').data('bootstrapValidator')
									.resetForm();
						});
				$('#resetUpload').click(function() {
					$('#uploadForm').data('bootstrapValidator').resetForm();
				});
				$('#uploadForm').bootstrapValidator({
					message : 'This value is not valid',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						uploadPicture1 : {
							validators : {
								notEmpty : {
									message : '不能为空'
								}
							}
						},
						uploadPicture2 : {
							validators : {
								notEmpty : {
									message : '不能为空'
								}
							}
						},
						uploadPicture3 : {
							validators : {
								notEmpty : {
									message : '不能为空'
								}
							}
						},
						uploadPicture4 : {
							validators : {
								notEmpty : {
									message : '不能为空'
								}
							}
						},
						imformationPicture : {
							validators : {
								notEmpty : {
									message : '不能为空'
								}
							}
						}
					}
				});

				$("#editComputerButton").click(function() {
					$('#computerForm').data('bootstrapValidator').validate();
   					if($('#computerForm').data('bootstrapValidator').isValid()){
    					$.ajax({
    					type: "POST",
    					url:"<%=basePath%>middle/editComputer.jsp",
    					data:$('#computerForm').serialize(),
    					success:function(data){
    						$("#computerTable").bootstrapTable('refresh');
    						$('#editComputer').modal("hide");
    					},
    					error:function(){
    						alert("添加失败");
    					}
    					});
    				}
    				else {
    					alert("检查不通过");
    				}
				});//提交编辑电脑
				$("#editUserButton").click(function() {
					$('#userForm').data('bootstrapValidator').validate();
   					if($('#userForm').data('bootstrapValidator').isValid()){
    					$.ajax({
    					type: "POST",
    					url:"<%=basePath%>middle/editUser.jsp",
    					data:$('#userForm').serialize(),
    					success:function(data){
    						$("#userTable").bootstrapTable('refresh');
    						$('#editUser').modal("hide");
    					},
    					error:function(){
    						alert("添加失败");
    					}
    					});
    				}
    				else {
    					alert("检查不通过");
    				}
				});//提交编辑用户
				$("#editOrderButton").click(function() {
					$('#orderForm').data('bootstrapValidator').validate();
   					if($('#orderForm').data('bootstrapValidator').isValid()){
    					$.ajax({
    					type: "POST",
    					url:"<%=basePath%>middle/editOrder.jsp",
    					data:$('#orderForm').serialize(),
    					success:function(data){
    						$("#orderTable").bootstrapTable('refresh');
    						$('#editOrder').modal("hide");
    					},
    					error:function(){
    						alert("添加失败");
    					}
    					});
    				}
    				else {
    					alert("检查不通过");
    				}
				});//提交编辑订单
				
				/*$("#uploadButton").click(function(){
					$.ajax({
    				type: "POST",
    				url:"uploadFile.jsp",
    				data:$('#uploadForm').serialize(),
    				success:function(data){
    					$("#computerTable").bootstrapTable('refresh');
    					$('#upload').modal("hide");
    				},
    				error:function(){
    					alert("上传失败");
    				}
    				});
				});*/
			});//document_end

	function computerOperateFormatter(value, row, index) {
		return [ '<a class="edit ml10" href="javascript:void(0)" title="编辑">',
				'<i class="glyphicon glyphicon-edit"></i>', '</a>',
				'<a class="upload ml10" href="javascript:void(0)" title="上传图片">',
				'<i class="glyphicon glyphicon-circle-arrow-up"></i>', '</a>',
				'<a class="remove ml10" href="javascript:void(0)" title="删除">',
				'<i class="glyphicon glyphicon-remove"></i>', '</a>' ].join('');
	};
	function userOperateFormatter(value, row, index) {
		return [ '<a class="edit ml10" href="javascript:void(0)" title="编辑">',
				'<i class="glyphicon glyphicon-edit"></i>', '</a>',
				'<a class="remove ml10" href="javascript:void(0)" title="删除">',
				'<i class="glyphicon glyphicon-remove"></i>', '</a>' ].join('');
	};
	function orderOperateFormatter(value, row, index) {
		return [ '<a class="edit ml10" href="javascript:void(0)" title="编辑">',
				'<i class="glyphicon glyphicon-edit"></i>', '</a>',
				'<a class="remove ml10" href="javascript:void(0)" title="删除">',
				'<i class="glyphicon glyphicon-remove"></i>', '</a>' ].join('');
	};
	window.computerOperateEvents = {

		'click a.edit' : function(e, value, row, index) {
			$("#resetComputer").hide();
			$.ajax({
				type : "POST",
				url : "middle/queryComputer.jsp",
				data : {
					computername : row.name
					//id:row.id
				},
				success : function(data) {
					var obj = eval(data)[0];
					if (!obj) {
						obj = {};
					}
					$('#editComputer').find('#computerId').val(obj.id);//id
					$('#editComputer').find('#computerName').val(obj.name);//电脑名
					//?$('#editComputer').find('#picture').val(obj.picture);//图片
					$('#editComputer').find('#price').val(obj.price);//价格
					$('#editComputer').find('#cpu').val(obj.cpu);//CPU
					$('#editComputer').find('#memory').val(obj.memory);//内存
					$('#editComputer').find('#harddisk').val(obj.hardDisk);//硬盘
					$('#editComputer').find('#size').val(obj.size);//尺寸
					$('#editComputer').find('#type').val(obj.type);//类型
					$('#editComputer').find('#launchdate').val(obj.launchDate);//类型
				} //success
			}); //ajax_end
			$("#editComputer").modal("show");
			//$("#userDiv").css("display","none");
			//$("#orderDiv").css("display","none");
			//$("#computerDiv").css("display","block");
		},
		'click a.upload' : function(e, value, row, index) {
			$("#temp").val(row.name);
			$("#upload").modal("show");
		},
		'click a.remove' : function(e, value, row, index) {
			//alert(row.id);
			bootstrapQ.confirm({
				title : "提示",
				msg : "确认删除此配置电脑?"
			}, function() {
				$.ajax({
					type : "GET",
					url : "middle/removeComputer.jsp",
					data : {
						id : row.id
					},
					success : function(data) {
						$("#computerTable").bootstrapTable('refresh');
					},
					error : function() {
						alert("删除失败");
					}
				});
			});
		}
	};//电脑
	window.userOperateEvents = {

		'click a.edit' : function(e, value, row, index) {
			document.getElementById("userId").readOnly=true;
			document.getElementById("role").disabled=true;
			$("#resetUser").hide();
			$.ajax({
				type : "POST",
				url : "middle/queryUser.jsp",
				data : {username : row.userName},
				success : function(data) {
					//alert("成功");
					//alert(data);
					eval('var obj = ' + data);
					//alert(obj.passWord);
					if (!obj) {
						obj = {};
					}
					$('#editUser').find('#id').val(obj.id);//id
					$('#editUser').find('#userId').val(obj.userName);//用户名
					$('#editUser').find('#password').val(obj.passWord);//密码
					$('#editUser').find('#name').val(obj.name);//姓名
					$('#editUser').find('#email').val(obj.email);//邮箱
					$('#editUser').find('#phone').val(obj.phone);//电话
					$('#editUser').find('#address').val(obj.addr);//地址
					$('#editUser').find('#role').val(obj.type);//角色
				}, //success
				error:function(){
					alert("error");
				}
			}); //ajax_end
			$("#editUser").modal("show");
			//$("#computerDiv").css("display","none");
			//$("#orderDiv").css("display","none");
			//$("#userDiv").css("display","block");
		},
		'click a.remove' : function(e, value, row, index) {
			bootstrapQ.confirm({
				title : "提示",
				msg : "确认删除此用户信息?"
			}, function() {
				$.ajax({
					type : "GET",
					url : "middle/removeUser.jsp",
					data : {username : row.userName},
					success : function(data) {
						$("#userTable").bootstrapTable('refresh');
					},
					error : function() {
						alert("删除失败");
					}
				});
			});
		}
	};//用户
	window.orderOperateEvents = {

		'click a.edit' : function(e, value, row, index) {
			//alert(row.computerId);
			//alert(row.userId);
			//alert(row.id);
			$.ajax({
				type : "POST",
				url : "middle/queryOrder.jsp",
				data : {
					//userId : row.userId,
					//computerId: row.computerId
					id:row.id
				},
				success : function(data) {
					//var obj = eval(data)[0];
					eval('var obj = ' + data);
					if (!obj) {
						obj = {};
					}
					$('#editOrder').find('#orderId').val(obj.id);//id
					$('#editOrder').find('#orderUser').val(obj.userId);//用户id
					$('#editOrder').find('#orderComputer').val(obj.computerId);//电脑id
					$('#editOrder').find('#orderTime').val(obj.date);//下单时间
					$('#editOrder').find('#orderAddress').val(obj.addr);//收货地址
					$('#editOrder').find('#orderPhone').val(obj.phone);//联系电话
					$('#editOrder').find('#orderPrice').val(obj.totalPrice);//总金额
					$('#editOrder').find('#orderState').val(obj.pay);//订单状态
				} //success
			}); //ajax_end
			$("#editOrder").modal("show");
			//$("#computerDiv").css("display","none");
			//$("#userDiv").css("display","none");
			//$("#orderDiv").css("display","block");
		},
		'click a.remove' : function(e, value, row, index) {
			bootstrapQ.confirm({
				title : "提示",
				msg : "确认删除此订单?"
			}, function() {
				$.ajax({
					type : "GET",
					url : "middle/removeOrder.jsp",
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
	
	function load(){
		if(<%=result[1]%>=="2"){
		;
		}else{
			window.location.href="index.jsp";
		}
	};
</script>
</head>

<body onload="load()">


<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
			<div class="form-inline" role="form">
				<form id="QueryForm">
					<a class="navbar-brand" href="#"  >联想官网</a>
					<a id="queryComputer" class="navbar-brand" >电脑信息</a>
					<a id="queryUser" class="navbar-brand" >用户信息</a>
					<a id="queryOrder" class="navbar-brand">订单信息</a>
					<a id="addComputer" class="navbar-brand"
						data-toggle="modal" data-target="#editComputer">上传电脑</a>
					<a id="addUser" class="navbar-brand"
						data-toggle="modal" data-target="#editUser">添加用户</a>
				</form>
				</div>
			

			<div>
				<p class="navbar-brand  navbar-right ">
					欢迎<%=result[0]%>登录联想官网
				</p>
			</div>
		
	</div>
</nav>




	<div style="float:left;margin-left:5%;width:75%;">

		<div id="computerDiv" style="display:none">
			<table style="float:left;margin-left:0%;width:100%;"
				id="computerTable" class="table table-hover" data-height='624'
				data-pagination="true" data-toolbar="#custom-toolbar"
				data-click-to-select="true" >
				<thead>
					<tr class="success">

						<th data-radio="true">i</th>
						<th data-field="name" data-sortable="true">电脑名称</th>
						<!--<th data-field="picture" data-sortable="true">电脑图片</th>-->
						<th data-field="price">价格</th>
						<th data-field="cpu" data-sortable="true">CPU</th>
						<th data-field="memory">内存</th>
						<th data-field="hardDisk" data-sortable="true">硬盘</th>
						<th data-field="size" data-sortable="true">尺寸</th>
						<th data-field="type" data-sortable="true">类型</th>
						<th data-field="launchDate" data-sortable="true">上架日期</th>
						<!--<th data-field="imformation" data-sortable="true">商品详情</th>-->
						<th data-field="operation"
							data-formatter="computerOperateFormatter"
							data-events="computerOperateEvents">操作</th>
					</tr>
				</thead>

			</table>
		</div>
		<div id="userDiv" style="display:none">
			<table style="float:left;margin-left:0%;width:100%;" id="userTable"
				class="table table-hover" data-height='624' data-pagination="true"
				data-toolbar="#custom-toolbar" data-click-to-select="true">
				<thead>
					<tr class="success">

						<th data-radio="true">i</th>
						<th data-field="userName" data-sortable="true">用户名</th>
						<th data-field="passWord" data-sortable="true">密码</th>
						<th data-field="name">姓名</th>
						<th data-field="email" data-sortable="true">邮箱</th>
						<th data-field="phone">电话</th>
						<th data-field="addr" data-sortable="true">地址</th>
						<th data-field="type" data-sortable="true">角色</th>
						<th data-field="operation" data-formatter="userOperateFormatter"
							data-events="userOperateEvents">操作</th>
					</tr>
				</thead>

			</table>
		</div>
		<div id="orderDiv" style="display:none">
			<table style="float:left;margin-left:0%;width:100%;" id="orderTable"
				class="table table-hover" data-height='624' data-pagination="true"
				data-toolbar="#custom-toolbar" data-click-to-select="true">
				<thead>
					<tr class="success">

						<th data-radio="true">i</th>
						<th data-field="userId" data-sortable="true">用户id</th>
						<th data-field="computerId" data-sortable="true">电脑id</th>
						<th data-field="date">订单时间</th>
						<th data-field="addr" data-sortable="true">收货地址</th>
						<th data-field="phone">联系电话</th>
						<th data-field="totalPrice">订单金额</th>
						<th data-field="pay" data-sortable="true">订单状态</th>
						<th data-field="operation" data-formatter="orderOperateFormatter"
							data-events="orderOperateEvents">操作</th>
					</tr>
				</thead>

			</table>
		</div>
	</div>
	
	
	<!-- 编辑/添加电脑 -->
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<div class="modal fade" id="editComputer" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"
			style="width: 300px; height: 270px; margin-left: 50%; margin-top: 550px;">
			<div class="modal-content">
				<div class="modal-header myModal-header">
					<button type="button" class="close myModal-header-close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title myModal-header-font" id="myModalLabel">编辑/添加电脑</h4>
				</div>

				<div class="modal-body myModal-body">
					
					<!-- 验证表单输入是否为空 -->
								<form id="computerForm"  role="form" class="form-horizontal"
									method="POST">
									<div class="sign-up form-group" style="display:none">
										<h4>id :</h4>
										<input class="form-control" type="text" id="computerId" name="computerId">
									</div>
									<div class="sign-up form-group">
										<h4>电脑名称 :</h4>
										<input class="form-control" type="text" placeholder="电脑名" id="computerName" name="computerName">
									</div>
									<div class="sign-up form-group" >
										<h4>电脑价格:</h4>
										<input class="form-control" type="text" placeholder="价格" id="price" name="price">
									</div>
									<div class="sign-up form-group">
										<h4>CPU :</h4>
										<input class="form-control" type="text" placeholder="CPU" id="cpu" name="cpu">
									</div>
									<div class="sign-up form-group">
										<h4>内存 :</h4>
										<input class="form-control" type="text" placeholder="内存" id="memory" name="memory">
									</div>
									<div class="sign-up form-group">
										<h4>硬盘 :</h4>
										<input class="form-control" type="text" placeholder="硬盘" id="harddisk" name="harddisk">
									</div>
									<div class="sign-up form-group">
										<h4>尺寸 :</h4>
										<input class="form-control" type="text" placeholder="尺寸" id="size" name="size">
									</div>
									<div class="sign-up form-group">
										<h4>类型 :</h4>
										<select class="form-control" id="type" name="type">
													<!-- <option value="0">未选择</option> -->
							         				<option value="1">普通学生本</option>
							         				<option value="2">ThinkPad商务本</option>
		   	 										<option value="3">游戏本</option>
		   	 							</select>
										<!-- <input class="form-control" type="text" placeholder="类型" id="type" name="type">
										-->
									</div>
									
									<div class="sign-up">
										<button id="editComputerButton" type="button"
											class="btn btn-primary btn-sm">确认提交</button>
										
									</div>
								</form>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	



<!-- 添加/编辑用户 -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<div class="modal fade" id="editUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document"
			style="width: 300px; height: 270px; margin-left: 50%; margin-top: 550px;">
			<div class="modal-content">
				<div class="modal-header myModal-header">
					<button type="button" class="close myModal-header-close"
						data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title myModal-header-font" id="myModalLabel">编辑/添加用户</h4>
				</div>

				<div class="modal-body myModal-body">
					
					<!-- 验证表单输入是否为空 -->
								<form id="userForm" role="form" class="form-horizontal"
									method="POST">
									<div class="sign-up form-group" style="display:none">
										<h4>id :</h4>
										<input class="form-control" type="text" id="id" name="id">
									</div>
									<div class="sign-up form-group">
										<h4>账号 :</h4>
										<input class="form-control" type="text" placeholder="账号" id="userId" name="userId" readonly>
									</div>
									<div class="sign-up form-group">
										<h4>密码:</h4>
										<input class="form-control" type="password" placeholder="密码" id="password" name="password">
									</div>
									<div class="sign-up form-group">
										<h4>姓名 :</h4>
										<input class="form-control" type="text" placeholder="姓名" id="name" name="name">
									</div>
									<div class="sign-up form-group">
										<h4>邮箱 :</h4>
										<input class="form-control" type="text" placeholder="邮箱" id="email" name="email">
									</div>
									<div class="sign-up form-group">
										<h4>电话 :</h4>
										<input class="form-control" type="text" placeholder="电话" id="phone" name="phone">
									</div>
									<div class="sign-up form-group">
										<h4>地址 :</h4>
										<input class="form-control" type="text" placeholder="地址" id="address" name="address">
									</div>
									<div class="sign-up form-group">
										<h4>角色 :</h4>
										<select class="form-control" id="role" name="role">
													<!-- <option value="0">未选择</option> -->
							         				<option value="1">普通用户</option>
		   	 										<option value="2">管理员</option>
		   	 							</select>
										<!-- <input class="form-control" type="text" placeholder="角色" id="role" name="role">-->
									</div>
									<div class="sign-up">
										<button id="editUserButton" type="button"
											class="btn btn-primary btn-sm">确认提交</button>
										
									</div>
								</form>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

<!-- //添加/编辑用户 -->

	
	<!-- 编辑订单 -->
	<div class="modal fade" id="editOrder" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">编辑订单</h3>
				</div>
				<div class="modal-body">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<!-- 验证表单输入是否为空 -->
								<form id="orderForm" role="form" class="form-horizontal"
									method="POST">
									<div class="sign-up form-group" style="display:none">
										<h4>id :</h4>
										<input  class="form-control" type="text" id="orderId" name="orderId">
									</div>
									<div class="sign-up form-group">
										<h4>用户id :</h4>
										<input  class="form-control"  type="text" placeholder="用户id" id="orderUser" name="orderUser" readonly>
									</div>
									<div class="sign-up form-group">
										<h4>电脑id:</h4>
										<input  class="form-control"  type="text" placeholder="电脑id" id="orderComputer" name="orderComputer" readonly>
									</div>
									<div class="sign-up form-group">
										<h4>下单时间 :</h4>
										<input class="form-control"  type="text" placeholder="下单时间" id="orderTime" name="orderTime" readonly>
									</div>
									<div class="sign-up form-group">
										<h4>收货地址 :</h4>
										<input  class="form-control" type="text" placeholder="地址" id="orderAddress" name="orderAddress">
									</div>
									<div class="sign-up form-group">
										<h4>联系电话 :</h4>
										<input  class="form-control" type="text" placeholder="电话" id="orderPhone" name="orderPhone">
									</div>
									<div class="sign-up form-group">
										<h4>总金额 :</h4>
										<input  class="form-control" type="text" placeholder="总金额" id="orderPrice" name="orderPrice" readonly>
									</div>
									<div class="sign-up form-group">
										<h4>状态 :</h4>
										<select class="form-control" id="orderState" name="orderState">
													<!-- <option value="0">未选择</option> -->
							         				<option value="0">未付款</option>
		   	 										<option value="1">已付款</option>
		   	 							</select>
										<!-- <input  class="form-control"  type="text" placeholder="订单状态" id="orderState" name="orderState">
										-->
									</div>
									<div class="sign-up">
										<button id="editOrderButton" type="button"
											class="btn btn-primary btn-sm">确认</button>
										<button type="reset" class="btn btn-primary btn-sm"
											id="resetOrder" style="display:none">重置</button>
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
	<!-- //编辑订单 -->
	<!-- 上传图片 -->
	<div class="modal fade" id="upload" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="myModalLabel">上传图片</h3>
				</div>
				<div class="modal-body">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<form id="uploadForm" role="form" class="form-horizontal"
									method="POST" enctype="multipart/form-data" action="uploadFile.jsp">
									<div class="sign-up form-group"  >
										<h4>电脑名称 :</h4>
										<input class="form-control" type="text" id="temp" value="">
									</div>
									<div class="sign-up form-group" >
										<h4>电脑图片1 :</h4>
										<input  class="form-control" type="file" id="uploadPicture1" name="uploadPicture1">
									</div>
									<div class="sign-up form-group" >
										<h4>电脑图片2 :</h4>
										<input  class="form-control" type="file" id="uploadPicture2" name="uploadPicture2">
									</div>
									<div class="sign-up form-group" >
										<h4>电脑图片3 :</h4>
										<input  class="form-control" type="file" id="uploadPicture3" name="uploadPicture3">
									</div>
									<div class="sign-up form-group" >
										<h4>电脑图片4 :</h4>
										<input  class="form-control" type="file" id="uploadPicture4" name="uploadPicture4">
									</div>
									<div class="sign-up form-group" ">
										<h4>电脑详情 :</h4>
										<input  class="form-control" type="file" id="imformationPicture" name="imformationPicture">
									</div>
									<div class="sign-up">
										<button id="uploadButton" type="submit"
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
	<!-- //编辑订单 -->
</body>
</html>
