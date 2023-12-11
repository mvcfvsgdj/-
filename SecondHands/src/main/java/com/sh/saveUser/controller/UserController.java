package com.sh.saveUser.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.saveUser.service.UserMemberService;

@Controller
public class UserController {

	@Autowired
	UserMemberService service;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/shSaveUser")
	public String goTosave() {
		return "/saveUser/saveUser";
	}

	// 본인인증 (이메일)
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) throws Exception {
		// 이메일 주소 형식 검증
		if (!isValidEmailAddress(email)) {
			throw new Exception("이메일 주소 형식이 올바르지 않습니다. 다시 입력해주세요.");
		}

		// 랜덤한 인증번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 발송할 이메일 설정
		String setFrom = "dhdl2369@gmail.com";
		String toMail = email;
		String title = "SecondHands 회원가입 인증 이메일";	

		// HTML로 메일 내용 작성
		String content = "<div style='background-color: #f4f4f4; " + "padding: 20px; text-align: center;'>"
				+ "<h2 style='color: #333333;'>SecondHands 회원가입 인증 이메일</h2>" + "<p style='color: #666666;'>인증 번호는 : "
				+ checkNum + "입니다.<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.</p>" + "</div>";

		try {
			// 이메일 발송
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("이메일 전송에 실패했습니다. 다시 시도해주세요.");
		}

		// 생성된 인증번호를 문자열로 변환하여 반환
		String num = Integer.toString(checkNum);
		return num;
	}
	
	
	   @ResponseBody
	   @PostMapping("/isUserIdExists")
	   public boolean isUserIdExists(@RequestParam String user_id) {
	      return service.isUserIdExists(user_id);
	   }
	
	// 이메일 형태 확인 로직 (정규식)
	private boolean isValidEmailAddress(String email) {
		// 정규식 패턴: 이메일 주소의 유효성을 검사하는 패턴입니다.
		// ^ : 문자열의 시작
		// [a-zA-Z0-9_+&*-] : 영문 대/소문자, 숫자, 특수문자(_+&*-) 중 하나와 일치
		// (?:\\.[a-zA-Z0-9_+&*-]+)* : 마침표(.)와
		// 그 뒤에 영문 대/소문자, 숫자, 특수문자(_+&*-)가 0회 이상 반복
		// @ : at 기호
		// (?:[a-zA-Z0-9-]+\\.)+ : 영문 대/소문자, 숫자, 하이픈(-)이 하나 이상 반복하고
		// 마침표(.)로 끝나는 그룹이 1회 이상 반복
		// [a-zA-Z]{2,7} : 영문 대/소문자가 2자 이상, 7자 이하로 이루어진 그룹
		// $ : 문자열의 끝
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

		// 주어진 이메일 주소가 정규식 패턴과 일치하는지 여부를 반환
		return email.matches(emailRegex);
	}

}