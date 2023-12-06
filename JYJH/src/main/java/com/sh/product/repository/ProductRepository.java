package com.sh.product.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.product.domain.ProductDTO;
import com.sh.product.domain.cateDTO;

@Repository
public class ProductRepository {

	@Autowired
	private final SqlSession session;

	private static String namespace = "com.sh.proMapper.";

	@Autowired
	public ProductRepository(SqlSession session) {
		this.session = session;
	}

	public List<ProductDTO> getlist() {
		// 상품 전체 조회
		return session.selectList(namespace + "selectAll");
	}

	public void increaseClick(String boardId) {
		// 조회수
		session.update(namespace + "increaseClick", boardId);
	}

	public void insertProData(ProductDTO product) {
		// 상품등록
		session.insert(namespace + "insertProduct", product);
	}

	public ProductDTO selectProImagesById(String boardId) {
		// 상품이미지 조회
		return session.selectOne(namespace + "selectProImagesById", boardId);
	}

	public List<cateDTO> getCategory() {
		// 카테고리 조회
		return session.selectList(namespace + "getAllCategory");
	}

	public List<cateDTO> getAllCategories(String loc_code) {
		// 전체 카테고리 조회
		return session.selectList(namespace + "getAllCategories", loc_code);
	}

	public void deleteProduct(String boardId) {
		// boardid에 따른 상품 삭제
		session.delete(namespace + "deleteProduct", boardId);
	}

	public void deleteProduct2(String boardId) {
		// boardid에 따른 상품 삭제
		session.delete(namespace + "deleteProduct2", boardId);
	}

	public void deleteProduct3(String user_code) {
		// 유저 코드에 따른 상품 삭제
		session.delete(namespace + "deleteProduct3", user_code);
	}

	public void deleteProduct4(String user_id) {
		// 유저 아이디에 따른 상품 삭제
		session.delete(namespace + "deleteProduct4", user_id);
	}

	public int updateProduct(ProductDTO product) {
		// 상품 정보 갱신
		return session.update(namespace + "updateProduct", product);
	}

	// 좋아요
	public void addLike(Map<String, String> likeInfo) {
		session.insert(namespace + "addLike", likeInfo);
	}

	public void removeLike(Map<String, String> likeInfo) {
		// 좋아요 삭제
		session.delete(namespace + "removeLike", likeInfo);
	}

	public int getLikeCount(String boardId) {
		// 조회수 조회
		return session.selectOne(namespace + "getLikeCount", boardId);
	}

	public int insertLike(ProductDTO product) {
		// 좋아요 등록
		return session.insert(namespace + "insertLike", product);
	}

	// 끌어올리기
	public int updateDate(String boardId) {
		return session.insert(namespace + "updateDate", boardId);
	}

	// *** 좋아요
	// 좋아요 insert
	public void insertLike(String boardId, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardId", boardId);
		map.put("userId", userId);

		session.insert(namespace + "insertLike", map);
	}

	// 좋아요 delete
	public void deleteLike(String boardId, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardId", boardId);
		map.put("userId", userId);

		session.delete(namespace + "getlikeDelete", map);
	}

	// 좋아요 클릭한적 있는지 0 또는 1 반환
	public boolean likeClick(String boardId, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardId", boardId);
		map.put("userId", userId);
		return session.selectOne(namespace + "getlikeClick", map);
	}

	// 좋아요 몇개인지 반환
	public int likeNum(String userId) {
		return session.selectOne(namespace + "getLikeNum", userId);
	}

}
