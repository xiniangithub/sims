package com.wez.sims.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wez.sims.entity.Course;
import com.wez.sims.entity.Result;
import com.wez.sims.service.CourseService;

/**
 * 课程管理控制器
 * @author Admin
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	/**
	 * 查询所有课程
	 * @return
	 */
	@RequestMapping("/queryCourseForList")
	public @ResponseBody List<Course> queryCourseForList() {
		return courseService.queryCourseForList();
	}
	
	/**
	 * 根据课程号查询课程
	 * @param courseId 课程号
	 * @return
	 */
	@RequestMapping("/queryCourseForId")
	public @ResponseBody Course queryCourseForId(Integer courseId) {
		return courseService.queryCourseForId(courseId);
	}
	
	/**
	 * 保存课程信息
	 * @param course 课程信息对象
	 * @return 返回保存处理结果
	 */
	@RequestMapping("/saveCourse")
	public @ResponseBody Result saveCourse(Course course) {
		return courseService.saveCourse(course);
	}
	
	/**
	 * 修改课程信息
	 * @param course 课程信息
	 * @return 返回修改处理结果
	 */
	@RequestMapping("/modifyCourse")
	public @ResponseBody Result modifyCourse(Course course) {
		return courseService.modifyCourse(course);
	}
	
	/**
	 * 删除课程信息
	 * @param courseId 课程号
	 * @return 返回删除处理结果
	 */
	@RequestMapping("/removeCourse")
	public @ResponseBody Result removeCourse(Integer courseId) {
		return courseService.removeCourse(courseId);
	}
	
}
