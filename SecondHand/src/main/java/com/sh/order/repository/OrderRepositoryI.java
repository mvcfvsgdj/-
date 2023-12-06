package com.sh.order.repository;

import java.util.List;

import com.sh.order.domain.OrderDTO;

public interface OrderRepositoryI {

	public int insert(OrderDTO orderDTO); // 주문내역서 등록

	List<OrderDTO> getOrdersByUserCode(String user_id); // 유저코드에 따른 주문내역서

	String selectBoardId(String board_id);	// 게시글 아이디 조회

	public void deleteProduct5(String user_id); // 주문내역서 삭제

}