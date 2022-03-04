package com.example.demo.vo;

import lombok.Data;

@Data
public class QnaVO {
	private int qna_no;
	private String qna_title;
	private String qna_date;
	private String qna_type;
	private String qna_content;
	private String qna_comment;
	private int qna_process;
	private int manager_no;
	private int member_no;
}
