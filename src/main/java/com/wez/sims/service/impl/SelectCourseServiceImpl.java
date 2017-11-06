package com.wez.sims.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wez.sims.dao.SelectCourseDao;
import com.wez.sims.entity.Result;
import com.wez.sims.service.SelectCourseService;

/**
 * 业务层接口实现类
 * @author Admin
 *
 */
@Service
public class SelectCourseServiceImpl implements SelectCourseService {

	@Autowired
	private SelectCourseDao selectCourseDao;
	
	/**
	 * 查询所有选课
	 */
	public List<Map<String, Object>> queryStuSelectCourseForList() {
		return selectCourseDao.queryStuSelectCourseForList();
	}
	
	/**
	 * 根据学号查询该学生的选课记录
	 */
	public List<Map<String, Object>> queryStuSelectCourseForStuId(String stuId) {
		return selectCourseDao.queryStuSelectCourseForStuId(stuId);
	}
	
	/**
	 * 添加选课
	 */
	public Result saveSelectCourse(Integer stuId, Integer[] courseIds) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stuId", stuId);
		param.put("courseIds", courseIds);
		
		int affectRows = selectCourseDao.saveSelectCourse(param);
		
		Result<Object> result = new Result<Object>();
		if(affectRows == 0) {
			result.setStatus(false);
			result.setMessage("选课失败，请重新操作！");
			return result;
		}
		result.setMessage("选课成功！");
		return result;
	}
	
	/**
	 * 删除选课
	 */
	public Result removeSelectCourse(Integer stuId, Integer courseId) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("stuId", stuId);
		param.put("courseId", courseId);
		
		int affectRows = selectCourseDao.removeSelectCourse(param);
		
		Result<Object> result = new Result<Object>();
		if(affectRows != 1) {
			result.setStatus(false);
			result.setMessage("删除失败，请重新操作！");
			return result;
		}
		result.setMessage("删除成功！");
		return result;
	}

}
