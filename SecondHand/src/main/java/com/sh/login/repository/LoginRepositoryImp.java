package com.sh.login.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.login.domain.LoginDTO;

@Repository
public class LoginRepositoryImp implements LoginRepositoryI {

   @Autowired
   private SqlSession session;
   private static String namespace = "com.sh.login.LoginMapper.";

   @Override
   public boolean checklogin(LoginDTO loginDTO) {
	   // 로그인 여부 확인
      LoginDTO user = session.selectOne(namespace + "checklogin", loginDTO);


      // 사용자를 찾지 못한 경우
      if (user == null) {
         return false;
      }

      // 입력한 아이디와 비밀번호가 데이터베이스의 값과 일치하는지 확인
      if (user.getUser_id().equals(loginDTO.getUser_id()) && user.getUser_pw().equals(loginDTO.getUser_pw())) {
         return true; // 로그인 성공
      } else {
         return false; // 로그인 실패
      }
   }
   
   @Override
	public LoginDTO getLoginDTO(String userId) {
	   // 로그인 전체 출력
	   	LoginDTO user = session.selectOne(namespace + "selectAllU", userId);
		return user;
	}

   @Override
   public int update(LoginDTO loginDTO) {
	  // 유저정보 수정
      // TODO Auto-generated method stub
      return session.update(namespace + "updateUser", loginDTO);
   }
   @Override
   public int updateUserImg(LoginDTO loginDTO) {
      // TODO Auto-generated method stub
	   // 유저 이미지 수정
      return session.update(namespace + "updateUserImg", loginDTO);
   }

   @Override
   public List<LoginDTO> selectAllUsers() {
	   // 전체 유저 조회
      return session.selectList(namespace + "selectAll");
   }

   
   @Override
   public LoginDTO getUserById(String userId) {
	   // 유저아이디에 맞는 유저 조회
       return session.selectOne(namespace + "selectUserById", userId);
   }   //관리자용

   
   @Override
   public int delete(LoginDTO loginDTO) {
      // TODO Auto-generated method stub
	   // 유저 삭제
      return session.delete(namespace + "deleteUser", loginDTO);
   }

   @Override
   public String selectHeat(String sell_code) {
	   // 유저 온도 하나 조회
      String heat = session.selectOne(namespace + "selectHeat", sell_code);
      return heat;

   }

   @Override
   public int updateHeat(String user_heat, String user_code) {
	   // 유저 온도 수정
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("user_heat", user_heat);
      map.put("user_code", user_code);

      System.out.println(user_heat);
      System.out.println(user_code);
      return session.update(namespace + "updateHeat", map);
   }

   @Override
   public String selectHeatU(String sell_code) {
	   // 판매자에 따른 온도 조회
      String heatUser = session.selectOne(namespace + "selectHeatU", sell_code);
      return heatUser;
   }

   @Override
   public void saveHeat(String user_code, String user_heat,String check_heat,String board_id) {
	   // 유저 온도 저장
      Map<String, Object> map = new HashMap<>();
      map.put("user_code", user_code);
      map.put("user_heat", user_heat);
      map.put("check_heat", check_heat);
      map.put("board_id", board_id);

      session.insert(namespace + "saveHeat", map);
   }
      @Override
      public List<Object> getHeatByUserCode(String user_code) {
    	  // 유저 코드에 따른 온도 조회
         List<Object> HeatUserCode = session.selectList(namespace + "getHeatByUserCode", user_code);
         return HeatUserCode;

      }
      

      @Override
      public List<Object>getCheckHeatByUserCode(String sell_code) {
    	  // 유저코드에 다른 온도 전체 조회
         List<Object> check = session.selectList(namespace + "getCheckHeatByUserCode", sell_code);
         return check;

      }
      @Override
      public String getCheckHeatByBoardId(String board_id) {
    	  // 온도(평가) 여부 확인
         String heatUser = session.selectOne(namespace + "getCheckHeatByBoardId", board_id);
         return heatUser;
      }
      

      
      
      
      
}