package com.sh.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.product.domain.ProductDTO;
import com.sh.product.domain.cateDTO;
import com.sh.product.repository.ProductRepository;

@Service
public class ProductService implements ProductServiceI {
   @Autowired
   private ProductRepository productRepository;

   @Override
   public List<ProductDTO> getProductList() {

      List<ProductDTO> result = productRepository.getlist();

      return result;
   }

   @Override
   public void increaseClick(String boardId) {
      // 조회수
      productRepository.increaseClick(boardId);
   }

   @Override
   public void insertProductData(ProductDTO product) {
      // 상품등록
      productRepository.insertProData(product);
   }

   @Override
   public ProductDTO getProductById(String boardId) {
      //게시글아이디에 따른 상품 조회
      return productRepository.selectProImagesById(boardId);
   }

   @Override
   public List<cateDTO> getCategory() {
      //카테고리 조회
      return productRepository.getCategory();
   }

   @Override
   public List<cateDTO> getAllCategories(String loc_code) {
      // 모든 카테고리 출력
      return productRepository.getAllCategories(loc_code);
   }

   @Override
   public void deleteProduct(String boardId) {
      //게시글 삭제
      productRepository.deleteProduct(boardId);
   }
   @Override
   public void deleteProduct2(String boardId) {
      //게시글 삭제
      productRepository.deleteProduct2(boardId);
   }
   @Override
   public void deleteProduct3(String user_code) {
      // 유저코드에 따른 게시글 삭제
      productRepository.deleteProduct3(user_code);
   }
   @Override
   public void deleteProduct4(String user_id) {
      // 유저아이디에 따른 게시글 삭제
      productRepository.deleteProduct4(user_id);
   }
   
   @Override
   public void deleteProduct6(String user_code) {
      // 유저코드에 따른 유저 좋아요 삭제
      productRepository.deleteProduct6(user_code);
   }
   
   
   @Override
   public int updateProduct(ProductDTO product) {
      // 상품정보 수정
      return productRepository.updateProduct(product);
   }

   @Override
   public void updateDate(String boardId) {
      // 날짜 갱신(끌어올리기)
      productRepository.updateDate(boardId);
   }


   @Override
   public String getAllCategoriesJson() {
      // 모든 카테고리 json 출력
      Map<String, List<cateDTO>> map = new HashMap<>();
      map.put("서울시", productRepository.getAllCategories("서울시"));
      map.put("제주도", productRepository.getAllCategories("제주도"));
      map.put("경기도", productRepository.getAllCategories("경기도"));
      map.put("충청도", productRepository.getAllCategories("충청도"));
      map.put("경상도", productRepository.getAllCategories("경상도"));
      map.put("전라도", productRepository.getAllCategories("전라도"));
      map.put("강원도", productRepository.getAllCategories("강원도"));

      Gson gson = new GsonBuilder().create();
      String jsonResult = gson.toJson(map);
      return jsonResult;
   }

   // 좋아요 개수 조회

   @Override
   public int getLikeCount(String board_Id) {
      return productRepository.getLikeCount(board_Id);
   }

   //*** 좋아요 기능
   //좋아요 insert
   @Override
   public void insertLike(String boardId, String userId,String user_code) {
      productRepository.insertLike(boardId, userId,user_code);
   }
   
   //좋아요 delete
   @Override
   public void deleteLike(String boardId, String userId) {
      productRepository.deleteLike(boardId, userId);
   }
   //좋아요 클릭했는지
   @Override
   public boolean likeClick(String boardId, String userId, String user_code) {
      return productRepository.likeClick(boardId, userId,user_code);
   }
   //관심상품 갯수
   @Override
   public int likeNum(String userId) {
      return productRepository.likeNum(userId);
   }
   
}