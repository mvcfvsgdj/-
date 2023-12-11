package com.sh.qna.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.qna.domain.QnaDTO;

@Repository
public class QnaRepositoryImp implements QnaRepositoryI{
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.sh.QnaMapper";

	
	// 현재페이지에 대한 목록 가져오기
	// 입력 : int page, int pageSize (현재페이지번호, 페이지사이즈크기)
	// 반환 : ArrayList<QnaDTO>      (고객목록)
	
	@Override
	public List<QnaDTO> getListPage(int currentPage , int pageSize){
		// 문의 게시글 조회 (페이징)
		//  시작페이지			마지막 페이지
		int startPage = 0, endPage = 0;
		startPage = ((currentPage-1)*pageSize);
		endPage = currentPage * pageSize;
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("pageSize", pageSize);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return session.selectList(namespace + ".getListPage", map);
	}
	
	@Override
	public QnaDTO getListOne(int q_code){
		// 문의 게시글 하나 조회
		return session.selectOne(namespace + ".getListOne" , q_code);
	}
	
	@Override
	public int getTotalCount() {
		// 문의게시글 전체 갯수
		return session.selectOne(namespace + ".getTotalCount");
	}
	
	@Override
	public void insertQna(QnaDTO dto){
		// 문의게시글 등록
		session.insert(namespace + ".insert", dto);
	}
	
	@Override
	public int updateQna(QnaDTO dto) {
		//문의 게시글 수정
		return session.update(namespace + ".update",dto );
		
	}
	
	@Override
	public int deleteQna(int code){
		//문의 게시글 삭제
		return session.delete(namespace + ".delete" , code);
	}
	
	@Override
	public int insertcomment(QnaDTO dto) {
		// 문의댓글 등록
		return session.insert(namespace + ".insertco",dto);
	}
	
	@Override
	public List<QnaDTO> getCommentList(int q_code){
		// 문의 댓글 전체 조회
		return session.selectList(namespace + ".getCommentList",q_code);
	}
	
	@Override
	public QnaDTO getCommentOne(int q_code){
		// 문의 댓글 조회
		return session.selectOne(namespace + ".getCommentOne",q_code);
	}
	
	@Override
	public int updateComment(QnaDTO dto) {
		// 문의 댓글 수정
		return session.update(namespace + ".updateco",dto);
	}
	
	@Override
	public int deleteComment(QnaDTO dto){
		// 문의 댓글 삭제
		return session.delete(namespace + ".deleteco" , dto);
	}
	
	@Override
	public int deleteAllComment(int code) {
		// 게시글 삭제 시 해당 문의 댓글 삭제
		return session.delete(namespace + ".deleteAllco" , code);
	}
	

	
	

}
