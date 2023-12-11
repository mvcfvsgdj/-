package com.sh.login.domain;

import lombok.Data;

@Data
public class LoginDTO {
	private String user_code; // 유저코드
	private String user_kakao; // 카카오 유저 코드
	private String user_id; // 유저 아이디
	private String user_pw; // 유저 비밀번호
	private String address; // 주소
	private String phone_num; // 핸드폰번호
	private String member_post; // 우편번호
	private String member_addr; // 도로명 / 주소명
	private String detailed_address; // 상세주소
	private String user_birth; // 생일
	private String user_nickname; // 유저닉네임 (카카오 닉네임 포함)
	private String user_image; // 유저 이미지 (카카오 프로필 이미지 포함)
	private String user_heat; // 유저온도

}
