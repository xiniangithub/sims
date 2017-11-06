package com.wez.sims.dao;

import java.util.List;

import com.wez.sims.entity.Course;

/**
 * 持久层接口
 * @author Admin
 *
 */
public interface CourseDao {

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
	public int saveCourse(Course course);
	
	/**
	 * 修改课程信息
	 * @param course 课程信息
	 * @return 返回修改处理结果
	 */
	public int modifyCourse(Course course);
	
	/**
	 * 删除课程信息
	 * @param courseId 课程号
	 * @return 返回删除处理结果
	 */
	public int removeCourse(Integer courseId);
	
}
