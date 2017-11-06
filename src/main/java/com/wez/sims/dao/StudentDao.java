package com.wez.sims.dao;

import java.util.List;

import com.wez.sims.entity.Student;

/**
 * 持久层接口
 * @author Admin
 *
 */
public interface StudentDao {

	/**
	 * 查询所有学生
	 * @return
	 */
	public List<Student> queryStuForList();
	
	/**
	 * 根据学号查询学生
	 * @param stuId 学号
	 * @return
	 */
	public Student queryStuForId(Integer stuId);
	
	/**
	 * 保存学生信息
	 * @param student 学生信息对象
	 * @return 返回保存处理结果
	 */
	public int saveStudent(Student student);
	
	/**
	 * 修改学生信息
	 * @param student 学生信息
	 * @return 返回修改处理结果
	 */
	public int modifyStudent(Student student);
	
	/**
	 * 删除学生信息
	 * @param stuId 学号
	 * @return 返回删除处理结果
	 */
	public int removeStudent(Integer stuId);
	
}
