package com.wez.sims.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wez.sims.entity.Result;
import com.wez.sims.entity.Student;
import com.wez.sims.service.StudentService;

/**
 * 学生管理控制器
 * @author Admin
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/student")
public class StudentController {

	@Autowired
	private StudentService stuService;
	
	/**
	 * 查询所有学生
	 * @return
	 */
	@RequestMapping("/queryStuForList")
	public @ResponseBody List<Student> queryStuForList() {
		return stuService.queryStuForList();
	}
	
	/**
	 * 根据学号查询学生
	 * @param stuId 学号
	 * @return
	 */
	@RequestMapping("/queryStuForId")
	public @ResponseBody Student queryStuForId(Integer stuId) {
		return stuService.queryStuForId(stuId);
	}
	
	/**
	 * 保存学生信息
	 * @param student 学生信息对象
	 * @return 返回保存处理结果
	 */
	@RequestMapping("/saveStudent")
	public @ResponseBody Result saveStudent(Student student) {
		Result<Object> result = stuService.saveStudent(student);
		return result;
	}
	
	/**
	 * 修改学生信息
	 * @param student 学生信息
	 * @return 返回修改处理结果
	 */
	@RequestMapping("/modifyStudent")
	public @ResponseBody Result modifyStudent(Student student) {
		return stuService.modifyStudent(student);
	}
	
	/**
	 * 删除学生信息
	 * @param stuId 学号
	 * @return 返回删除处理结果
	 */
	@RequestMapping("/removeStudent")
	public @ResponseBody Result removeStudent(Integer stuId) {
		return stuService.removeStudent(stuId);
	}
	
}
