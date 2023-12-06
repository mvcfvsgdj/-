package com.sh.qna.repository;

import java.util.List;

import com.sh.qna.domain.QnaDTO;


public interface QnaRepositoryI {
	
	public List<QnaDTO> getListPage(int currentPage , int pageSize); // 문의게시글 조회
	public int getTotalCount(); // 문의게시글 갯수
	public void insertQna(QnaDTO dto); // 문의 등록
	public int updateQna(QnaDTO dto); // 문의 수정
	public int deleteQna(int code); // 문의 삭제
	public QnaDTO getListOne(int code); // 문의 게시글 하나 조회
	public int insertcomment(QnaDTO dto); // 문의 댓글 저장
	public List<QnaDTO> getCommentList(int code); // 댓글리스트 조회
	public int updateComment(QnaDTO dto); // 댓글 수정
	public int deleteComment(QnaDTO dto); // 댓글 삭제
	public int deleteAllComment(int code); //전체 댓글 삭제
	public QnaDTO getCommentOne(int q_code); // 댓긇 하나 조회
}
