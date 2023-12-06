package com.sh.kakaologin.repository;

import java.util.List;

import com.sh.kakaologin.domain.KakaoUserDTO;

public interface KakaoMemberRepositoryI {
	
	// 카카오 유저 정보 저장
	public int insert(KakaoUserDTO kakaoUserDTO);
	// 카카오 유저 출력
	public List<KakaoUserDTO> selectAll();
}