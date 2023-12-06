package com.sh.kakaologin.service;

import java.util.List;

import com.sh.kakaologin.domain.KakaoUserDTO;

public interface KakaoMemberServiceI {
	
	// 카카오 유저 저장
	public int registerMember(KakaoUserDTO kakaoUserDTO);
	//카카오 유저 조회
	public List<KakaoUserDTO> getMemberList();
}
