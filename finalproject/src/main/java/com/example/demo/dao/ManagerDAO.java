package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.GoodsDetailVO;
import com.example.demo.vo.GoodsVO;
import com.example.demo.vo.MemberChartVO;
import com.example.demo.vo.MemberVO;

@Repository
public class ManagerDAO {
	public List<MemberChartVO> memberByMonth() {
		return DBManager.memberByMonth();
	}
	
	public List<MemberVO> memberlevel() {
		return DBManager.memberlevel();
	}
	
	public List<GoodsVO> goodsTop3() {
		return DBManager.goodsTop3();
	}
}
