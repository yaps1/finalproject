package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVO;

@Repository
public class MemberDAO {
	
	public MemberVO detailMember(int member_no) {
		return DBManager.detailMember(member_no);
	}
	
	public int updateMember(MemberVO m) {
		return DBManager.updateMember(m);
	}

	public int deleteMember(int member_no) {
		return DBManager.deleteMember(member_no);
		
	}
}
