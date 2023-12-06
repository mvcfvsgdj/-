package com.sh.chatting.repository;

import java.util.List;

import com.sh.chatting.domain.ChatDTO;
import com.sh.login.domain.LoginDTO;

public interface ChatRepository {
	
   // 채팅 저장
   public int insert(ChatDTO chatDTO);
   // 전체 구매코드 조회
   List<Object> selectAllCode(String buy_code);
   // 해당 채팅코드 조회
   String selectChatCode(String chat_code);
   // 코드 판별 여부
   boolean cheackCode(String buy_code, String sell_code, String board_id,String board_Title, String sell_nickname,String buy_nickname, String board_Price, String board_Img);
   // 채팅삭제
   public int deleteChatByCode(String chat_code,String buy_code);
   
   



}