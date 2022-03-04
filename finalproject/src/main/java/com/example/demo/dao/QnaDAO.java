package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.QnaVO;

@Repository
public class QnaDAO {
	public List<QnaVO> listQnaByMember(int member_no){
		return DBManager.listQnaByMember(member_no);
	}
	
	public QnaVO getQna(int qna_no) {
		return DBManager.getQna(qna_no);
	}
}
