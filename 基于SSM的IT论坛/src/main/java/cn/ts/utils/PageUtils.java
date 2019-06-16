package cn.ts.utils;

import java.util.List;

public class PageUtils<T> {

	private int pageNumber;
	private int pageCount;
	private int pageIndex;
	private int pageSize;
	private int pageStart;
	private List<T> list;
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "PageUtils [pageNumber=" + pageNumber + ", pageCount=" + pageCount + ", pageIndex=" + pageIndex
				+ ", pageSize=" + pageSize + ", pageStart=" + pageStart + ", list=" + list + "]";
	}
	
}
