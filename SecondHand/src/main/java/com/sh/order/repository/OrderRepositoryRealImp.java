package com.sh.order.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.order.domain.OrderDTO;
import com.sh.product.domain.ProductDTO;
import com.sh.saveUser.domain.UserDTO;

@Repository
public class OrderRepositoryRealImp implements OrderRepositoryI {

   @Autowired
   private SqlSession session;
   private static String namespace = "com.sh.order.OrderMapper.";

   @Override
   public int insert(OrderDTO orderDTO) {
	   // 구매내역서 저장
      return session.insert(namespace + "insertOrder", orderDTO);
   }
   
   @Override
   public List<OrderDTO> getOrdersByUserCode(String user_id) {
	   // 유저코드에 따른 구매내역서 조회
      return session.selectList(namespace + "selectAll", user_id);
   }
   
   @Override
   public String selectBoardId(String board_id) {
	   // 게시글 id 조회
      String boardId = session.selectOne(namespace + "selectBoardId", board_id);
      return boardId;
   }
   @Override
   public void deleteProduct5(String user_id) {
	   // 구매내역서 삭제
       session.delete(namespace + "deleteProduct5", user_id);
   }

}