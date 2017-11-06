<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap-table.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/icon/favicon.ico">
<script src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath }/js/admin-scripts.js"></script>
<script type="text/javascript">
	//是否确认删除
	$(function(){
		$("#main table tbody tr td a").click(function(){
			var name = $(this);
			var id = name.attr("rel"); //对应id  
			if (event.srcElement.outerText == "删除") {
				if(window.confirm("此操作不可逆，是否确认？")) {
					$.ajax({
						type: "POST",
						url: "/Article/delete",
						data: "id=" + id,
						cache: false, //不缓存此页面   
						success: function (data) {
							window.location.reload();
						}
					});
				};
			};
		});   
	});
	
	/* 导航列表显示 */
	function showContent(str) {
		if(str == 'index') {
			$('#index_content').show();
			$('#stu_list_content').hide();
			$('#course_list_content').hide();
			$('#selectCourse_list_content').hide();
			return ;
		}
		if(str == 'stuList') {
			$('#index_content').hide();
			$('#stu_list_content').show();
			$('#course_list_content').hide();
			$('#selectCourse_list_content').hide();
			return ;
		}
		if(str == 'courseList') {
			$('#index_content').hide();
			$('#stu_list_content').hide();
			$('#course_list_content').show();
			$('#selectCourse_list_content').hide();
			return ;
		}
		if(str == 'selectCourseList') {
			$('#index_content').hide();
			$('#stu_list_content').hide();
			$('#course_list_content').hide();
			$('#selectCourse_list_content').show();
			return ;
		}
	}
</script>
</head>

<body class="user-select">
<section class="container-fluid">
	<header>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
					<a class="navbar-brand" href="/">学生管理系统</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">admin <span class="caret"></span></a>
							<ul class="dropdown-menu dropdown-menu-left">
							  <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
							  <li><a title="查看您的登录记录" data-toggle="modal" data-target="#seeUserLoginlog">登录记录</a></li>
							</ul>
						</li>
						<li><a href="login.html" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
					</ul>
					<form action="" method="post" class="navbar-form navbar-right" role="search">
						<div class="input-group">
							<input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">搜索</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</nav>
	</header>
	<div class="row">
		<aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
			<ul class="nav nav-sidebar">
				<li class="active"><a href="javascript:void(0)" onclick="showContent('index')">首页</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a class="nav-options" href="javascript:void(0)" onclick="showContent('stuList')">学生列表</a></li>
				<li><a class="nav-options" href="javascript:void(0)" onclick="showContent('courseList')">课程列表</a></li>
				<li><a class="nav-options" href="javascript:void(0)" onclick="showContent('selectCourseList')">选课列表</a></li>
			</ul>
		</aside>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
			<!-- 首页内容 -->
			<div id="index_content">
				<h1 class="page-header">信息总览</h1>
				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>学生人数</h4>
						<span class="text-muted">${fn:length(stuList)} 人</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>课程数</h4>
						<span class="text-muted">${fn:length(courseList)} 门</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>选课数量</h4>
						<span class="text-muted">${fn:length(selectCourseList)} 个</span>
					</div>
				</div>
			</div>
			
			<!-- 学生列表页内容 -->
			<jsp:include page="stuList.jsp"></jsp:include>
			
			<!-- 课程列表页内容 -->
			<jsp:include page="courseList.jsp"></jsp:include>
			
			<!-- 选课列表页内容 -->
			<jsp:include page="selectCourseList.jsp"></jsp:include>
		</div>
	</div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<form action="" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" >个人信息</h4>
				</div>
				<div class="modal-body">
					<table class="table" style="margin-bottom:0px;">
						<tbody>
							<tr>
								<td wdith="20%">姓名:</td>
								<td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">用户名:</td>
								<td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">电话:</td>
								<td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">旧密码:</td>
								<td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">新密码:</td>
								<td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">确认密码:</td>
								<td width="80%"><input type="password" class="form-control" name="new_password" maxlength="18" autocomplete="off" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">提交</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" >登录记录</h4>
			</div>
			<div class="modal-body">
				<table class="table" style="margin-bottom:0px;">
					<thead>
						<tr>
							<th>登录IP</th>
							<th>登录时间</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>::1:55570</td>
							<td>2016-01-08 15:50:28</td>
							<td>成功</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
