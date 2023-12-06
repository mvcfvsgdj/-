package com.sh.saveUser.repository;

import com.sh.saveUser.domain.UserDTO;

public interface UserMemberRepositoryI {

	public int insert(UserDTO userDTO); // 회원가입

	public boolean getUserById(String user_id); // 아이디 중복확인
}