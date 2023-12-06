package com.sh.chatting.service;

import java.util.List;

import com.sh.chatting.domain.ChatDTO;

public interface ChatServiceImp {

   public int insertChat(ChatDTO chatDTO);
   
   List<Object> selectAllCode(String buy_code);

   String selectChatCode(String chat_code);
   
   
   public int deleteChatByCode(String chat_code,String buy_code);


boolean cheackCode(String buy_code, String sell_code, String board_id, String board_Title, String sell_nickname,String buy_nickname,
		String board_Price,String board_Img);
   


   
   

}
