package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;

@Repository
public class HotKeyWordDAO {
	public List<String> listKeyword(){
		return DBManager.listKeyword();
	}
}
