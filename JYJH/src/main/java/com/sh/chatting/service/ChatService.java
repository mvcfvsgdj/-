package com.sh.chatting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.chatting.domain.ChatDTO;
import com.sh.chatting.repository.ChatRepository;

@Service
public class ChatService implements ChatServiceImp {
   

   
   @Autowired
   private ChatRepository dao;

    // 생성자를 통한 주입으로 변경
    @Autowired
    public ChatService(ChatRepository chatRepository) {
        this.dao = chatRepository;
    }

   @Override
   public int insertChat(ChatDTO chatDTO) {
      // TODO Auto-generated method stub
      return dao.insert(chatDTO);
   }

   @Override
   public List<Object> selectAllCode(String buy_code) {
      // TODO Auto-generated method stub
      return dao.selectAllCode(buy_code);
   }
   
   @Override
   public String selectChatCode(String chat_code) {
      // TODO Auto-generated method stub
      return dao.selectChatCode(chat_code);
   }

@Override
   public boolean cheackCode(String buy_code,String sell_code,String board_id, String board_Title, 
		   String sell_nickname,String buy_nickname, String board_Price,String board_Img) {
      // TODO Auto-generated method stub
      return dao.cheackCode(buy_code, sell_code,board_id,board_Title,sell_nickname,buy_nickname,board_Price,board_Img);
   }

   @Override
   public int deleteChatByCode(String chat_code, String buy_code) {
      // TODO Auto-generated method stub
      return dao.deleteChatByCode(chat_code,buy_code);
   }

}