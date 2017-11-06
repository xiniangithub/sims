package com.wez.sims.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wez.sims.dao.CourseDao;
import com.wez.sims.entity.Course;
import com.wez.sims.entity.Result;
import com.wez.sims.service.CourseService;

/**
 * 业务层接口实现类
 * @author Admin
 *
 */
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;
	
	public List<Course> queryCourseForList() {
		return courseDao.queryCourseForList();
	}
	
	public Course queryCourseForId(Integer courseId) {
		return courseDao.queryCourseForId(courseId);
	}

	public Result saveCourse(Course course) {
		int affectRows = courseDao.saveCourse(course);
		Result<Object> result = new Result<Object>();
		if(affectRows != 1) {
			result.setStatus(false);
			result.setMessage("保存失败！请重新操作。");
			return result;
		}
		result.setMessage("保存成功！");
		return result;
	}

	public Result<Object> modifyCourse(Course course) {
		int affectRows = courseDao.modifyCourse(course);
		Result<Object> result = new Result<Object>();
		if(affectRows != 1) {
			result.setStatus(false);
			result.setMessage("修改失败！请重新操作。");
			return result;
		}
		result.setMessage("修改成功！");
		return result;
	}

	public Result<Object> removeCourse(Integer courseId) {
		int affectRows = courseDao.removeCourse(courseId);
		Result<Object> result = new Result<Object>();
		if(affectRows != 1) {
			result.setStatus(false);
			result.setMessage("删除失败！请重新操作。");
			return result;
		}
		result.setMessage("删除成功！");
		return result;
	}

}
