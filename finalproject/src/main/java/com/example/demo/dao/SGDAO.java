package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.SGCVO;
import com.example.demo.vo.SGVO;

@Repository
public class SGDAO {

	public List<SGVO> searchSGByMain(String searchkeyword){
		return DBManager.searchSGByMain(searchkeyword);
	}
	
	public List<SGVO> listSGByMember(int member_no){
		return DBManager.listSGByMember(member_no);
	}
	
	public List<SGCVO> listSGCByMember(int member_no){
		return DBManager.listSGCByMember(member_no);
	}
}
