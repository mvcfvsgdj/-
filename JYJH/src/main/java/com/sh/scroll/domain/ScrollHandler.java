package com.sh.scroll.domain;

public class ScrollHandler {
	int currentPage; //현재 페이지
	int totRecords; //총 레코드 수
	int pageSize; //페이지 사이즈(한페이지에 보이는 글의 수 )
	
	int totalPage;
	
	public ScrollHandler(int currentPage, int totRecords, int pageSize) {
		super();
		this.currentPage = currentPage;
		this.totRecords = totRecords;
		this.pageSize = pageSize;
		this.totalPage = (totRecords/pageSize)+1;
	}
	
	public ScrollHandler() {
	}
	
	
	// 현재 페이지
	public int getCurrentPage() {
		return currentPage;
	}
	
	// 현재 페이지 설정
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	// 총레코드수 
	public int getTotRecords() {
		return totRecords;
	}
	
	// 총 레코드 설정
	public void setTotRecords(int totRecords) {
		this.totRecords = totRecords;
	}
	
	// 페이지 사이즈 반환
	public int getPageSize() {
		return pageSize;
	}
	
	// 페이지 사이즈 설정
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	// 총 페이지 수 
	public int getTotalPage() {
		return totalPage;
	}
	
	// 총 페이지 수 설정
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	// 문자열 반환
	@Override
	public String toString() {
		return "PageHandler2 [currentPage=" + currentPage + ", totRecords=" + totRecords + ", pageSize=" + pageSize
				+ ", totalPage=" + totalPage + "]";
	}
}
