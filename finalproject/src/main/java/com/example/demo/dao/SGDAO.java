package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.SGCVO;
import com.example.demo.vo.SGVO;

@Repository
public class SGDAO {
	
	//한 화면에 보여줄 레코드의 수
	public static int pageSize = 10;
	//전체 레코드 수 
	public static int totalRecord;
	//전체 페이지 수
	public static int totalPage;
		
	//소모임 번호
	public int getSGNo() {
		return DBManager.getSGNo();
	}
	//소모임 등록
	public int insertSG(SGVO s) {
		return DBManager.insertSG(s);
	}
	
	//소모임 리스트
	public List<SGVO> listSG(HashMap map){
		totalRecord = DBManager.getTotalRecord();
		totalPage = (int)(Math.ceil(totalRecord/(double)pageSize));
		return DBManager.listSG(map);
	}
	
	//소모임 상세
	public SGVO getSG(int sg_no) {
		return DBManager.getSG(sg_no);
	}
	
	//소모임 수정
	public int updateSG(SGVO s) {
		return DBManager.updateSG(s);
	}
	
	//소모임 삭제
	public int deleteSG(int sg_no) {
		//return DBManager.deleteSG(sg_no, member_no);
		return DBManager.deleteSG(sg_no);
	}
	
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
