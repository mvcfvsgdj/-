package com.sh.login.domain;

import lombok.Data;

@Data
public class HeatChartDTO {
	
   private String heat_code;// 온도 코드
   private String user_code;// 유저 코드
   private String user_heat;// 유저 온도
   private String heat_date;// 온도(평점) 날짜
   private String check_heat; // 평가 여부
   private String board_id; // 게시글 아이디
}