package com.sh.scroll.service;

import java.util.List;

import com.sh.scroll.domain.ScrollDTO;

public interface scrollServiceI {
	//레코드 개수
	public int  getTotalCnt();
	
	//인기순, 최신순
	public List<ScrollDTO> getListScroll(int curpage, int pageSize, String mode);
	
	//검색
	List<ScrollDTO> getSearchList(String searchTerm);
	
	//관심상품
	public List<ScrollDTO> getLikeList(String userId);

	//동네거래 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//동네거래 리스트
	public List<ScrollDTO> getLocalProducts(int curpage, int pageSize, String mode,String detail_loc);

	//동네 레코드 개수
	public int  localTotalCnt(String location);
	
	//판매중인 물건 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public List<ScrollDTO> getSellProducts(String user_code);
}
