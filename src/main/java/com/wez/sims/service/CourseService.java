package com.wez.sims.service;

import java.util.List;

import com.wez.sims.entity.Course;
import com.wez.sims.entity.Result;

/**
 * 业务层接口
 * @author Admin
 *
 */
public interface CourseService {

	/**
	 * 查询所有课程
	 * @return
	 */
	public List<Course> queryCourseForList();
	
	/**
	 * 根据课程号查询课程
	 * @param courseId 课程号
	 * @return
	 */
	public Course queryCourseForId(Integer courseId);
	
	/**
	 * 保存课程信息
	 * @param course 课程信息对象
	 * @return 返回保存处理结果
	 */
	public Result<Object> saveCourse(Course course);
	
	/**
	 * 修改课程信息
	 * @param course 课程信息
	 * @return 返回修改处理结果
	 */
	public Result<Object> modifyCourse(Course course);
	
	/**
	 * 删除课程信息
	 * @param courseId 课程号
	 * @return 返回删除处理结果
	 */
	public Result<Object> removeCourse(Integer courseId);
	
}
