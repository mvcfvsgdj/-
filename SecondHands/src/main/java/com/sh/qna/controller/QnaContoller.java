package com.sh.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.login.domain.LoginDTO;
import com.sh.qna.domain.QnaDTO;
import com.sh.qna.domain.QnaHandler;
import com.sh.qna.repository.QnaRepositoryI;

@Controller
@RequestMapping(value = "/qna")
public class QnaContoller {

	@Autowired
	QnaRepositoryI rep;

	/**
	 * Q&A 게시판 페이지를 반환
	 */
	@GetMapping()
	public String board(HttpServletRequest request, @RequestParam(value = "p", required = false) String p,
			Model model) {

		int currentPage;	// 현재 페이지
		if (p != null) {
			currentPage = Integer.parseInt(p);	// 현재 페이지 숫자로 변환
		} else {
			currentPage = 1; 	// 현재 페이지 없을 시 1페이지로
		}

		int totRecords = rep.getTotalCount();	// 페이징 - 총 게시글 수
		int pageSize = 10;	// 페이징 - 페이지 사이즈
		int grpSize = 5;	// 페이징 - 그룹 사이즈

		HttpSession session = request.getSession();
		// 페이징을 위한 handler불러오기
		QnaHandler handler = new QnaHandler(currentPage, totRecords, pageSize, grpSize);
		// 문의게시글 리스트 불러오기
		List<QnaDTO> list = rep.getListPage(currentPage, pageSize);
		// 로그인 아이디 불러오기
		LoginDTO user = (LoginDTO) session.getAttribute("user");

		if (user != null) {		// 로그인 O
			String userid = user.getUser_id(); 	// 로그인 id값 모델에 저장
			model.addAttribute("userid", userid);
		} else {				// 로그인 X
			String useriderr = "id없음";			
			model.addAttribute("useriderr", useriderr); // 로그인 아이디 없을시 null 대신하는 값 모델에 저장
		}

		model.addAttribute("list", list); // 문의게시글 리스트 모델에 저장
		model.addAttribute("handler", handler);	// 페이징 정보 모델에 저장

		return "/qna/qna";
	}

	/**
	 * Q&A 글 상세보기 페이지를 반환
	 */
	@PostMapping()
	public String qnaView(@RequestParam("code") int code, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// 댓글 리스트 불러오기
		List<QnaDTO> cometlist = rep.getCommentList(code); 
		// 게시글 하나 불러오기
		QnaDTO userImp = rep.getListOne(code); 
		if (userImp != null) {		// 로그인 O
			// 유저 정보 불러오기
			LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
			if (selectedUser != null) {
				String id = selectedUser.getUser_id();	// 유저 아이디
				String writer = selectedUser.getUser_nickname();	// 유저 닉네임
				
				model.addAttribute("userImp", userImp);	// 게시글 하나 모델에 저장
				model.addAttribute("id", id);	// 유저 아이디 모델에 저장
				model.addAttribute("writer", writer);	// 유저 닉네임 모델에 저장
				String cometnull;
				if (cometlist.size() > 0) { // 댓글 리스트가 null이 아닐경우
					cometnull = "f";	
					// list값이 null이 아니라고 알리는 값 모델에 저장
					model.addAttribute("cometnull", cometnull);	

					// 자바객체를 json 객체로 변환
					Gson gson = new GsonBuilder().create();
					String jsonList = gson.toJson(cometlist);
					model.addAttribute("cometlist", jsonList); // 데이타 List 받은데이터 - > 자바객체

				} else { // 댓글 리스트가 null일 경우	
					cometnull = "t";
					// list값이 null이라고 알리는 값 모델에 저장
					model.addAttribute("cometnull", cometnull);
				}
				return "/qna/qnaview";
			} else { // 유저정보가 null일 경우
				return "redirect:/qna";
			}
		} else { 	// 로그인 X
			return "redirect:/qna";
		}
	}

	/**
	 * Q&A 댓글 등록
	 */
	@ResponseBody
	@PostMapping(value = "/cometreg")
	public QnaDTO commentReg(QnaDTO dto, Model model) {
		// dto에 저장된 값 댓글 리스트에 넣기
		rep.insertcomment(dto);
		// 저장된 값 불러오기
		QnaDTO dto2 = rep.getCommentOne(dto.getQ_code());
		return dto2; // 불러온 값 jsp로 보내기
	}

	/**
	 * Q&A 댓글 수정
	 */
	@ResponseBody
	@PostMapping(value = "/cometup")
	public void commentup(QnaDTO dto) {
		// dto에 저장된 값으로 기존 값 변경하기
		rep.updateComment(dto);
	}

	/**
	 * Q&A 댓글 삭제
	 */
	@ResponseBody
	@PostMapping(value = "/cometdel")
	public void commentdel(QnaDTO dto) {
		// 지정된 댓글 삭제하기
		rep.deleteComment(dto);
	}

	/**
	 * Q&A 글 등록
	 */
	@GetMapping(value = "/reg")
	public String qnaRegPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// 유저 정보 불러오기
		LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
		if (selectedUser != null) {
			String id = selectedUser.getUser_id(); // 유저 id 불러오기
			String writer = selectedUser.getUser_nickname(); // 유저 닉네임 불러오기
			// 불러온 값 모델에 저장
			model.addAttribute("id", id);
			model.addAttribute("writer", writer);

			return "/qna/qnareg";
		} else { // 유저 정보 없을 시
			return "redirect:/qna";
		}
	}

	/**
	 * Q&A 글 등록
	 */
	@PostMapping(value = "/reg")
	public String qnaReg(@RequestParam("id") String id, @RequestParam("title") String title,
			@RequestParam("contents") String contents, @RequestParam("check") String check,
			@RequestParam("writer") String writer, Model model) {
		// 받은 값 dto 형식으로 저장
		QnaDTO dto = new QnaDTO(id, title, contents, check, writer);
		rep.insertQna(dto);	// 저장된 값으로 db에 저장
		return "redirect:/qna";
	}

	/**
	 * Q&A 글 수정
	 */
	@GetMapping(value = "/qup")
	public String qnaupdatePage(@RequestParam("code") int code, Model model) {
		// 선택한 게시글 정보 가져오고 모델에 저장
		QnaDTO userImp = (QnaDTO) rep.getListOne(code);
		model.addAttribute("user", userImp);
		return "/qna/qnaupdate";
	}

	/**
	 * Q&A 글 수정
	 */
	@PostMapping(value = "/qup")
	public String qnaupdate(@RequestParam("code") int code, @RequestParam("title") String title,
			@RequestParam("contents") String contents, @RequestParam("check") String check, Model model) {
		// 받은 값 dto 형식으로 저장하고 기존 값 변경
		QnaDTO dto = new QnaDTO(code, title, contents, check);
		rep.updateQna(dto);
		return "redirect:/qna";
	}

	/**
	 * Q&A 글 삭제
	 */
	@PostMapping(value = "/qdel")
	public String qnadelete(@RequestParam("code") int code, Model model) {
		// 받은 값으로 게시글과 게시글의 댓글 삭제
		rep.deleteAllComment(code);
		rep.deleteQna(code);
		return "redirect:/qna";
	}
}
