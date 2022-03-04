package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.RestReviewVO;
import com.example.demo.vo.RestVO;

@Repository
public class RestDAO {
	
	public List<RestVO> getRestInfo(){
		return DBManager.getRestInfo();
	}
	
	public List<RestReviewVO> listRestReview(int rest_no){
		return DBManager.listRestReview(rest_no);
	}
	
	public List<RestReviewVO> listRRByMember(int member_no){
		return DBManager.listRRByMember(member_no);

	}
}
