package com.sh.kakaologin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.kakaologin.domain.KakaoUserDTO;
import com.sh.kakaologin.repository.KakaoMemberRepositoryI;

@Service
public class KakaoMemberServiceImp implements KakaoMemberServiceI {

	@Autowired
	KakaoMemberRepositoryI dao;

	@Override
	public int registerMember(KakaoUserDTO kakaoUserDTO) {
		// TODO Auto-generated method stub
		// 카카오 유저 정보 저장
		return dao.insert(kakaoUserDTO);
	}

	@Override
	public List<KakaoUserDTO> getMemberList() {
		// TODO Auto-generated method stub
		// 카카오 유저 조회
		return dao.selectAll();
	}

}
