package com.wez.sims.entity;

import java.util.List;

/**
 * 结果信息类
 * @author Administrator
 *
 */
public class Result<T> {

	/**
	 * 处理是否成功
	 * true：成功
	 * false：失败
	 * 默认是true
	 */
	private boolean status = true;
	
	/**
	 * 处理的结果消息
	 */
	private String message = "";
	
	/**
	 * 处理结果(单条结果时)
	 */
	private T t;
	
	/**
	 * 处理结果(多条结果时)
	 */
	private List<T> list;

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
}
