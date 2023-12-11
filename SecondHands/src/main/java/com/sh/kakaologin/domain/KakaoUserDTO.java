package com.sh.kakaologin.domain;

import lombok.Data;

@Data
public class KakaoUserDTO {
	private String user_kakao; // 카카오api 제공 코드
	private String nickname; // 카카오api 제공 이름
	private String profile_image; //카카오api 제공 이미지
}
