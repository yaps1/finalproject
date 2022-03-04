package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.RestReviewVO;

@Repository
public class RestDAO {

	public List<RestReviewVO> listRRByMember(int member_no){
		return DBManager.listRRByMember(member_no);
	}
}
