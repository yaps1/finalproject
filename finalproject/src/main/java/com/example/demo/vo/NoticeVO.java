package com.example.demo.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private int notice_no;
	private int manager_no;
	private String notice_title;
	private String notice_date;
	private int notice_hit;
	private String notice_content;
	private String notice_file;
	private MultipartFile uploadFile;

}
