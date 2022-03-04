package com.example.demo.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GBDVO {
	private int gb_no;
	private String gb_content;
	private String gb_image1;
	private String gb_image2;
	private String gb_image3;
	private String gb_image4;
	private int gb_price;
	private String member_nickname;
	private MultipartFile uploadFile;
	private MultipartFile uploadFile2;
	private MultipartFile uploadFile3;
	private MultipartFile uploadFile4;
}
