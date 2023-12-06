package com.sh.login.controller;

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

import com.sh.chatting.domain.ChatDTO;
import com.sh.chatting.service.ChatService;
import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;
import com.sh.order.domain.OrderDTO;
import com.sh.order.service.OrderServiceI;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductService;

@Controller
public class LoginController {

   @Autowired
   private LoginService loginService;
   // ChatService를 주입
   @Autowired
   private ChatService chatService;
   @Autowired
   OrderServiceI service;

   @Autowired
   ProductService  productService;
   
   @PostMapping("/login")
   public String processLogin(@ModelAttribute LoginDTO loginDTO, @ModelAttribute ChatDTO chatDTO,
         HttpServletRequest request) {
      if (loginService.checkLogin(loginDTO)) {
 
         HttpSession session = request.getSession();
  
         // selectAll 메소드 호출하여 유저 정보 가져오기
         String userId = loginDTO.getUser_id();
         LoginDTO selectedUser = loginService.getLoginDTO(userId);
         session.setAttribute("user", selectedUser);

         // 세션에 selectedUser 저장
         session.setAttribute("selectedUser", selectedUser);
         String chatlogin = selectedUser.getUser_code();
        // System.out.println("코드뽑아오기" + chatlogin);

         List<Object> chatList = chatService.selectAllCode(chatlogin);
        // System.out.println("넘어갈때 리스트@@@@@@" + chatList);
         session.setAttribute("chatList", chatList);

         return "/homePage/homePage";
      } else {

         return "redirect:/login?error=loginerror";
      }

   }
//////관리자 기능 추가////////
   @PostMapping("/admin")
   public String showAdminPage(Model model, @ModelAttribute ProductDTO productDTO) {
       List<LoginDTO> userList = loginService.selectAllUsers();
       List<ProductDTO> products = productService.getProductList();
       model.addAttribute("products", products);
       model.addAttribute("userList", userList);
       return "admin/adminPage";
   }

	
	
	  
   // 온도평가 및 재평가 확인
   @PostMapping("/heat")
   public String showHeatPage(HttpSession session, @RequestParam String sell_code, @RequestParam String board_id, Model model) {
       LoginDTO loggedInUser = (LoginDTO) session.getAttribute("user");
       List<OrderDTO> orderList = service.getOrdersByUserCode(loggedInUser.getUser_id());
       session.setAttribute("orderList", orderList);

       String boardId = service.selectBoardId(board_id);
       session.setAttribute("boardId", boardId);

       String user_heat = loginService.selectHeat(sell_code);
       String user_nickname = loginService.selectHeatU(sell_code);
       List<Object> code = loginService.getCheckHeatByUserCode(sell_code);

       String checkBoardId = loginService.getCheckHeatByBoardId(board_id);
   
       boolean alreadyEvaluated = "T".equals(checkBoardId);
       model.addAttribute("alreadyEvaluated", alreadyEvaluated);

       if (alreadyEvaluated) {
           // 이미 평가된 상품인 경우 alert를 추가하고 showOrder 페이지로 리디렉션
           model.addAttribute("message", "이미 평가된 상품입니다.");
           System.out.println("이미 평가된 상품입니다");
           return "/order/showOrder"; // showOrder 페이지로 리디렉션
       } else {
           // 평가되지 않은 경우 평가 페이지로 이동
           model.addAttribute("sell_code", sell_code);
           model.addAttribute("board_id", board_id);
           model.addAttribute("user_heat", user_heat);
           model.addAttribute("user_nickname", user_nickname);
           System.out.println(user_nickname);
           return "order/heat";
       }
   }
   
   
   // 온도 수정
   @PostMapping("/updateHeat")
   public String updateHeat(@ModelAttribute LoginDTO loginDTO, @RequestParam String user_heat,
         @RequestParam String check_heat,         
         @RequestParam String board_id,
         @RequestParam String user_code, HttpServletRequest request) {
	   
      if (loginService.updateHeat(user_heat, user_code) > 0) {
    	  productService.deleteProduct(board_id);
         
         loginService.saveHeat(user_code, user_heat,check_heat,board_id);
         return "/homePage/homePage";

      } else {
         return "/order/heat";
      }
   }

}