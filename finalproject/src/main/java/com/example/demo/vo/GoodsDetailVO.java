package com.example.demo.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GoodsDetailVO {
	private int goods_no;
	private int goods_state;
	private String goods_content;
	private int goods_condition;
	private int goods_deliver;
	private String goods_image1;
	private String goods_image2;
	private String goods_image3;
	private String goods_image4;
	private MultipartFile[] uploadFile;
	private int cnt;
}
