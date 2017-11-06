package com.wez.sims.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wez.sims.dao.StudentDao;
import com.wez.sims.entity.Result;
import com.wez.sims.entity.Student;
import com.wez.sims.service.StudentService;

/**
 * 业务层接口实现类
 * @author Admin
 *
 */
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentDao stuDao;
	
	public List<Student> queryStuForList() {
		return stuDao.queryStuForList();
	}
	
	public Student queryStuForId(Integer stuId) {
		return stuDao.queryStuForId(stuId);
	}

	public Result saveStudent(Student student) {
		int affectRows = stuDao.saveStudent(student);
		Result<Object> result = new Result<Object>();
		if(affectRows != 1) {
			result.setStatus(false);
			result.setMessage("保存失败！请重新操作。");
			return result;
		}
		result.setMessage("保存成功！");
		return result;
	}

	public Result<Object> modifyStudent(Student student) {
		int affectRows = stuDao.modifyStudent(student);
		Result<Object> result = new Result<Object>();
		if(affectRows != 1) {
			result.setStatus(false);
			result.setMessage("修改失败！请重新操作。");
			return result;
		}
		result.setMessage("修改成功！");
		return result;
	}

	public Result<Object> removeStudent(Integer stuId) {
		int affectRows = stuDao.removeStudent(stuId);
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
