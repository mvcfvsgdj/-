package com.sh.login.service;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginServiceI {
	
	//로그인 여부확인
	public boolean checkLogin(LoginDTO loginDTO);
	// 로그인 정보 조회
	LoginDTO getLoginDTO(String userId);
	// 유저 정보수정
	public int updateUser(LoginDTO loginDTO);
	// 유저 전체 조회
	List<LoginDTO> selectAllUsers(); // 추가
	// 유저아이디에 맞는 조회
	LoginDTO getUserById(String userId); // 추가2
	//이미지 수정
	public int updateUserImg(LoginDTO loginDTO);
	// 유저삭제
	public int deleteUser(LoginDTO loginDTO);
	//유저 온도 조회
	public String selectHeat(String sell_code);
	//유저 온도 조회
	public String selectHeatU(String sell_code);
	//유저 온도 수정
	int updateHeat(String user_heat, String user_code);
	//유저 온도 저장
	void saveHeat(String user_code, String user_heat, String check_heat, String board_id);
	//유저코드에 따른 온도 조회
	List<Object> getHeatByUserCode(String user_code);
	//판매자코드에 따른 온도 조회
	List<Object> getCheckHeatByUserCode(String sell_code);
	//게시글 아이디에 따른 온도조회
	public String getCheckHeatByBoardId(String board_id);

}