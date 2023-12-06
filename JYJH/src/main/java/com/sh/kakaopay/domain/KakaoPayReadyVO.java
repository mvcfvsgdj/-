package com.sh.kakaopay.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	
	/**
	 * KakaoPayReadyVO 클래스는 카카오페이 결제 요청 시 생성되는 정보를 담는 데 사용됩니다.
	 * 
	 * - tid: 결제 고유 번호, 10자
	 * - next_redirect_pc_url: 카카오페이 결제 페이지로 리다이렉트할 URL
	 * - created_at: 결제 준비 요청 시간
	 */
	
	 private String tid, next_redirect_pc_url;
	 private Date created_at;
	    
}
