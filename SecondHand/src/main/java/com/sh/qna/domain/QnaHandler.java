package com.sh.qna.domain;

import lombok.Data;

@Data
public class QnaHandler {

	int currentPage;	// 현재페이지
	int totRecords;		// 총 레코드 수
	int pageSize;		// 페이지 사이즈 (한 페이지에 보이는 글 수)
	int grpSize;		// 그룹의 사이즈
	
	int totalPage;		// 총 페이지 수
	int currentGrp;		// 현재 페이지 그룹
	int grpStartPage;	// 그룹의 시작 페이지
	int grpEndPage;		// 그룹의 끝 페이지 
	
	public QnaHandler(int currentPage, int totRecords, int pageSize, int grpSize) {
		super();
		this.currentPage = currentPage;
		this.totRecords = totRecords;
		this.pageSize = pageSize;
		this.grpSize = grpSize;
		calcPage();
	}
	
	public void calcPage() {
		
		// 총 페이지 수
		int remain = totRecords % pageSize;
		if(remain == 0 ) {
			totalPage = totRecords / pageSize;
		}else {
			totalPage = totRecords / pageSize + 1;
		}
		
		// 현재 그룹 구하기
		int remain2 = currentPage % grpSize;
		if(remain2 == 0) {
			currentGrp = currentPage / grpSize;
		}else {
			currentGrp = currentPage / grpSize +1;
		}
		
		// 현재 그룹 시작페이지, 마지막 페이지 구하기
		grpStartPage = ( currentGrp-1) * grpSize +1;
		grpEndPage = currentGrp * grpSize;
		if(grpEndPage > totalPage) {
			grpEndPage = totalPage;
		}
		
	}

	
	
}
