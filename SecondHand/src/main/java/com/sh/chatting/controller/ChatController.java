package com.sh.chatting.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.chatting.domain.ChatDTO;
import com.sh.chatting.service.ChatService;
import com.sh.chatting.service.ChatServiceImp;
import com.sh.login.service.LoginService;
import com.sh.product.service.ProductService;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private ProductService productService;

	
	// 채팅 리스트 조회
	@PostMapping("/chattingList")
	public String chatList(@RequestParam String buy_code,HttpSession session, Model model) {
		List<Object> chatList = chatService.selectAllCode(buy_code);

		
		 System.out.println("넘어갈때 리스트"+chatList);
		session.setAttribute("chatList", chatList);
		return "/chatting/chattingList";
	}
	
	// 채팅내 유저들 정보
	@GetMapping("/inchat")
	public String inchat(@RequestParam String chat_code, @RequestParam String sell_code, @RequestParam String buy_code,
			@RequestParam String board_Title, @RequestParam String board_Price, @RequestParam String board_Img,
			Model model) {
		String nickName = loginService.selectHeatU(sell_code);
		// System.out.println("내닉네임"+nickName);
		model.addAttribute("nickName", nickName);

		String targetNickName = loginService.selectHeatU(buy_code);
		// System.out.println("상대닉네임"+nickName);
		model.addAttribute("targetNickName", targetNickName);

		String my_heat = loginService.selectHeat(sell_code);
		model.addAttribute("my_heat", my_heat);

		String target_heat = loginService.selectHeat(buy_code);
		model.addAttribute("target_heat", target_heat);

		String chatCode = chatService.selectChatCode(chat_code);
		model.addAttribute("chatCode", chatCode);

		model.addAttribute("board_Price", board_Price);
		model.addAttribute("board_Img", board_Img);
		model.addAttribute("board_Title", board_Title);

		// System.out.println("각격"+board_Price);
		// System.out.println("이미지"+board_Img);
		// System.out.println("제목"+board_Title);

		// System.out.println(buy_code);
		 System.out.println(chatCode);
		return "chatting/chatting";
	}
	
	// 판매자 코드 확인
	@PostMapping("/checkCode")
	public String checkCode(ChatDTO chatDTO, @RequestParam String buy_code, @RequestParam String sell_code,
			@RequestParam String board_id, @RequestParam String board_Title, @RequestParam String sell_nickname,
			@RequestParam String buy_nickname,
			@RequestParam String board_Price, @RequestParam String board_Img, HttpSession session, Model model) {
		boolean isCodeValid = chatService.cheackCode(buy_code, sell_code, board_id, board_Title, sell_nickname,buy_nickname,
				board_Price, board_Img);
		model.addAttribute("isCodeValid", isCodeValid);
		// System.out.println(isCodeValid);
		if (isCodeValid == false) {
			session.setAttribute("buy_code", chatDTO.getBuy_code());
			chatService.insertChat(chatDTO);
			// System.out.println("아이디확인!!!!!!!!!"+chatDTO.getBuy_code());

			List<Object> chatList = chatService.selectAllCode(chatDTO.getBuy_code());
			// System.out.println("넘어갈때 리스트@@@@@@"+chatList);
			session.setAttribute("chatList", chatList);

			// System.out.println("성공");
			return "/homePage/homePage";
		} else {
			String user_heat = loginService.selectHeat(sell_code);
			model.addAttribute("user_heat", user_heat);
			model.addAttribute("isCodeValid", false);
			// System.out.println("실패");
			return "/products/productDetail";
		}
	}

	// 채팅 삭제
	@PostMapping("/deleteChatting")
	public String deleteChatting(ChatDTO chatDTO, @RequestParam String chat_code, @RequestParam String buy_code,
			HttpSession session, Model model) {
		int result = chatService.deleteChatByCode(chat_code, buy_code);
		if (result > 0) {
			// 삭제 성공, 리디렉션 또는 성공 메시지 표시 가능
			System.out.println("채팅이 성공적으로 삭제되었습니다");
			List<Object> chatList = chatService.selectAllCode(buy_code);
			// System.out.println("나와라 제발"+chatList);
			session.setAttribute("chatList", chatList);
		} else {
			// 삭제 실패, 리디렉션 또는 에러 메시지 표시 가능
			System.out.println("채팅 삭제에 실패했습니다");
		}
		return "/chatting/chattingList";
	}

}