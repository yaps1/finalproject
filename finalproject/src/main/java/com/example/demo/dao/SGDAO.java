package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
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
	
	
}
