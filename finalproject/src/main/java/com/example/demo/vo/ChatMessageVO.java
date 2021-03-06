package com.example.demo.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ChatMessageVO {
	private int message_no;
	private String message;
	private String time;
	private int member_no;
	private int room_no;
	private String member_nickname;
	private String chat_image;
	private MultipartFile uploadFile;
}
