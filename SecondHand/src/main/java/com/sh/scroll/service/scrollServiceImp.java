package com.sh.scroll.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.scroll.domain.ScrollDTO;
import com.sh.scroll.repository.scrollRepositoryI;

@Service
public class scrollServiceImp implements scrollServiceI {

	@Autowired
	scrollRepositoryI dao;

	@Override
	public int getTotalCnt() {
		return dao.totalCnt();
	}

	//인기순, 최신순, 관심상품
	@Override
	public List<ScrollDTO> getListScroll(int curpage, int pageSize, String mode) {
		return dao.getScroll(curpage, pageSize, mode);
	}

	//검색
	@Override
	public List<ScrollDTO> getSearchList(String searchTerm) {
		return dao.getSearchList(searchTerm);
	}

	//관심상품
	@Override
	public List<ScrollDTO> getLikeList(String userId) {
		return dao.getLikeList(userId);
	}
	
	//동네거래 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//동네거래 리스트
	@Override
	public List<ScrollDTO> getLocalProducts(int curpage, int pageSize, String mode, String detail_loc) {
		return dao.getLocalProducts(curpage, pageSize, mode, detail_loc);
	}
	
	//동네거래(게시글수)
	@Override
	public int localTotalCnt(String location) {
		return dao.localTotalCnt(location);
	}
	
	//판매중인 물건 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@Override
	public List<ScrollDTO> getSellProducts(String user_code) {
		return dao.getSellProducts(user_code);
	}
}
