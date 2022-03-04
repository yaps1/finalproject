package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.SGCVO;

@Repository
public class SGCDAO {
	//소모임 댓글 번호 
	public int getSGCNo() {
		return DBManager.getSGCNo();
	}
	
	//소모임 댓글 추가
	public int insertSGC(SGCVO sc) {
		return DBManager.insertSGC(sc);
	}
	
	//소모임 댓글 리스트
	public List<SGCVO> listSGC(int sg_no){
		return DBManager.listSGC(sg_no);
	}
	
	//소모임 댓글 개수
	public int countSGC(int sg_no) {
		return DBManager.countSGC(sg_no);
	}
	
	//소모임 댓글 수정
	public int updateSGC(SGCVO sc) {
		return DBManager.updateSGC(sc);
	}
	
	//소모임 댓글 삭제
	public int deleteSGC(int sg_comment_no) {
		return DBManager.deleteSGC(sg_comment_no);
	}
	
	/*
	//소모임 댓글번호로 불러오기
	public SGCVO findByNo(int sg_comment_no) {
		return DBManager.findByNo(sg_comment_no);
	}
	
	//소모임 대댓글 updateStep
	public void updateStep(int sg_ref, int sg_step) {
		DBManager.updateStep(sg_ref, sg_step);
	}*/
}
