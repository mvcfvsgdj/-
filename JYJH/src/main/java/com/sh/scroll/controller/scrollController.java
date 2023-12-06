package com.sh.scroll.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.login.domain.LoginDTO;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;
import com.sh.scroll.domain.ScrollDTO;
import com.sh.scroll.domain.ScrollHandler;
import com.sh.scroll.service.scrollServiceI;

@Controller
public class scrollController {

	@Autowired
	scrollServiceI service;
	@Autowired
	private ProductService productservice;
	
	// 슬라이드 Home
	@GetMapping("/scrollHome")
	public String scrollHome(HttpServletRequest request) {
		//상품 이미지 및 부가정보 심어둠
		HttpSession session = request.getSession();
		List<ProductDTO> products = productservice.getProductList();
	
	

		session.setAttribute("products", products);
		
		return "products/scrollPage";
	}

	//슬라이드 Ajax
	@ResponseBody
	@GetMapping("/scroll")
	public Map<String, Object> scrollGet(String page, String mode) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		int toRecords = service.getTotalCnt();
		
		//스크롤 한번당 6개씩
		int pageSize = 6;

		ScrollHandler handler = new ScrollHandler(currentPage, toRecords, pageSize);
		
		//출력할 리스트 받아옴
		List<ScrollDTO> list = service.getListScroll(currentPage, pageSize, mode);

		// ajax에서 응답하는거라 model 사용 못함
		Map<String, Object> map = new HashMap<String, Object>();
		int totalPage = handler.getTotalPage();
		
		map.put("totalPage", totalPage);
		map.put("list", list);

		return map;
	}

	//검색 기능
	@ResponseBody
	@GetMapping("/search")
	public List<ScrollDTO> searchGet(String searchTerm) {
		return service.getSearchList(searchTerm);
	}
	
	//관심상품 목록
	@ResponseBody
	@PostMapping("/likeList")
	public List<ScrollDTO> likeList(String userId) {
		List<ScrollDTO> list = service.getLikeList(userId);
		return list;
	}
	
	//판매중인 상품 Home
	@GetMapping("/sellProducts")
	public String sellHome(HttpServletRequest request) {
		//상품 이미지 및 부가정보 심어둠
		HttpSession session = request.getSession();
		List<ProductDTO> products = productservice.getProductList();
		session.setAttribute("products", products);
		return "products/sellProducts";
	}

	//판매중인 상품 Ajax
	@ResponseBody
	@GetMapping("/sellList")
	public List<ScrollDTO> sellGet(String user_code) {
		//System.out.println("유저코드(판매내역) = " + user_code);
		//출력할 리스트 받아옴
		List<ScrollDTO> list = service.getSellProducts(user_code);
		return list;
	}
}
