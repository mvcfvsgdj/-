package com.sh.login.repository;

import java.util.List;

import com.sh.login.domain.LoginDTO;

public interface LoginRepositoryI {
	// 로그인 여부확인
	public boolean checklogin(LoginDTO loginDTO);

	// 전체 유저 조회
	List<LoginDTO> selectAllUsers(); // 추가
	// 유저 아이디에 따른 조회

	LoginDTO getUserById(String userId); // 새로운 메소드 추가

	LoginDTO getLoginDTO(String userId);

	// 유저 정보 수정
	public int update(LoginDTO loginDTO);

	// 유저 정보 삭제
	public int delete(LoginDTO loginDTO);

	// 유저 이미지 수정
	public int updateUserImg(LoginDTO loginDTO);

	// 판매자 온도 조회
	public String selectHeat(String sell_code);

	// 판매자 온도 조회
	public String selectHeatU(String sell_code);

	// 온도 수정
	int updateHeat(String user_heat, String user_code);

	// 온도(평가) 저장
	void saveHeat(String user_code, String user_heat, String check_heat, String board_id);

	// 유저코드에 따른 온도 조회
	List<Object> getHeatByUserCode(String user_code);

	// 온도(평가) 여부 조회
	List<Object> getCheckHeatByUserCode(String sell_code);
	// 게시글 id에 따른 온도 확인
	String getCheckHeatByBoardId(String board_id);
}