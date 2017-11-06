package com.wez.sims.entity;

/**
 * 课程
 * @author Admin
 *
 */
public class Course {

	/**
	 * 课程号
	 */
	private Integer courseId;
	
	/**
	 * 课程名
	 */
	private String courseName;
	
	/**
	 * 学分
	 */
	private int credit;
	
	/**
	 * 课时
	 */
	private int classHour;

	public Course() {
		super();
	}

	public Course(Integer courseId, String courseName, int credit, int classHour) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.credit = credit;
		this.classHour = classHour;
	}

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getClassHour() {
		return classHour;
	}

	public void setClassHour(int classHour) {
		this.classHour = classHour;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName + ", credit=" + credit + ", classHour="
				+ classHour + "]";
	}
	
}
