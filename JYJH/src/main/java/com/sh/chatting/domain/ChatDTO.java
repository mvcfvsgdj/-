package com.sh.chatting.domain;

import lombok.Data;

@Data
public class ChatDTO {
    private String chat_code; // 채팅코드
    private String buy_code; // 구매자 코드
    private String sell_code; // 판매자 코드
    private String board_id; // 게시글 아이디
    private String board_Title; // 게시글 제목
    private String sell_nickname; // 판매자 닉네임
    private String buy_nickname; // 구매자 닉네임
    private String board_Price; // 게시글 가격
    private String board_Img; // 게시글 이미지


}