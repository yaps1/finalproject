package com.example.demo.vo;



import java.util.Date;

import lombok.Data;

@Data
public class HotKeywordVO {
	private String keyword;
	private int cnt;
	private Date keyword_date;
}
