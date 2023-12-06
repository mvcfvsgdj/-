package com.sh.kakaopay.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.sh.kakaopay.domain.KakaoPayReadyVO;
import com.sh.kakaopay.domain.KakaoPayApprovalVO;
import com.sh.order.domain.OrderDTO;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;

	public String kakaoPayReady(OrderDTO order) {
		
		// RestTemplate 객체 생성
		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		// Kakao API 키를 사용하여 Authorization 헤더에 추가
		headers.add("Authorization", "KakaoAK " + "6269aa4d1550235e3d6bc1d57d6fd461");
		
		// 요청을 JSON 형식으로 받기 위한 Accept 헤더 설정
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		// 요청 본문의 내용이 Form URL Encoded로 인코딩되어 있음
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		
		// https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#prepare-request-body 참고
		
		// KakaoPay 결제 요청에 필요한 파라미터 설정을 위한 MultiValueMap 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();

		// KakaoPay 결제 요청에 필요한 각 파라미터 추가
		params.add("cid", "TC0ONETIME"); // 가맹점 코드
		params.add("partner_order_id", order.getBoard_id()); // 가맹점 주문번호
		params.add("partner_user_id", order.getUser_nickname()); // 가맹점 회원 ID
		params.add("item_name", order.getBoard_title()); // 상품 이름
		params.add("quantity", "1"); // 상품 수량
		params.add("total_amount", String.valueOf(order.getBoard_price())); // 총 결제 금액
		params.add("tax_free_amount", "0"); // 비과세 금액

		// 성공, 취소, 실패 시 이동할 URL 설정
		params.add("approval_url", "http://localhost:8090/kakaoPaySuccess"); // 결제 성공 시 이동할 URL
		params.add("cancel_url", "http://localhost:8090/homePage"); // 결제 취소 시 이동할 URL
		params.add("fail_url", "http://localhost:8090/homePage"); // 결제 실패 시 이동할 URL

		// 서버 버전 사용시 위에 url 부분 주석처리
		// params.add("approval_url", "http://해당ip/kakaoPaySuccess");
		// params.add("cancel_url", "http://해당ip/homePage");
		// params.add("fail_url", "http://해당ip/homePage");

		// 헤더,바디 합치는 방법 .
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			// RestTemplate= 카카오페이 데이터 보낼때 사용 ,
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

		

			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pay";

	}

	public KakaoPayApprovalVO kakaoPayInfo(String pg_token, OrderDTO order) {
		// 카카오페이 정보
		RestTemplate restTemplate = new RestTemplate();
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "6269aa4d1550235e3d6bc1d57d6fd461"); // Kakao API 키 추가
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE); /// JSON 형식으로 응답을 받기 위한 설정
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 참고 : https://developers.kakao.com/docs/latest/ko/kakaopay/single-payment#approve-request-body
		// 서버로 요청할 Body 설정
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME"); // 가맹점 코드
		params.add("tid", kakaoPayReadyVO.getTid()); // 결제 고유 번호
		params.add("partner_order_id", order.getBoard_id()); // 가맹점 주문번호
		params.add("partner_user_id", order.getUser_nickname()); // 가맹점 회원 ID
		params.add("pg_token", pg_token); // 사용자 승인 토큰
		params.add("total_amount", String.valueOf(order.getBoard_price())); // 총 결제 금액

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}