package com.example.demo.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RestReviewVO {

	private int rest_review_no;
	private String rest_review_content;
	private int rest_score;
	private String rest_image;
	private String rest_date;
	private int member_no;
	private int rest_no;
	private String member_nickname;
	
	private MultipartFile uploadFile;
}
