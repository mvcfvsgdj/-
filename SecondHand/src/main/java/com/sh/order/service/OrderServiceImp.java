package com.sh.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.order.domain.OrderDTO;
import com.sh.order.repository.OrderRepositoryI;

@Service
public class OrderServiceImp implements OrderServiceI {

   @Autowired
   OrderRepositoryI dao;

   @Override
   public int registerOrder(OrderDTO orderDTO) {
	   // 주문내역서 저장
      return dao.insert(orderDTO);
   }

   @Override
   public List<OrderDTO> getOrdersByUserCode(String user_id) {

      // 유저코드에 맞는 유저구매내역 조회
      return dao.getOrdersByUserCode(user_id);
   }

   @Override
   public String selectBoardId(String board_id) {
      // 게시글 아이디 조회
      return dao.selectBoardId(board_id);
   }
   @Override
   public void deleteProduct5(String user_id) {
	   // 주문내역 삭제
	   dao.deleteProduct5(user_id);
   }

}