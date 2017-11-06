package com.wez.sims.service;

import java.util.List;
import java.util.Map;

import com.wez.sims.entity.Result;

/**
 * 选课模块业务层接口
 * @author Admin
 *
 */
public interface SelectCourseService {

	/**
	 * 查询所有选课
	 * @return 返回查询结果
	 */
	public List<Map<String, Object>> queryStuSelectCourseForList();
	
	/**
	 * 根据学号查询该学生的选课记录
	 * @param stuId 学号
	 * @return 返回查询结果
	 */
	public List<Map<String, Object>> queryStuSelectCourseForStuId(String stuId);
	
	/**
	 * 添加选课
	 * @param stuId 学号
	 * @param courseIds 课程号
	 * @return 返回添加操作结果
	 */
	public Result saveSelectCourse(Integer stuId, Integer[] courseIds);
	
	/**
	 * 删除选课
	 * @param stuId 学号
	 * @param courseId 课程号
	 * @return 返回删除操作结果
	 */
	public Result removeSelectCourse(Integer stuId, Integer courseId);
	
}
