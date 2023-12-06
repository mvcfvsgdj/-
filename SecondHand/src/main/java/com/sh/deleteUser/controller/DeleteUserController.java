package com.sh.deleteUser.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;
import com.sh.order.service.OrderServiceI;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;

@Controller
public class DeleteUserController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private ProductService productService;

	@GetMapping("/deleteUser")
	public String myPage() {
		// 유저삭제
		return "/myPage/deleteUser";
	}

	@Autowired
	private OrderServiceI orderService;

	@PostMapping("/delete")
	public String processDelete(@ModelAttribute LoginDTO loginDTO, @RequestParam String user_id,
			@RequestParam String user_code, HttpServletRequest request) {

		// System.out.println(loginDTO);
		// productService.deleteProduct2(boardId);
		productService.deleteProduct4(user_id);
		productService.deleteProduct3(user_code);
		orderService.deleteProduct5(user_id);

		if (loginService.deleteUser(loginDTO) > 0) {
			// 삭제 성공
			HttpSession session = request.getSession();
			// 세션에서 사용자 정보 삭제
			session.removeAttribute("selectedUser");
			return "redirect:/homePage";
		} else {
			return "redirect:/homePage?error=deleteUser";
		}
	}

	//// 관리자 id 삭제 /////
	@PostMapping("/admindelete")
	public String adminDelete(@ModelAttribute LoginDTO loginDTO, @ModelAttribute ProductDTO productDTO,
			@RequestParam String user_id, @RequestParam String user_code, Model model, HttpServletRequest request) {
		// @RequestParam String boardId,
		// productService.deleteProduct2(boardId);
		productService.deleteProduct4(user_id);
		productService.deleteProduct3(user_code);
		orderService.deleteProduct5(user_id);

		// 삭제할 사용자의 정보를 바로 사용
		loginDTO.setUser_id(user_id);
		loginDTO.setUser_code(user_code);
		loginService.deleteUser(loginDTO);

		List<LoginDTO> userList = loginService.selectAllUsers();
		List<ProductDTO> products = productService.getProductList();
		model.addAttribute("products", products);

		model.addAttribute("userList", userList);
		return "/admin/adminPage";
	}

	//// 관리자 게시글 삭제 /////
	@PostMapping("/products/adminBoardDelete")
	public String productDelete(@RequestParam String boardId, @ModelAttribute ProductDTO productDTO, Model model) {

		// productService.deleteProduct2(boardId);
		productService.deleteProduct(boardId);
		ProductDTO product = productService.getProductById(boardId);
		List<LoginDTO> userList = loginService.selectAllUsers();
		List<ProductDTO> products = productService.getProductList();
		model.addAttribute("userList", userList);
		model.addAttribute("product", product);
		model.addAttribute("products", products);
		return "/admin/adminPage";
	}
}
