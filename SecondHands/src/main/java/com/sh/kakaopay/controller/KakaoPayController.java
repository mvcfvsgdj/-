package com.sh.kakaopay.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.kakaopay.domain.KakaoPayApprovalVO;
import com.sh.kakaopay.service.KakaoPayService;
import com.sh.order.domain.OrderDTO;
import com.sh.order.service.OrderServiceI;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;
import com.sh.product.service.ProductServiceI;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {

	@Setter(onMethod_ = @Autowired)
	private KakaoPayService kakaopay;

	@Autowired
	OrderServiceI service;

	@Autowired
	ProductServiceI productservice;

	@Autowired
	ProductService productService;

	OrderDTO order;

	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {

	}

	@PostMapping("/kakaoPayGo")
	public String kakaoPayGo(@RequestParam String board_id, @RequestParam String board_title,
			@RequestParam String user_nickname, @RequestParam String board_price, @RequestParam String member_addr,
			@RequestParam String detailed_address, @RequestParam String member_post, @RequestParam String delivery_req,
			Model model, OrderDTO orderDTO) {
		// 카카오 api 호출
		ProductDTO product = productservice.getProductById(board_id);
		List<ProductDTO> productList = new ArrayList<>();
		model.addAttribute("board_id", board_id);
		model.addAttribute("board_title", board_title);
		model.addAttribute("user_nickname", user_nickname);
		model.addAttribute("board_price", board_price);
		model.addAttribute("member_addr", member_addr);
		model.addAttribute("member_post", member_post);
		model.addAttribute("detailed_address", detailed_address);
		model.addAttribute("delivery_req", delivery_req);
		model.addAttribute("product", product);
		model.addAttribute("products", productList);

		this.order = orderDTO;

		return "redirect:" + kakaopay.kakaoPayReady(order);

	}

	@GetMapping("/kakaoPaySuccess")
	public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, String board_id, String board_title,
			String user_nickname, String board_price, Model model) {
		
		// 카카오 api 호출 성공시
		
		log.info("kakaoPaySuccess pg_token : " + pg_token);
		model.addAttribute("info" + kakaopay.kakaoPayInfo(pg_token, order));

		service.registerOrder(order);

		productService.deleteProduct2(order.getBoard_id());
		productService.deleteProduct(order.getBoard_id());

		return "redirect:/showOrder";

	}

}