package com.wez.sims.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wez.sims.entity.Course;
import com.wez.sims.entity.Student;
import com.wez.sims.service.CourseService;
import com.wez.sims.service.SelectCourseService;
import com.wez.sims.service.StudentService;

@Controller
@Scope("prototype")
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private StudentService stuService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private SelectCourseService selectCourseService;
	
	@RequestMapping("/toIndex")
	public ModelAndView toIndex() {
		ModelAndView mav = new ModelAndView("index");
		
		List<Student> stuList = stuService.queryStuForList();
		mav.addObject("stuList", stuList);
		
		List<Course> courseList = courseService.queryCourseForList();
		mav.addObject("courseList", courseList);
		
		List<Map<String,Object>> selectCourseList = selectCourseService.queryStuSelectCourseForList();
		mav.addObject("selectCourseList", selectCourseList);
		
		return mav;
	}
	
}
