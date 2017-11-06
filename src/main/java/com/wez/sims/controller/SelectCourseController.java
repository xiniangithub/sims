package com.wez.sims.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wez.sims.entity.Result;
import com.wez.sims.service.SelectCourseService;

/**
 * 选课控制器
 * @author Admin
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/selectCourse")
public class SelectCourseController {

	@Autowired
	private SelectCourseService selectCourseService;
	
	/**
	 * 查询所有选课
	 * @return 返回查询结果
	 */
	@RequestMapping("/queryStuSelectCourseForList")
	public @ResponseBody List<Map<String, Object>> queryStuSelectCourseForList() {
		return selectCourseService.queryStuSelectCourseForList();
	}
	
	/**
	 * 根据学号查询该学生的选课记录
	 * @param stuId 学号
	 * @return 返回查询结果
	 */
	@RequestMapping("/queryStuSelectCourseForStuId")
	public @ResponseBody List<Map<String, Object>> queryStuSelectCourseForStuId(String stuId) {
		
		return null;
	}
	
	/**
	 * 添加选课
	 * @param stuId 学号
	 * @param courseIds 课程号
	 * @return 返回添加操作结果
	 */
	@RequestMapping("/saveSelectCourse")
	public @ResponseBody Result saveSelectCourse(
			Integer stuId,
			@RequestParam("courseIds[]") Integer[] courseIds) {
		return selectCourseService.saveSelectCourse(stuId, courseIds);
	}
	
	/**
	 * 删除选课
	 * @param stuId 学号
	 * @param courseId 课程号
	 * @return 返回删除操作结果
	 */
	@RequestMapping("/removeSelectCourse")
	public @ResponseBody Result removeSelectCourse(Integer stuId, Integer courseId) {
		return selectCourseService.removeSelectCourse(stuId, courseId);
	}
}
