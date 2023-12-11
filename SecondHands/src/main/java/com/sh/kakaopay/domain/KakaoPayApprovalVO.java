package com.sh.kakaopay.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayApprovalVO {
    
	/**
	 * KakaoPayApprovalVO 클래스는 카카오페이 결제 승인 정보를 담는 데 사용됩니다.
	 * 
	 * - aid: 결제 고유 번호
	 * - tid: 결제 고유 번호, 10자
	 * - cid: 가맹점 코드
	 * - sid: 정기결제용 ID, 정기결제 CID
	 * - partner_order_id: 가맹점 주문번호
	 * - partner_user_id: 가맹점 회원 id
	 * - payment_method_type: 결제 수단
	 * - amount: 결제 금액 정보 (AmountVO 객체 참조)
	 * - card_info: 카드 결제 정보 (CardVO 객체 참조)
	 * - item_name: 상품 이름
	 * - item_code: 상품 코드
	 * - payload: 결제 페이지에 전달할 추가 데이터
	 * - quantity: 상품 수량
	 * - tax_free_amount: 비과세 금액
	 * - vat_amount: 부가가치세(세금) 금액
	 * - created_at: 결제 준비 요청 시간
	 * - approved_at: 결제 승인 시간
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
 