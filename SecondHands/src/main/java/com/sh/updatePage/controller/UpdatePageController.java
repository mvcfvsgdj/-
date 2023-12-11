package com.sh.updatePage.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;
import com.sh.product.domain.ProductDTO;

@Controller
public class UpdatePageController {
	// 이미지 저장 경로
	String fileDir = "c:\\test\\upload\\";
	@Autowired
	private LoginService loginService;

	@GetMapping("/update")
	public String myPage() {
		return "/myPage/updatePage";
	}

	@PostMapping("/update")
	public String processUpdate(@ModelAttribute LoginDTO loginDTO, HttpServletRequest request) {
		// 유저 정보 수정
		if (loginService.updateUser(loginDTO) > 0) {
			// 업데이트 성공
			HttpSession session = request.getSession();
			// 업데이트 후 사용자 정보를 다시 조회
			String userId = loginDTO.getUser_id();
			LoginDTO updatedUser = loginService.getLoginDTO(userId);
			// 세션에 업데이트된 사용자 정보 저장
			session.setAttribute("selectedUser", updatedUser);
			return "/myPage/myPage";
		
		} else {
			return "redirect:/update?error=updateerror";
		}
	}
	@PostMapping("/updateusermainimg")
	public String processUpdateMainImg(@ModelAttribute LoginDTO loginDTO,@RequestParam String user_image, @RequestParam String user_id, HttpServletRequest request) {
		// 유저 메인 이미지 수정
		loginDTO.setUser_id(user_id);
		loginDTO.setUser_image(user_image);
	    loginService.updateUserImg(loginDTO); // 여기서 이미지만 업데이트
	    // 업데이트 성공
	    HttpSession session = request.getSession();
	    String userId = loginDTO.getUser_id();
	    LoginDTO updatedUser = loginService.getLoginDTO(userId);
	    // 세션에 업데이트된 사용자 정보 저장
	    session.setAttribute("selectedUser", updatedUser);
	    return "/myPage/myPage";
	}
	@PostMapping("/updateuserimg")
	public String processUpdateimg(@ModelAttribute LoginDTO loginDTO, Model model,@RequestParam String user_id, MultipartFile file,
	        HttpServletRequest request) throws IllegalStateException, IOException {
		// 유저 이미지 수정
	    // ProductService를 통해 상품 수정

		HttpSession session = request.getSession();
		
		//System.out.println("파일-="+file);
		String fileRealName = null;
	        loginDTO.setUser_id(user_id);

	        if (file != null && !file.isEmpty()) {
	            fileRealName = file.getOriginalFilename();
	            // System.out.println(fileRealName);

	            String fullPath = fileDir + fileRealName; // "C:\\test\\upload\\test.jpg"
	            file.transferTo(new File(fullPath));
	            model.addAttribute("fileName", fileRealName);

	            // 이미지 파일이 업데이트되면 데이터베이스에 반영
	            loginDTO.setUser_image("/images/"+fileRealName);
	            loginService.updateUserImg(loginDTO); // 여기서 이미지만 업데이트
	        }
	        String userId = loginDTO.getUser_id();
	        LoginDTO updatedUser = loginService.getLoginDTO(userId);
		    session.setAttribute("selectedUser", updatedUser);
	        // 상품 수정이 성공하면 목록 페이지로 리다이렉션

	        return "/myPage/myPage";
	    } 
	
	
	
	}
	
	



