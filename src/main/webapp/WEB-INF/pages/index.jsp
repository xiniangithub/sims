<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>异清轩博客管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/images/icon/icon.png">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/icon/favicon.ico">
<script src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script> 
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
	function showContent(str) {
		if(str == 'index') {
			$('#index_content').show();
			$('#list_content').hide();
		}
		if(str == 'list') {
			$('#index_content').hide();
			$('#list_content').show();
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
					<a class="navbar-brand" href="/">SIMS管理系统</a>
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
				<li><a class="nav-options" href="javascript:void(0)" onclick="showContent('list')">列表</a></li>
			</ul>
		</aside>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
			<!-- 首页内容 -->
			<div id="index_content">
				<h1 class="page-header">信息总览</h1>
				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>文章</h4>
						<span class="text-muted">0 条</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>评论</h4>
						<span class="text-muted">0 条</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>友链</h4>
						<span class="text-muted">0 条</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<h4>访问量</h4>
						<span class="text-muted">0</span>
					</div>
				</div>
			</div>
			
			<!-- 列表页内容 -->
			<div id="list_content" style="display:none">
				<form action="/Article/checkAll" method="post" >
					<h1 class="page-header">操作</h1>
					<ol class="breadcrumb">
						<li>
							<a data-toggle="modal" data-target="#addStuInfo">增加文章</a>
						</li>
					</ol>
					<h1 class="page-header">管理 <span class="badge">7</span></h1>
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>
										<span class="glyphicon glyphicon-th-large"></span>
									 	<span class="visible-lg">选择</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-file"></span>
										<span class="visible-lg">标题</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-list"></span>
										<span class="visible-lg">栏目</span>
									</th>
									<th class="hidden-sm">
										<span class="glyphicon glyphicon-tag"></span>
										<span class="visible-lg">标签</span>
									</th>
									<th class="hidden-sm">
										<span class="glyphicon glyphicon-comment"></span>
										<span class="visible-lg">评论</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-time"></span>
										<span class="visible-lg">日期</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-pencil"></span>
										<span class="visible-lg">操作</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td>
									<td class="article-title">这是测试的文章标题这是测试的文章标题这是测试的文章标题这是测试的文章标题</td>
									<td>这个是栏目</td>
									<td class="hidden-sm">PHP、JavaScript</td>
									<td class="hidden-sm">0</td>
									<td>2015-12-03</td>
									<td><a href="update-article.html">修改</a> <a rel="6">删除</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<footer class="message_footer">
						<nav>
							<div class="btn-toolbar operation" role="toolbar">
								<div class="btn-group" role="group">
									<a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a>
								</div>
								<div class="btn-group" role="group">
									<button type="submit" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
								</div>
							</div>
							<ul class="pagination pagenav">
								<li class="disabled"><a aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
							</ul>
						</nav>
       				</footer>
				</form>
			</div>
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
<!--添加信息模态框-->
<div class="modal fade" id="addStuInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<form action="" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" >添加学生</h4>
				</div>
				<div class="modal-body">
					<table class="table" style="margin-bottom:0px;">
						<tbody>
							<tr>
								<td wdith="20%">姓名:</td>
								<td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">性别:</td>
								<td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">出生日期:</td>
								<td width="80%"><input type="password" class="form-control" name="password" maxlength="18" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">邮箱:</td>
								<td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
							</tr>
							<tr>
								<td wdith="20%">电话:</td>
								<td width="80%"><input type="password" class="form-control" name="old_password" maxlength="18" autocomplete="off" /></td>
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
</body>
</html>
