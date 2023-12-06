package com.sh.kakaopay.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO {
    
	/**
	 * KakaoPayApprovalVO 클래스는 카카오페이 결제 승인 정보를 담는 데 사용됩니다.
	 * https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#approve-response-body
	 * - //고유 번호//
	 * - aid: 요청 고유 번호
	 * - tid: 결제 고유 번호, 10자
	 * 
	 * - //가맹점 정보//
	 * - cid: 가맹점 코드
	 * - sid: 정기결제용 ID, 정기결제 CID
	 * 
	 * - //주문 정보//
	 * - partner_order_id: 가맹점 주문번호, 최대 100자
	 * - partner_user_id: 가맹점 회원 id, 최대 100자
	 * 
	 * - //결제수단 및 금액정보//
	 * - payment_method_type: 결제 수단
	 * - amount: 결제 금액 정보 (AmountVO 객체 참조)
	 * 
	 * - //카드 정보//
	 * - card_info: 카드 결제 정보 (CardVO 객체 참조)
	 * -
	 * - //상품 정보//
	 * - item_name: 상품 이름, 최대 100자
	 * - item_code: 상품 코드, 최대 100자
	 * - quantity: 상품 수량
	 * -
	 * - //시간 정보//
	 * - created_at: 결제 준비 요청 시간
	 * - approved_at: 결제 승인 시간
	 * -
	 * - //기타 정보//
	 * - payload: 결제 승인 요청에 대해 저장한 값, 요청 시 전달된 내용
	 * - tax_free_amount: 비과세 금액
	 * - vat_amount: 부가가치세(세금) 금액
	 */
	
	
    //response
    private String aid, tid, cid, sid;
    private String partner_order_id, partner_user_id, payment_method_type;
    private AmountVO amount;
    private CardVO card_info;
    private String item_name, item_code, payload;
    private Integer quantity, tax_free_amount, vat_amount;
    private Date created_at, approved_at;
    
    
}
 