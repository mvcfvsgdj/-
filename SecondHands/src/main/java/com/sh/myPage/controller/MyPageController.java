package com.sh.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.login.service.LoginService;

@Controller
public class MyPageController {
   @Autowired
   LoginService loginService;

   
   @PostMapping("/myPage")
   public String myPage(@RequestParam String user_code, HttpServletRequest request) {
	   // 마이페이지 form
      HttpSession session = request.getSession();

      List<Object> updatedUser = loginService.getHeatByUserCode(user_code);
      
      // json객체로 변환 (구글 차트 api)
      Gson gson = new GsonBuilder().create();
      String jsonResult = gson.toJson(updatedUser);


      session.setAttribute("updatedUserData", jsonResult);

      return "/myPage/myPage";
   }

}