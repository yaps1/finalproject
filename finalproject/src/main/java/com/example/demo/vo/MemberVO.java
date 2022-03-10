package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_nickname;
	private String member_gender;
	private String member_name;
	private String member_tel;
	private String member_birth;
	private String member_addr;
	private String member_loc;
	private String member_join;
	private double member_level;
	private int member_jointype;
	private String member_role;
}
