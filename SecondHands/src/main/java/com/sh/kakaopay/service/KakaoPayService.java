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

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "6269aa4d1550235e3d6bc1d57d6fd461");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", order.getBoard_id());
		params.add("partner_user_id", order.getUser_nickname());
		params.add("item_name", order.getBoard_title());
		params.add("quantity", "1");
		params.add("total_amount", String.valueOf(order.getBoard_price()));
		params.add("tax_free_amount", "0");
		params.add("approval_url", "http://localhost:8090/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:8090/homePage");
		params.add("fail_url", "http://localhost:8090/homePage");

		// 서버 버전
		// params.add("approval_url", "http://43.201.65.22:8080/kakaoPaySuccess");
		// params.add("cancel_url", "http://43.201.65.22:8080/homePage");
		// params.add("fail_url", "http://43.201.65.22:8080/homePage");

		// 헤더,바디 합치는 방법 .
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			// RestTemplate= 카카오페이 데이터 보낼때 사용 ,
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyVO.class);

			log.info("ttgtgutgutgu" + kakaoPayReadyVO);

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
		headers.add("Authorization", "KakaoAK " + "6269aa4d1550235e3d6bc1d57d6fd461");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", kakaoPayReadyVO.getTid());
		params.add("partner_order_id", order.getBoard_id());
		params.add("partner_user_id", order.getUser_nickname());
		params.add("pg_token", pg_token);
		params.add("total_amount", String.valueOf(order.getBoard_price()));

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			log.info("fuishahfihasfiuadsfoius" + kakaoPayApprovalVO);

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