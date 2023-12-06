package com.sh.saveUser.domain;

import lombok.Data;

@Data
	public class UserDTO {
		private String user_code; // 유저코드
		private String user_kakao; // 카카오 API제공 코드
	    private String user_id; // 아이디
	    private String user_pw; // 비밀번호
	    private String address; // 이메일
	    private String phone_num; // 핸드폰번호
	    private String member_post; // 우편번호
	    private String member_addr; //지번 / 도로명
	    private String detailed_address; // 상세주소
	    private String user_birth; // 생일
	    private String user_nickname; // 닉네임 (카카오Api 이용시 추가 제공)
	    private String user_image; // 유저 프로필 (카카오Api 이용시 추가 제공)
	    private String user_heat; // 유저 온도
}
