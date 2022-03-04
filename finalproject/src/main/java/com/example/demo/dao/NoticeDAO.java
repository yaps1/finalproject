package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.NoticeVO;

@Repository
public class NoticeDAO {
	
	public static int pageSIZE = 3; //페이지에 나타날 게시글 수
	public static int totalRecord;
	public static int totalPage;
	public static int pageCount =5; //출력될 페이지수 
	public static int max;
	
	public List<NoticeVO> listNotice(HashMap map){
		
		List<NoticeVO> n = DBManager.getTotalRecordNotice(map);
		//System.out.println(n.size());
		totalRecord = n.size();
		max = DBManager.maxNotice();
		totalPage = (int)Math.ceil( totalRecord/ (double)pageSIZE);

		return DBManager.listNotice(map);
	}
	public NoticeVO findByNoNotice(int notice_no) {
		return DBManager.findByNoNotice(notice_no);
	}

	public int deleteNotice(int notice_no) {
		return DBManager.deleteNotice(notice_no);
	}
	public int insertNotice(NoticeVO n) {
		return DBManager.insertNotice(n);
	}
	public int updateNotice(NoticeVO n) {
		return DBManager.updateNotice(n);
	}
	public int hitNotice(int notice_no) {
		return DBManager.hitNotice(notice_no);
	}
}
