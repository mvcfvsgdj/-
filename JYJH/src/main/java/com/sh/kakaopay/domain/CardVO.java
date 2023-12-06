package com.sh.kakaopay.domain;

import lombok.Data;

@Data
public class CardVO {
    
	/**
	 * CardVO 클래스는 카드 결제 정보를 담는 데 사용됩니다.
	 * https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#approve-response-body-card-info
	 * - //구매정보//
	 * - purchase_corp: 매입 카드사 한글명
	 * - purchase_corp_code:  매입 카드사 코드
	 * 
	 * - //발급 기관 정보//
	 * - issuer_corp: 카드 발급사 한글명
	 * - issuer_corp_code: 카드 발급사 코드
	 * 
	 * - //카드 세부 정보//
	 * - bin: 카드 BIN (Bank Identification Number) 카드은행정보
	 * - card_type: 카드타입
	 * - install_month: 할부 개월 수
	 * - approved_id: 카드사 승인번호
	 * - card_mid: 카드사 가맹점번호 id
	 * 
	 * - // 추가적인 세부 정보//
	 * - interest_free_install: 무이자 할부 여부
	 * - card_item_code: 카드 상품 코드
	 */
	
    private String purchase_corp, purchase_corp_code;
    private String issuer_corp, issuer_corp_code;
    private String bin, card_type, install_month, approved_id, card_mid;
    private String interest_free_install, card_item_code;
    
    
}