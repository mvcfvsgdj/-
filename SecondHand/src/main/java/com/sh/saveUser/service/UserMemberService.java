package com.sh.saveUser.service;

import com.sh.saveUser.domain.UserDTO;

public interface UserMemberService {

	public int registerMember(UserDTO userDTO);// 회원가입

	public boolean isUserIdExists(String user_id); // 아이디 중복확인
}
