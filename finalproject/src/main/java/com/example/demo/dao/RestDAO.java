package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.RestVO;
import com.example.demo.vo.SGCVO;

@Repository
public class RestDAO {
	public List<RestVO> getRestInfo(){
		return DBManager.getRestInfo();
	}
}
