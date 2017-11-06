package com.wez.sims.entity;

import java.util.Date;

/**
 * 学生
 * @author Admin
 *
 */
public class Student {

	private Integer stuId;
	private String stuName;
	private String gender;
	private String birthday;
	private String tel;
	private String email;
	
	public Student() {
		super();
	}
	
	public Student(Integer stuId, String stuName, String gender, String birthday, String tel, String email) {
		super();
		this.stuId = stuId;
		this.stuName = stuName;
		this.gender = gender;
		this.birthday = birthday;
		this.tel = tel;
		this.email = email;
	}

	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "Student [stuId=" + stuId + ", stuName=" + stuName + ", gender=" + gender + ", birthday=" + birthday
				+ ", tel=" + tel + ", email=" + email + "]";
	}
}
