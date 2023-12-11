package com.sh.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.login.domain.LoginDTO;
import com.sh.login.repository.LoginRepositoryI;

@Service
public class LoginService implements LoginServiceI {

	@Autowired
	private LoginRepositoryI userRepository;

	@Override
	public boolean checkLogin(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		// 로그인 여부 확인
		return userRepository.checklogin(loginDTO);
	}

	@Override
	public LoginDTO getUserById(String userId) {
		// 유저아이디에 따른 로그인정보 조회
		return userRepository.getUserById(userId);
	}

	@Override
	public List<LoginDTO> selectAllUsers() {
		// 유저 전체 조회
		return userRepository.selectAllUsers();
	}// 23/11/21어드민 추가

	@Override
	public LoginDTO getLoginDTO(String userId) {
		// TODO Auto-generated method stub
		// 로그인 정보 조회
		return userRepository.getLoginDTO(userId);
	}

	@Override
	public int updateUser(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		// 유저 정보 수정
		return userRepository.update(loginDTO);
	}

	@Override
	public int updateUserImg(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		// 유저 이미지 수정
		return userRepository.updateUserImg(loginDTO);
	}

	@Override
	public int deleteUser(LoginDTO loginDTO) {
		// TODO Auto-generated method stub
		// 유저 정보 삭제
		return userRepository.delete(loginDTO);

	}

	@Override
	public String selectHeat(String sell_code) {
		// 판매자 온도 조회
		return userRepository.selectHeat(sell_code);
	}

	@Override
	public int updateHeat(String user_heat, String user_code) {
		// 온도 수정
		return userRepository.updateHeat(user_heat, user_code);
	}

	@Override
	public String selectHeatU(String sell_code) {
		// 판매자 코드 온도 조회
		return userRepository.selectHeatU(sell_code);
	}

	@Override
	public void saveHeat(String user_code, String user_heat, String check_heat, String board_id) {
		// 온도 저장(평점)
		userRepository.saveHeat(user_code, user_heat, check_heat, board_id);
	}

	@Override
	public List<Object> getHeatByUserCode(String user_code) {
		// 유저코드에 따른 온도출력
		return userRepository.getHeatByUserCode(user_code);
	}

	@Override
	public List<Object> getCheckHeatByUserCode(String sell_code) {
		// 유저코드에 따른 온도출력
		return userRepository.getCheckHeatByUserCode(sell_code);
	}

	@Override
	public String getCheckHeatByBoardId(String board_id) {
		// 평가여부 확인
		return userRepository.getCheckHeatByBoardId(board_id);
	}

}