package com.example.demo.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.RestReviewVO;

@Repository
public class RestReviewDAO {
	public List<RestReviewVO> listRestReview(int rest_no){
		return DBManager.listRestReview(rest_no);
	}
}
