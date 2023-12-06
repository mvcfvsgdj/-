package com.sh.scroll.domain;

import lombok.Data;

@Data
public class ScrollDTO {
	int num; //인덱스
	String board_id; //작성자 ID
	String board_title; //제목
	String board_date; //날짜
	String user_nickname; //작성자(닉네임)
	String loc_code; //지역
	String detail_loc; //지역(상세)
	String board_price; //가격
	String board_click; //조회수
	String board_img; //이미지
	String board_text; //내용
	String user_code; //유저코드
}

