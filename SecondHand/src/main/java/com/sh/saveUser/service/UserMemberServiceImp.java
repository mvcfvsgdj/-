package com.sh.saveUser.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.saveUser.domain.UserDTO;
import com.sh.saveUser.repository.UserMemberRepositoryI;

@Service
public class UserMemberServiceImp implements UserMemberService {

	@Autowired
	UserMemberRepositoryI dao;

	@Override
	public int registerMember(UserDTO userDTO) {
		// TODO Auto-generated method stub
		// 회원가입
		return dao.insert(userDTO);
	}

	@Override
	public boolean isUserIdExists(String user_id) {
		// 아이디 중복확인
		return dao.getUserById(user_id);
	}
}