package com.sh.qna.domain;

import lombok.Data;

@Data
public class QnaDTO {
	
	
	
	private int q_code; // Q&A 글 코드
	private String q_id;// 작성자 아이디
	private String q_title; // 문의 제목
	private String q_contents; // 문의 내용
	private String q_date; // 작성 날짜
	private String q_time; // 작성 시간
	private String q_check; // 글공개 여부
	private String q_writer; // 문의 작성자
	private String q_comment; // 댓글내용
	private int q_code_co; // Q&A 글 코드
	private int num; // 갯수
	

	public QnaDTO() {
		super();
	}
	

	public QnaDTO(int q_code,String q_id, String q_title ,String q_contents, String q_date,String q_time, String q_check, String q_writer) {
		super();
		this.q_code = q_code;
		this.q_id = q_id;
		this.q_title = q_title;
		this.q_contents = q_contents;
		this.q_date = q_date;
		this.q_time = q_time;
		this.q_check = q_check;
		this.q_writer = q_writer;
	}

	  /**
     * 새로운 Q&A 글 작성을 위한 생성자
     */
	public QnaDTO(String q_id, String q_title, String q_contents, String q_check, String q_writer) {
		super();
		this.q_id = q_id;
		this.q_title = q_title;
		this.q_contents = q_contents;
		this.q_check = q_check;
		this.q_writer = q_writer;
	}

	 /**
     * Q&A 글 수정을 위한 생성자
     */
	public QnaDTO(int q_code, String q_title, String q_contents, String q_check) {
		super();
		this.q_code = q_code;
		this.q_title = q_title;
		this.q_contents = q_contents;
		this.q_check = q_check;
	}

	 /**
     * Q&A 댓글 작성을 위한 생성자
     */
	public QnaDTO(int q_code, String q_writer, String q_comment) {
		super();
		this.q_code = q_code;
		this.q_writer = q_writer;
		this.q_comment = q_comment;
	}


	







	

}
