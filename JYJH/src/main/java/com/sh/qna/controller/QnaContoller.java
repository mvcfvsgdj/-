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

		int currentPage;
		if (p != null) {
			currentPage = Integer.parseInt(p);
		} else {
			currentPage = 1;
		}

		int totRecords = rep.getTotalCount();
		int pageSize = 10;
		int grpSize = 5;

		HttpSession session = request.getSession();
		QnaHandler handler = new QnaHandler(currentPage, totRecords, pageSize, grpSize);
		List<QnaDTO> list = rep.getListPage(currentPage, pageSize);
		LoginDTO user = (LoginDTO) session.getAttribute("user");

		if (user != null) {
			String userid = user.getUser_id();
			model.addAttribute("userid", userid);
		} else {
			String useriderr = "id없음";
			model.addAttribute("useriderr", useriderr);
		}

		model.addAttribute("list", list);
		model.addAttribute("handler", handler);

		return "/qna/qna";
	}

	/**
	 * Q&A 글 상세보기 페이지를 반환
	 */
	@PostMapping()
	public String qnaView(@RequestParam("code") int code, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		List<QnaDTO> cometlist = rep.getCommentList(code);
		QnaDTO userImp = rep.getListOne(code);
		if (userImp != null) {
			LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
			if (selectedUser != null) {
				String id = selectedUser.getUser_id();
				String writer = selectedUser.getUser_nickname();

				model.addAttribute("userImp", userImp);
				model.addAttribute("id", id);
				model.addAttribute("writer", writer);
				String cometnull;
				if (cometlist.size() > 0) {
					cometnull = "f";
					model.addAttribute("cometnull", cometnull);

					// 자바객체를 json 객체로 변환
					Gson gson = new GsonBuilder().create();
					String jsonList = gson.toJson(cometlist);
					model.addAttribute("cometlist", jsonList); /// 데이타 List 받은데이터 - > 자바객체

				} else {
					cometnull = "t";
					model.addAttribute("cometnull", cometnull);
				}
				return "/qna/qnaview";
			} else {
				return "redirect:/qna";
			}
		} else {
			return "redirect:/qna";
		}
	}

	/**
	 * Q&A 댓글 등록 
	 */
	@ResponseBody
	@PostMapping(value = "/cometreg")
	public QnaDTO commentReg(QnaDTO dto, Model model) {
		rep.insertcomment(dto);
		QnaDTO dto2 = rep.getCommentOne(dto.getQ_code());
		// System.out.println(dto);
		// System.out.println(dto2);
		return dto2;
	}

	/**
	 * Q&A 댓글 수정
	 */
	@ResponseBody
	@PostMapping(value = "/cometup")
	public void commentup(QnaDTO dto) {
		// System.out.println(dto);
		rep.updateComment(dto);

	}

	/**
	 * Q&A 댓글 삭제 
	 */
	@ResponseBody
	@PostMapping(value = "/cometdel")
	public void commentdel(QnaDTO dto) {
		// System.out.println(dto);
		rep.deleteComment(dto);

	}

	/**
	 * Q&A 글 등록
	 */
	@GetMapping(value = "/reg")
	public String qnaRegPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
		if (selectedUser != null) {
			String id = selectedUser.getUser_id();
			String writer = selectedUser.getUser_nickname();

			model.addAttribute("id", id);
			model.addAttribute("writer", writer);

			return "/qna/qnareg";
		} else {
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

		QnaDTO dto = new QnaDTO(id, title, contents, check, writer);
		rep.insertQna(dto);

		return "redirect:/qna";
	}

	/**
	 * Q&A 글 수정 
	 */
	@GetMapping(value = "/qup")
	public String qnaupdatePage(@RequestParam("code") int code, Model model) {

		// System.out.println("받은 코드값=" + code);

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

		// System.out.println("받은 코드값=" + code);

		QnaDTO dto = new QnaDTO(code, title, contents, check);

		rep.updateQna(dto);

		return "redirect:/qna";
	}

	/**
	 * Q&A 글 삭제
	 */
	@PostMapping(value = "/qdel")
	public String qnadelete(@RequestParam("code") int code, Model model) {

		// System.out.println("받은 코드값=" + code);
		rep.deleteAllComment(code);
		rep.deleteQna(code);

		return "redirect:/qna";
	}
}
