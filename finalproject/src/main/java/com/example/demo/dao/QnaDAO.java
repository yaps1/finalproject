package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.QnaVO;
@Repository
public class QnaDAO {
	
	public static int pageSIZE = 3; //페이지에 나타날 게시글 수
	public static int totalRecord;
	public static int totalPage;
	public static int pageCount =5; //출력될 페이지수 
	
	public int insertQna(QnaVO q) {
		return DBManager.insertQna(q);
	}
	
	public List<QnaVO> listQna(HashMap mapQna){
			
			List<QnaVO> q = DBManager.getTotalRecordQna(mapQna);
			//System.out.println(q.size());
			totalRecord = q.size();
			totalPage = (int)Math.ceil( totalRecord/ (double)pageSIZE);
	
			return DBManager.listQna(mapQna);
	}
	
	public QnaVO findByNoQna(int qna_no) {
		return DBManager.findByNoQna(qna_no);
	}
	public int updateQna(QnaVO q) {
		return DBManager.updateQna(q);
	}
	
}
