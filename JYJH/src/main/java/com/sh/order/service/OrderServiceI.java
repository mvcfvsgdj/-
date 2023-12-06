package com.sh.order.service;

import java.util.List;

import com.sh.order.domain.OrderDTO;


public interface OrderServiceI {

   public int registerOrder(OrderDTO orderDTO); // 주문내역서 저장

   public List<OrderDTO> getOrdersByUserCode(String user_id); // 유저코드에 따른 구매내역서 조회
   
   public String selectBoardId(String board_id); // 게시글 id 조회
   
   public void deleteProduct5(String user_id); // 구매내역서 삭제
   
   }
