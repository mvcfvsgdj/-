package com.sh.product.service;

import java.util.List;
import java.util.Map;

import com.sh.product.domain.ProductDTO;
import com.sh.product.domain.cateDTO;

public interface ProductServiceI {
   
   //상품 전체 목록
   List<ProductDTO> getProductList();

   //조회수
    void increaseClick(String boardId);

    //상품 등록
    void insertProductData(ProductDTO product);

    //상품 한개 조회 = 디테일
    ProductDTO getProductById(String boardId);

    //상품 등록 , 삭제시 사용할 카테고리
    String  getAllCategoriesJson();
    List<cateDTO> getCategory();
    List<cateDTO> getAllCategories(String loc_code);

    //상품 삭제
    void deleteProduct(String boardId);
    void deleteProduct2(String boardId);
    void deleteProduct3(String user_code);
    void deleteProduct4(String user_id);

    //상품 수정
    int updateProduct(ProductDTO product);
    
    // 좋아요 개수 조회
    int getLikeCount(String boardId);
   
    void updateDate(String boardId);
    
   //*** 좋아요
   //좋아요 insert
   void insertLike(String boardId, String userId);
   
   //좋아요 delete
   void deleteLike(String boardId, String userId);
   
   //좋아요 클릭했는지
   boolean likeClick(String boardId, String userId);
   
   //관심상품 갯수
   int likeNum(String userId);
}