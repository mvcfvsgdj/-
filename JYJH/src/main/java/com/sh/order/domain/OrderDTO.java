package com.sh.order.domain;

import lombok.Data;

@Data
public class OrderDTO {
    private String order_code; // 주문코드
    private String user_code; //유저코드
    private String user_id; //유저 아이디
    private String user_nickname; //유저닉네임
    private String phone_num; //핸드폰번호
    private String board_id; //게시글 아이디
    private String board_title; //게시글 제목
    private int board_price; //상품가격
    private String member_post; //우편번호
    private String member_addr; //지번 / 도로명
    private String detailed_address; // 상세주소
    private String delivery_req; //배송요청사항
    private String order_date; //주문날짜
    private String sell_code; //판매코드
}
