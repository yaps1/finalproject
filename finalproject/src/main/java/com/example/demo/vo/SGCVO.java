package com.example.demo.vo;

import lombok.Data;
@Data
public class SGCVO {
	private int sg_comment_no;
	private String sg_comment;
	private String sg_comment_date;
	private int sg_no;
	private int member_no;
	private String member_nickname;
	
	private int sg_ref; 	//서로 관련있는 글
	private int sg_level;	//답글 깊이
	private int sg_step;	//관련글 출력 순서

}
