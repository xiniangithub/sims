package com.wez.sims.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wez.sims.entity.Student;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-resource.xml") 
public class TestStudentDao {

	@Autowired
	private StudentDao stuDao;
	
	@Test
	public void testQueryStuForList() {
		List<Student> list = stuDao.queryStuForList();
		System.out.println(list);
	}
	
}
