package com.sh.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LogoutController {

	@PostMapping("/logout")
	//로그아웃 컨트롤
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate(); // 세션 무효화
		}
		return "/homePage/homePage"; // 로그아웃 성공 페이지 또는 로그인 페이지로 리다이렉트
	}
}