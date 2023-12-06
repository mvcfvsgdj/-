 package com.sh.scroll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.login.domain.LoginDTO;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;
import com.sh.scroll.domain.ScrollDTO;
import com.sh.scroll.domain.ScrollHandler;
import com.sh.scroll.service.scrollServiceI;

@Controller
public class LocationController {

	@Autowired
	scrollServiceI service;

	@Autowired
	private ProductService productservice;

	@PostMapping("/location_form")
	public String location(@RequestParam(name = "newLocation", required = false) String newLocation, Model model,
			HttpSession session) {
		// 사용자가 선택한 동네 인증 정보 세션에 저장
		session.setAttribute("detail_loc", newLocation);
		// System.out.println(newLocation);
		return "/homePage/homePage";
	}

	//동네거래 Home
	@PostMapping("/localproductList")
	public String localProductList(@RequestParam(name = "newLocation", required = false) String newLocation,
			Model model, HttpSession session) {

		// *** 로그인 정보 받아오기 ***
		LoginDTO login = (LoginDTO) session.getAttribute("user");
		String userId = login.getUser_id();

		//상품 부가정보 심어둠 - null문제 해결
		List<ProductDTO> products = productservice.getProductList();
		session.setAttribute("products", products);
		
		// 세션에서 detail_loc 값을 가져오기
		String detail_loc = (String) session.getAttribute("detail_loc");

		// 세션에 데이터 추가
		session.setAttribute("detail_loc", detail_loc);
		session.setAttribute("products", products);

		return "/products/localproductList";
	}

	@ResponseBody
	@GetMapping("/localScroll")
	public Map<String, Object> scrollGet( String page, String mode,String detail_loc) {
		// 동네거래 부분 스크롤 페이징
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		int toRecords = service.localTotalCnt(detail_loc);
		
		//스크롤 한번당 6개씩
		int pageSize = 6;
		ScrollHandler handler = new ScrollHandler(currentPage, toRecords, pageSize);
		
		//출력할 리스트 받아옴
		List<ScrollDTO> loclist = service.getLocalProducts(currentPage, pageSize,  mode, detail_loc);

		// ajax에서 응답하는거라 model 사용 못함
		Map<String, Object> map = new HashMap<String, Object>();
		int totalPage = handler.getTotalPage();
		
		map.put("totalPage", totalPage);
		map.put("loclist", loclist);

		return map;
	}
}
