package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
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
	
	
}
