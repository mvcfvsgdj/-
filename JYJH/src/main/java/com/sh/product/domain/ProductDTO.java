package com.sh.product.domain;

import lombok.Data;

@Data
public class ProductDTO {

	private String board_Id; // 상품 게시글 번호
	private String board_Date; // 상품 게시글 시간
	private String board_Title; // 상품 게시글 제목
	private int board_Price; // 상품 가격
	private String board_Text; // 상품 게시글 내용
	private String board_Img; // 상품 이미지
	private int board_Likes = 0; // 좋아요
	private int board_Soldout = 0; // 판매완료
	private int board_Click = 0; // 조회수
	private String board_Category; // 상품 카테고리
	// 카테고리
	private String loc_code; // 대분류 지역
	private String detail_loc; // 소분류 지역
	// 유저정보
	private String user_code; // 유저 정보
	private String user_nickname; // 유저 닉네임
	private int likeCount; // 좋아요 갯수
	
	private String board_cate; //판매 나눔 설정
	// getters and setters
}