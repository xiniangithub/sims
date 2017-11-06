<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
			<div id="selectCourse_list_content" style="display:none">
				<form action="/Article/checkAll" method="post" >
					<h1 class="page-header">操作</h1>
					<ol class="breadcrumb">
						<li>
							<a data-toggle="modal" data-target="#selectCourse">学生选课</a>
						</li>
					</ol>
					<h1 class="page-header">课程管理 <span class="badge">7</span></h1>
					<div class="table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>
										<span class="glyphicon glyphicon-th-large"></span>
									 	<span class="visible-lg">选择</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-th-large"></span>
										<span class="visible-lg">序号</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-user"></span>
										<span class="visible-lg">学生姓名</span>
									</th>
									<th class="hidden-sm">
										<span class="glyphicon glyphicon-book"></span>
										<span class="visible-lg">课程名</span>
									</th>
									<th>
										<span class="glyphicon glyphicon-pencil"></span>
										<span class="visible-lg">操作</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${selectCourseList }" var="sc" varStatus="status">
									<tr>
										<td><input type="checkbox" class="input-control" name="checkbox[]" value="" /></td>
										<td>${status.count }</td>
										<td>${sc.stuName }</td>
										<td>${sc.courseName }</td>
										<td>
											<a onclick="removeSelectCourse(${sc.stuId }, ${sc.courseId })" title="删除">
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
			<!--选课模态框-->
			<div class="modal fade" id="selectCourse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<form id="select_course_from">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" >选择课程</h4>
							</div>
							<div class="modal-body">
								<table class="table" style="margin-bottom:0px;">
									<thead>
										<tr>
											<td>学生姓名</td>
											<td>课程</td>
											<td>操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${stuList }" var="stu">
											<tr>
												<td wdith="15%">
													<input type="hidden" name="stuId" value="${stu.stuId }" />
													${stu.stuName }
												</td>
												<td width="75%">
													<c:forEach items="${courseList }" var="course">
														<input type="checkbox" class="form-control" name="courseName" value="${course.courseId }" autocomplete="off" />${course.courseName }
													</c:forEach>
												</td>
												<td wdith="10%">
													<button type="button" class="btn btn-primary" onclick="saveSelectCourse(this)">保存</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<script type="text/javascript">
				function saveSelectCourse(btnTag) {
					var trTag = $(btnTag).parent().parent();
					
					var stuId = trTag.find('input[name=stuId]').val();
					var courseCheckbox = trTag.find('input[type=checkbox]:checked');
					var courseIds = [];
					
					$.each(courseCheckbox, function(index, checkbox) {
						courseIds.push($(checkbox).val())
					});
					
					$.post(
						'${pageContext.request.contextPath}/selectCourse/saveSelectCourse',
						{'stuId': stuId, 'courseIds': courseIds},
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
						},
						'json'
					);
				}
				
				function removeSelectCourse(stuId, courseId) {
					console.log(stuId);
					console.log(courseId);
					$.post(
						'${pageContext.request.contextPath}/selectCourse/removeSelectCourse',
						{'stuId': stuId, 'courseId': courseId},
						function(result) {
							alert(result.message);
							window.location.href = '${pageContext.request.contextPath}/index/toIndex';
						},
						'json'
					);
				}
			</script>