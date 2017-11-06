<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
			<div id="course_list_content" style="display:none">
				<form action="/Article/checkAll" method="post" >
					<h1 class="page-header">操作</h1>
					<ol class="breadcrumb">
						<li>
							<a data-toggle="modal" data-target="#addCourseInfo">增加课程</a>
						</li>
					</ol>
					<h1 class="page-header">课程管理 <span class="badge">7</span></h1>
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
										<span class="glyphicon glyphicon-book"></span>
										<span class="visible-lg">课程名</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-list"></span>
										<span class="visible-lg">学分</span>
									</th>
									<th class="hidden-sm">
										<span class="glyphicon glyphicon-time"></span>
										<span class="visible-lg">课时</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-pencil"></span>
										<span class="visible-lg">操作</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${courseList }" var="course" varStatus="status">
									<tr>
										<td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td>
										<td>${status.count }</td>
										<td>${course.courseName }</td>
										<td>${course.credit }</td>
										<td>${course.classHour }</td>
										<td>
											<a onclick="showModifyCourse(${course.courseId })" title="修改">
												<span class="glyphicon glyphicon-tag"></span>
											</a>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="removeCourse(${course.courseId })" title="删除">
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
			<!--添加课程信息模态框-->
			<div class="modal fade" id="addCourseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<form id="save_course_from">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" >添加课程</h4>
							</div>
							<div class="modal-body">
								<table class="table" style="margin-bottom:0px;">
									<tbody>
										<tr>
											<td wdith="20%">课程名:</td>
											<td width="80%"><input type="text" class="form-control" name="courseName" autocomplete="off" /></td>
										</tr>
										<tr>
											<td wdith="20%">学分:</td>
											<td width="80%"><input type="number" class="form-control" name="credit" autocomplete="off" /></td>
										</tr>
										<tr>
											<td wdith="20%">课时:</td>
											<td width="80%"><input type="number" class="form-control" name="classHour" autocomplete="off" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" onclick="saveCourse()">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--修改课程信息模态框-->
			<div class="modal fade" id="modifyCourseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<form id="modify_course_from">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" >修改课程信息</h4>
							</div>
							<div class="modal-body">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" onclick="modifyCourse()">保存</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<script type="text/javascript">
				function saveCourse() {
					$.post(
						'${pageContext.request.contextPath}/course/saveCourse',
						$('#save_course_from').serialize(),
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
						},
						'json'
					);
				}
				
				function showModifyCourse(courseId) {
					$.post(
						'${pageContext.request.contextPath}/course/queryCourseForId',
						{'courseId': courseId},
						function(result) {
							var div = $('#modifyCourseInfo #modify_course_from .modal-body');
							console.log(div);
							div.html('');
							
							var html = '';
							html += '<table class="table" style="margin-bottom:0px;">';
							html += '	<input type="hidden" name="courseId" value="'+result.courseId+'">';
							html += '	<tbody>';
							html += '		<tr>';
							html += '			<td wdith="20%">课程名:</td>';
							html += '			<td width="80%"><input type="text" class="form-control" name="courseName" value="'+result.courseName+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '		<tr>';
							html += '			<td wdith="20%">学分:</td>';
							html += '			<td width="80%"><input type="number" class="form-control" name="credit" value="'+result.credit+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '		<tr>';
							html += '			<td wdith="20%">课时:</td>';
							html += '			<td width="80%"><input type="number" class="form-control" name="classHour" value="'+result.classHour+'" autocomplete="off" /></td>';
							html += '		</tr>';
							html += '	</tbody>';
							html += '</table>';
							
							div.append(html);
						},
						'json'
					);
					
					$('#modifyCourseInfo').modal();
				}
				
				function modifyCourse() {
					$.post(
						'${pageContext.request.contextPath}/course/modifyCourse',
						$('#modify_course_from').serialize(),
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
				
				function removeCourse(courseId) {
					$.post(
						"${pageContext.request.contextPath }/course/removeCourse",
						{'courseId': courseId},
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
						},
						'json'
					);
				}
			</script>