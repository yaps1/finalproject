package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.HotKeywordVO;

@Repository
public class HotKeyWordDAO {
	public List<String> listKeyword(){
		return DBManager.listKeyword();
	}
	public int insertKeyword(String keyword) {
		return DBManager.insertKeyword(keyword);
	}
}
