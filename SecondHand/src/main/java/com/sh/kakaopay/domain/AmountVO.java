package com.sh.kakaopay.domain;

import lombok.Data;

@Data
public class AmountVO {
	/**
	 * AmountVO 클래스는 결제 금액 정보를 담는 데 사용됩니다.
	 *  https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#approve-response-body-amount
	 * - total: 총 결제 금액
	 * - tax_free: 비과세 금액
	 * - vat: 부가가치세(세금)
	 * - point: 사용할 포인트 금액
	 * - discount: 할인 금액
	 */
    private Integer total, tax_free, vat, point, discount;
}