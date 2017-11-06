package com.wez.sims.dao;

import java.util.List;
import java.util.Map;

/**
 * 持久层接口
 * @author Admin
 *
 */
public interface SelectCourseDao {

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
	 * @param param 参数
	 * @return 返回影响行数
	 */
	public int saveSelectCourse(Map<String, Object> param);
	
	/**
	 * 删除选课
	 * @param param 参数
	 * @return 返回影响行数
	 */
	public int removeSelectCourse(Map<String, Object> param);
	
}
