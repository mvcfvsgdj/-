package com.sh.scroll.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.scroll.domain.ScrollDTO;

@Repository
public class scrollRepositoryImp implements scrollRepositoryI{
   @Autowired
   private SqlSession session;
   private static String namespace = "com.sh.scrollMapper";
   
   
   @Override
   public int totalCnt() {
      return session.selectOne( namespace + ".getTotalCnt");
   }
   
   //인기순, 최신순
   @Override
   public List<ScrollDTO> getScroll(int curpage, int pageSize, String mode) {
      int endIndex = pageSize*curpage;
      int startIndex = endIndex - pageSize+1;
      Map<String, Object> map = new HashMap<String,Object>();
      map.put("startIndex",startIndex);
      map.put("endIndex", endIndex);
      
      return session.selectList( namespace + mode, map);
   }

   //검색
   public List<ScrollDTO> getSearchList(String searchTerm) {
       return session.selectList(namespace + ".getSearchList", searchTerm);
   }
   
   //관심상품
   @Override
   public List<ScrollDTO> getLikeList(String userId) {
      return session.selectList(namespace + ".getLikeList", userId);
   }
   
   
   //동네거래 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   //동네거래 리스트
   @Override
   public List<ScrollDTO> getLocalProducts(int curpage, int pageSize, String mode, String detail_loc) {
      int endIndex = pageSize*curpage;
      int startIndex = endIndex - pageSize;
      Map<String, Object> map = new HashMap<String,Object>();
      map.put("endIndex", endIndex);
      map.put("startIndex",startIndex);
      map.put("detail_loc",detail_loc);
      return session.selectList( namespace + mode, map);
   }
   //동네 레코드 개수
   @Override
   public int localTotalCnt(String location) {
      return session.selectOne( namespace + ".localTotalCnt", location);
   }
   
   
   //판매중인 물건 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
   @Override
   public List<ScrollDTO> getSellProducts(String user_code) {
      return session.selectList(namespace+".SellProducts", user_code);
   }
   
}