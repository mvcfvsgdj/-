package com.sh.kakaopay.domain;

import lombok.Data;

@Data
public class CardVO {
    
	/**
	 * CardVO 클래스는 카드 결제 정보를 담는 데 사용됩니다.
	 * 
	 * - purchase_corp: 구매 기업명
	 * - purchase_corp_code: 구매 기업 코드
	 * - issuer_corp: 카드 발급 기업명
	 * - issuer_corp_code: 카드 발급 기업 코드
	 * - bin: 카드 BIN (Bank Identification Number)
	 * - card_type: 카드 종류
	 * - install_month: 할부 개월 수
	 * - approved_id: 승인 번호
	 * - card_mid: 카드사 가맹점 번호
	 * - interest_free_install: 무이자 할부 여부
	 * - card_item_code: 카드 상품 코드
	 */
	
    private String purchase_corp, purchase_corp_code;
    private String issuer_corp, issuer_corp_code;
    private String bin, card_type, install_month, approved_id, card_mid;
    private String interest_free_install, card_item_code;
    
    
}