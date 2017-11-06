<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
			<div id="stu_list_content" style="display:none">
				<form action="/Article/checkAll" method="post" >
					<h1 class="page-header">操作</h1>
					<ol class="breadcrumb">
						<li>
							<a data-toggle="modal" data-target="#addStuInfo">增加学生</a>
						</li>
					</ol>
					<h1 class="page-header">学生管理 <span class="badge">7</span></h1>
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>
										<span class="glyphicon glyphicon-ok"></span>
									 	<span class="visible-lg">选择</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-th-large"></span>
									 	<span class="visible-lg">序号</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-user"></span>
										<span class="visible-lg">姓名</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-list"></span>
										<span class="visible-lg">性别</span>
									</th>
									<th class="hidden-sm">
										<span class="glyphicon glyphicon-time"></span>
										<span class="visible-lg">出生日期</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-earphone"></span>
										<span class="visible-lg">电话</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-envelope"></span>
										<span class="visible-lg">邮箱</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-pencil"></span>
										<span class="visible-lg">操作</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${stuList }" var="stu" varStatus="status">
									<tr>
										<td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td>
										<td>${status.count }</td>
										<td>${stu.stuName }</td>
										<td>${stu.gender eq 1 ? "男" : "女" }</td>
										<td>${stu.birthday }</td>
										<td>${stu.tel }</td>
										<td>${stu.email }</td>
										<td>
											<a onclick="showModifyStu(${stu.stuId })" title="修改">
												<span class="glyphicon glyphicon-tag"></span>
											</a>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="removeStudent(${stu.stuId })" title="删除">
												<span class="glyphicon glyphicon-trash"></span>
											</a>
										</td>
									</tr>
								</c:forEach>
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
			<!--添加学生信息模态框-->
			<div class="modal fade" id="addStuInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<form id="save_stu_from">
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
											<td width="80%"><input type="text" class="form-control" name="stuName" autocomplete="off" /></td>
										</tr>
										<tr>
											<td wdith="20%">性别:</td>
											<td width="80%">
												<input type="radio" class="form-control" name="gender" value="1" checked="checked" autocomplete="off" />男
												<input type="radio" class="form-control" name="gender" value="2" autocomplete="off" />女
											</td>
										</tr>
										<tr>
											<td wdith="20%">出生日期:</td>
											<td width="80%"><input type="date" class="form-control" name="birthday" autocomplete="off" /></td>
										</tr>
										<tr>
											<td wdith="20%">电话:</td>
											<td width="80%"><input type="text" class="form-control" name="tel" autocomplete="off" /></td>
										</tr>
										<tr>
											<td wdith="20%">邮箱:</td>
											<td width="80%"><input type="email" class="form-control" name="email" autocomplete="off" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" onclick="saveStudent()">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--修改学生信息模态框-->
			<div class="modal fade" id="modifyStuInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<form id="modify_stu_from">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" >修改学生信息</h4>
							</div>
							<div class="modal-body">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" onclick="modifyStudent()">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<script type="text/javascript">
				function saveStudent() {
					$.post(
						'${pageContext.request.contextPath}/student/saveStudent',
						$('#save_stu_from').serialize(),
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
						},
						'json'
					);
				}
				
				function showModifyStu(stuId) {
					$.post(
						'${pageContext.request.contextPath}/student/queryStuForId',
						{'stuId': stuId},
						function(result) {
							var div = $('#modifyStuInfo #modify_stu_from .modal-body');
							div.html('');
							
							var html = '';
							html += '<table class="table" style="margin-bottom:0px;">';
							html += '	<input type="hidden" name="stuId" value="'+result.stuId+'">';
							html += '	<tbody>';
							html += '		<tr>';
							html += '			<td wdith="20%">姓名:</td>';
							html += '			<td width="80%"><input type="text" class="form-control" name="stuName" value="'+result.stuName+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '		<tr>';
							html += '			<td wdith="20%">性别:</td>';
							html += '			<td width="80%">';
							html += '				<input type="radio" class="form-control" name="gender" value="1" '+(result.gender==1?'checked="checked"':'')+' autocomplete="off" />男';
							html += '				<input type="radio" class="form-control" name="gender" value="2" '+(result.gender==2?'checked="checked"':'')+' autocomplete="off" />女';
							html += '			</td>';
							html += '		</tr>';
							html += '		<tr>';
							html += '			<td wdith="20%">出生日期:</td>';
							html += '			<td width="80%"><input type="date" class="form-control" name="birthday" value="'+result.birthday+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '		<tr>';
							html += '			<td wdith="20%">电话:</td>';
							html += '			<td width="80%"><input type="text" class="form-control" name="tel" value="'+result.tel+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '		<tr>';
							html += '			<td wdith="20%">邮箱:</td>';
							html += '			<td width="80%"><input type="email" class="form-control" name="email" value="'+result.email+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '	</tbody>';
							html += '</table>';
							
							div.append(html);
						},
						'json'
					);
					
					$('#modifyStuInfo').modal();
				}
				
				function modifyStudent() {
					$.post(
						'${pageContext.request.contextPath}/student/modifyStudent',
						$('#modify_stu_from').serialize(),
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
							
							$('#index_content').hide();
							$('#stu_list_content').show();
							$('#course_list_content').hide();
							$('#selectCourse_list_content').hide();
						},
						'json'
					);
				}
				
				function removeStudent(stuId) {
					$.post(
						"${pageContext.request.contextPath }/student/removeStudent",
						{'stuId': stuId},
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
						},
						'json'
					);
				}
			</script>