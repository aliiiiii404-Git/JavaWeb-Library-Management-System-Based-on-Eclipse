package com.ghy.myworkplus.bean;

import java.util.List;

/**
 * 这是�?个用于封装了分页的数据�??
 * 里面包含�?
 * 
 * 		总的记录�?
 * 		总的页数
 * 		当前�?
 * 		每页显示的记录数
 *
 */
public class PageBean<T> {

	private int currentPage; //当前�?
	private int totalPage;//总页�?
	private int pageSize;//每页的记录数
	private int totalSize; //总的记录�?
	private List<T> list; //
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	
	
	
}

