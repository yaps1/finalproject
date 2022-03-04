package com.example.demo.vo;

import lombok.Data;

@Data
public class GoodsVO {
	private int goods_no;
	private String goods_name;
	private int goods_price;
	private String goods_addr;
	private int goods_category;
	private String goods_date;
	private int member_no;
	private String goods_image1;
	private int cnt;
	private String member_nickname;
	private double member_level;
}
